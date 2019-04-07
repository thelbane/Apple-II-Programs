# One- and Two-Liners: Tips & Tricks

## The Basics

### Program Length
Duh. But is it truly duh? Perhaps not. We're trying to make Applesoft do interesting things in one or two lines of code, but how long can a single line of code be? When typing in a series of commands or a program line at the Applesoft prompt, you may have noticed it starts beeping at character 249 to warn you that you're approaching the max line length, and rejects the input when you go over 255 characters. You might be surprised to learn (just as I was) that Applesoft rejects all input after character 239. 

**TIP:** You are limited to **239 characters per line**. One nice thing about this number is that it comes out to exactly 6 full rows of 40-column text (including the "]" prompt). If you go over 6 rows, you'll know you've gone over budget.

### Line Numbers
This one's super easy. Line number count toward your 230 character budget, so stick to single-digits. This should be easy since you're optimizing for just one or two lines.

**TIP:** Keep it simple, **start your program at line 0**. If you're writing a two-liner, impress your friends and **make the second line number 1**.

### White Space
Another easy one: Don't. With few exceptions, Applesoft is incredibly good at parsing code with no spaces.

```Applesoft
0FORN=0TO1:?".";:N=PEEK(-16384)>128:NEXT:GETA$
```

**TIP:** **Don'tuseanyspaces** "Except in strings."

**NOTE:** Throughout most of the examples below, I will _include_ space for clarity.

## Flow Control
Now let's jump into some of the tricky tricks. Your old friends `GOTO`, `GOSUB`, and `IF` are not welcome in this dojo... at least, not in most of the cases where you would typically use them. This is not to say that you should never use them, but that you'll be _less likely_ to use them for your one- and two-liners.

For example, let's say you're writing a program that uses the hi-res screen to do _something interesting_ infinitely...

(The spaces are just to make it easier to visually parse. Don't do this in production code!)

```Applesoft
0 HGR : { DO INTERESTING THINGS HERE }
```

You can't use `GOTO 0` to loop the interesting part because it will clear the screen every time. What are we to do?

### The (New) Power of FOR-NEXT

`FOR` is an obvious choice for repeating work a specific number of times, but it might not be so obvious if you want to repeat work indefinitely in a single line of code.

```Applesoft
HOME : FOR N = 0 TO 1 : PRINT N; : N = 0 : NEXT
```

This looks pretty simple, but let's examine what this line does.

1. `HOME` clears the screen.
1. A `FOR` loop is initialized and `N` is set to 0.
1. "0" is printed to the screen (no carriage return).
1. `N` is set to 0 (which it already is).
1. `NEXT` increments `N` to 1 and tests to see if it's higher than one. It's not, so it loops.
1. "1" is printed to the screen (no carriage return).
1. `N` is set back to 0.
1. Jump up to item 5 above and repeat forever.

As you probably guessed, the output of this line of code is: `0111111111111111111...` (repeating "1" forever)

**TIP:** Modify the iterator variable in `FOR-NEXT` loops to conditionally repeat code.

### User Input

Let's modify the previous example to stop when the user presses any key, instead of repeating forever:

``` Applesoft
FOR N = 0 TO 1 : PRINT N; : N = PEEK(-16384) > 127 : NEXT : POKE -16368,0
```

What's going on here? Instead of just resetting N to 0 every time like in the previous example, we're setting it to the result of the expression `PEEK(-16384) > 127` which incidentally returns 1 if a key is pressed and 0 if no key is pressed. BTW, If we don't subsequently `POKE -16368,0`, the keypress will remain in the buffer until some inopportune time, such as at the next Applesoft prompt, where it'll just dump out and look ugly, forcing the user to arrow-key to the left. I'll cover interesting PEEKs and POKEs later.

### Basic Optimization (aka "-16384 or 49152 or -4^7")

Let's examine the last example again, except as a program starting with line 0.

``` Applesoft
0 FOR N = 0 TO 1 : PRINT N; : N = PEEK(-16384) > 127 : NEXT : POKE -16368,0
```

That's pretty short, but it contains a lot of unnecessary white space. Let's remove it.

``` Applesoft
0FORN=0TO1:PRINTN;:N=PEEK(-16384)>127:NEXT:POKE-16368,0
```

Better. But every Applesoft aficionado knows `PRINT` is just long-hand for `?`.

``` Applesoft
0FORN=0TO1:?N;:N=PEEK(-16384)>127:NEXT:POKE-16368,0
```

Also, negative POKEs and PEEKs have a positive representation. Just add 65536.

``` Applesoft
0FORN=0TO1:?N;:N=PEEK(49152)>127:NEXT:POKE49168,0
```

Can we do better? You betcha.

``` Applesoft
0FORN=0TO1:?N;:N=PEEK(-4^7)>127:NEXT:POKE49168,0
```

Every character counts!

``` Applesoft
0FORN=0TO1:?N;:N=PEEK(-4^7)>127:NEXT:GETA$
```

Since we only exit the loop when a key is pressed, we know that the `GET` will immediately consume that keypress and not pause the program.

Let's look at the progression again.

``` Applesoft
0 FOR N = 0 TO 1 : PRINT N; : N = PEEK(-16384) > 127 : NEXT : POKE -16368,0
0FORN=0TO1:PRINTN;:N=PEEK(-16384)>127:NEXT:POKE-16368,0
0FORN=0TO1:?N;:N=PEEK(-16384)>127:NEXT:POKE-16368,0
0FORN=0TO1:?N;:N=PEEK(49152)>127:NEXT:POKE49168,0
0FORN=0TO1:?N;:N=PEEK(-4^7)>127:NEXT:POKE49168,0
0FORN=0TO1:?N;:N=PEEK(-4^7)>127:NEXT:GETA$
```

| Peek/Poke | Function |
| - | - |
| X = PEEK(49152) | Strobes the keyboard |
| POKE 49168,0 | Clears the keyboard strobe |
| X = PEEK(49200) | Clicks the speaker |

### User Input
Patience.

### Strings
Patience.
