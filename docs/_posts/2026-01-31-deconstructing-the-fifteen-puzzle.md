---
layout: post
title: Deconstructing the Fifteen Puzzle
tags: updates
author: Lee Fastenau
---
A while back, someone on the [Apple II subreddit](https://www.reddit.com/r/apple2/comments/1qsi4f2/comment/o2vrffy/) asked me to break down how the [Fifteen Puzzle](/programs/2024/04/13/fifteen-puzzle.html) two-liner works. I thought it might make for a fun blog post, so here we go.

<!--more-->

## The Code

First, let's look at the code in its original, compressed glory:

{% capture source_code -%}
0POKE184,21+(Z=0)*84:POKE50,63+192*(N=P):R%=N/4:HTAB3*(N-R%*4)+1:VTAB2*R%+1:A$=STR$(T(N))+"   ":?MID$(A$,1+(N=P)*2,2):RETURN:Z=1:HOME:DIMT(16):FORN=0TO15:T(N)=N:NEXT:N=INT(RND(1)*14)+1:T(N)=N+1:T(N+1)=N:FORN=0TO15:GOSUB0:NEXT
1FORT=0TO14:POKE184,216+(T(T)<>T+1)*4:NEXT:END:GETA$:A=ASC(A$):K=A>72ANDA<78:X=-SGN(A-75)*(A<>73)*K:Y=-SGN(A-74)*(A<>76)*K:R%=P/4:C=P-R%*4:C=C+X*(ABS(C+X-1.5)<2):R%=R%+Y*(ABS(R%+Y-1.5)<2):Q=R%*4+C:T(P)=T(Q):N=P:P=Q:GOSUB0:N=P:GOSUB0:GOTO1
{%- endcapture %}{% include applesoft.md src=source_code %}

Yeah. That's... a lot to take in. Let's break it down piece by piece.

## The Secret Sauce: POKE 184

Before we dive in, I need to explain the most important trick in this program: `POKE 184`. This is the "goto in disguise" that makes two-liners possible.

Memory location 184 holds the position within the current line where Applesoft will continue executing. By POKEing a new value here, we can skip forward (or backward!) within the same line. It's like a conditional GOTO, but without wasting precious characters on an actual GOTO statement.

You'll see this pattern throughout:

```
POKE184,value1+(condition)*offset
```

When the condition is true (equals -1 in Applesoft), it adds the offset. When false (equals 0), it doesn't. This lets us branch within a single line.

## Line 0: Setup and Display Subroutine

Here's where things get a little weird. Line 0 serves two purposes:

1. **A subroutine** (at the start) that draws a single tile
2. **Initialization code** (after the RETURN) that runs once at startup

Wait, how does that work? When the program runs, we need to skip past the subroutine to get to the initialization. That's what this does:

```
POKE184,21+(Z=0)*84
```

On the first run, `Z` is 0 (uninitialized variables default to zero), so `(Z=0)` is true (-1), and we add 84 to position 21, jumping us to position 105 in the line—right after the RETURN where `Z=1` waits for us. After that first run, `Z=1`, so subsequent GOSUBs execute the subroutine normally.

### The Tile Drawing Subroutine

```
POKE50,63+192*(N=P)
```

This toggles between normal and inverse text mode. `POKE 50,63` is normal; `POKE 50,255` is inverse. When `N=P` (we're drawing the empty tile position), we get inverse mode—which shows up as a solid block.

```
R%=N/4
```

Integer division to get the row (0-3) from tile index (0-15).

```
HTAB3*(N-R%*4)+1:VTAB2*R%+1
```

Position the cursor. `N-R%*4` gives us the column (0-3). We multiply by 3 for spacing and add 1 because HTAB/VTAB are 1-indexed. Rows are doubled (`2*R%`) to give the tiles some breathing room.

```
A$=STR$(T(N))+"   ":?MID$(A$,1+(N=P)*2,2)
```

Convert the tile value to a string, pad it with spaces, then print exactly 2 characters. The `1+(N=P)*2` offset is clever: normally we start at position 1, but for the empty tile (`N=P`), we start at position 3—which grabs two spaces instead of the number.

```
RETURN
```

End of subroutine!

### The Initialization Code

After the RETURN (which we skip on first run, remember?):

```
Z=1:HOME:DIMT(16)
```

Set our "been here" flag, clear the screen, dimension the tile array.

```
FORN=0TO15:T(N)=N:NEXT
```

Initialize tiles. T(0)=0, T(1)=1, etc.

```
N=INT(RND(1)*14)+1:T(N)=N+1:T(N+1)=N
```

Here's a subtle but important detail: not all tile arrangements are solvable. Rather than doing a proper shuffle (which would require checking solvability), we just swap two adjacent tiles. This guarantees the puzzle is exactly one swap away from being solved... but you can't just undo that one swap directly. You'll have to work for it.

```
FORN=0TO15:GOSUB0:NEXT
```

Draw all 16 tiles.

## Line 1: The Game Loop

Line 1 handles win detection, input processing, and tile movement.

### Win Detection

```
FORT=0TO14:POKE184,216+(T(T)<>T+1)*4:NEXT:END
```

For each of the first 15 positions (0-14), check if the tile matches its solved value (position+1). If any tile is wrong, `T(T)<>T+1` is true, and we POKE forward 4 characters—just enough to skip past `END` and continue the game loop. If all tiles are correct, we fall through to END and the program stops. Victory!

### Input Processing

```
GETA$:A=ASC(A$)
```

Get a keypress and convert to ASCII.

```
K=A>72ANDA<78
```

Valid keys are I, J, K, L (ASCII 73-76). This sets K to true if the key is in that range.

```
X=-SGN(A-75)*(A<>73)*K
Y=-SGN(A-74)*(A<>76)*K
```

This is dense, so let's unpack it:

- For **J** (ASCII 74): `SGN(74-75)=-1`, negated gives +1, but wait... we also need `(A<>73)` which is true, and `K` which is true. So X=-1 (move left).
- For **L** (ASCII 76): `SGN(76-75)=1`, negated gives -1, so X=+1 (move right).
- For **I** or **K**: The `(A<>73)` or `(A<>76)` clause zeroes out X, so it becomes 0.

The Y calculation works similarly but for up/down movement with I and K.

### Bounds Checking and Movement

```
R%=P/4:C=P-R%*4
```

Get row and column of the empty tile (position P).

```
C=C+X*(ABS(C+X-1.5)<2)
R%=R%+Y*(ABS(R%+Y-1.5)<2)
```

The `ABS(...-1.5)<2` trick checks if the new position would be in bounds (0-3). If C+X would be -1 or 4, the expression is false and the movement is cancelled.

```
Q=R%*4+C
```

Calculate the new empty position.

```
T(P)=T(Q)
```

Move the tile from Q into the old empty position P.

```
N=P:P=Q:GOSUB0:N=P:GOSUB0
```

Update P to the new empty position, then redraw both affected tiles.

```
GOTO1
```

Loop forever (or until you win).

## Wrapping Up

So there you have it—a fully functional sliding puzzle in two lines of Applesoft BASIC. The key tricks are:

1. **POKE 184** for conditional branching within a line
2. **Subroutine-before-RETURN** pattern to pack more logic into line 0
3. **Boolean expressions as multipliers** for compact conditionals
4. **Clever math** for bounds checking and input decoding

Is it readable? Absolutely not. Is it fun to figure out? I think so. These two-liner challenges are like little puzzles themselves—which feels appropriate for a puzzle game.
