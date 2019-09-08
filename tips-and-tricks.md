# Apple II One- and Two-Liners: Tips & Tricks

* [Introduction](#introduction)
* [The Basics](#the-basics)
  * [Program Length](#program-length)
  * [Line Numbers](#line-numbers)
  * [White Space](#white-space)
* [Flow Control](#flow-control)
  * [The (New) Power of FOR-NEXT](#the-new-power-of-for-next)
  * [User Input](#user-input)
* [More Optimizations](#more-optimizations) 
  * [Creative Refactoring](#creative-refactoring)

## Introduction
There are a couple of obsolete categories of programs that I find intriguing, called "one-liners" and "two-liners." These are programs that are written using only one or two lines of code which, ideally, do something _interesting_. Nibble Magazine, popular in the 80's for its lengthy printouts of Applesoft and machine language programs that readers could manually type in, gave me my first glimpse into the world of one- and two-liners. It held a contest where programmers could submit their miniature programs, and the editors would publish the winning programs every month. 

Since the only limitation was that these programs fit into one or two lines of code, the variety of topics that they covered was broad. Some programs did "useful" things like calculate gas mileage, while others bounced a ball around the screen. Still others did amazing things like fill the display with three-dimensional imagery or play music... all in one or two lines of code!

While my adolescent mind was blown on a monthly basis by these contest winners, I was also learning a great deal about algorithms and code optimization by picking apart these programs to understand how programmers accomplished these feats. Some of those learnings I still carry with me today. While the tips and tricks below are very specific to Applesoft, there is probably some broader lesson to be learned about joy and programming. I'll let you figure that part out for yourself. :)

## The Basics

### Program Length
We're trying to make Applesoft do interesting things in one or two lines of code, but how long can a single line of code be? When typing in a really long line at the Applesoft prompt, you may have noticed that the computer starts beeping at character 249. This is the system warning you that you're approaching the max line length, and that your input will be rejected when you go over 255 characters. What's really interesting, and what I was recently surprised to learn was that Applesoft actually rejects all input after 239 characters. 

**TIP:** You are limited to **239 characters per line**. One nice thing about this number is that it comes out to exactly 6 full rows of 40-column text (including the "]" prompt). If you go over 6 rows, you'll know you've gone over budget.

### Line Numbers
This one's super easy. Line numbers count toward your 239-character budget, so stick to single-digits. This should be easy since you're optimizing for just one or two lines.

**TIP:** Keep it simple, **start your program at line 0**. If you're writing a two-liner, impress your friends and **make the second line number 1**.

### White Space
Another easy one: Don't use whitespace. With few exceptions, Applesoft is really good at parsing code with no spaces.

```Applesoft
0FORN=0TO1:?".";:N=PEEK(-16384)>128:NEXT:GETA$
```

**TIP:** **Don'tuseanyspaces** "Except in strings."

**NOTE:** I may _include_ spaces for clarity in some of the examples below.

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

## More Optimizations

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

Since we only exit the loop when a key is pressed, we know that the `GET` will immediately consume that keypress and not pause the program. We've gone from 70 characters to 42 characters!

Let's look at the progression again.

``` Applesoft
0 FOR N = 0 TO 1 : PRINT N; : N = PEEK(-16384) > 127 : NEXT : POKE -16368,0
0FORN=0TO1:PRINTN;:N=PEEK(-16384)>127:NEXT:POKE-16368,0
0FORN=0TO1:?N;:N=PEEK(-16384)>127:NEXT:POKE-16368,0
0FORN=0TO1:?N;:N=PEEK(49152)>127:NEXT:POKE49168,0
0FORN=0TO1:?N;:N=PEEK(-4^7)>127:NEXT:POKE49168,0
0FORN=0TO1:?N;:N=PEEK(-4^7)>127:NEXT:GETA$
```

If you've been running each step in our optimization, you may have noticed that computing`-4^7` is a bit slower than the previous iterations. It saves a character, but at the expense of speed. This is a trade-off that I usually don't make unless I absolutely need that one extra character, but this section is about optimizing the number of characters.

Can we make it shorter? I'm not sure, but let's try some stuff...

### Creative Refactoring

Our infinite looping `FOR-NEXT` construct is serving us well, but it's worth noting that counting from 0 to 1 is fairly arbitrary. In our case, the first factor could be any number less than one, such as 0 or -10 or -1000.

``` Applesoft
0FORN=-1000TO1:?N;:N=PEEK(-4^7)>127:NEXT:GETA$
```

This really doesn't do anything for us, but it illustrates an important aspect of optimization: Thinking creatively and keeping an open mind. What happens if we change the second factor to 2?

``` Applesoft
0FORN=0TO2:?N;:N=PEEK(-4^7)>127:NEXT:GETA$
```

Uh oh. Our program is broken. Pressing a key no longer ends it. :( Why? Because we changed the exit criteria. The second factor determines whether the `NEXT` loops or continues to the next statement. Remember, `NEXT` increments and _then_ tests. We're setting `N` to 0 or 1, so the subsequent `NEXT` will increment it to 1 or 2. It will never be greater than 2, which is the second factor in our `FOR` statement, therefore the loop will never end.

Even though we broke our program, this is interesting. 

``` Applesoft
0FORN=0TO127:?N;:N=PEEK(-4^7):NEXT:GETA$
```

Instead of testing if the keypress strobe `PEEK(-4^7)` is greater than 127, why not let `NEXT` do the test for us? Note the program now repeatedly outputs the result of the PEEK until a key is pressed, which sets `N` to the ASCII code of the pressed key _plus 128_, which causes the `NEXT` to continue. This program started at 75 characters and we managed to shave off a whopping 35 characters! The final program is 40 characters. Can you make it even shorter?

| Peek/Poke | Function |
| - | - |
| X = PEEK(49152) | Strobes the keyboard |
| POKE 49168,0 | Clears the keyboard strobe |
| X = PEEK(49200) | Clicks the speaker |
