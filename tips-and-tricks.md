# One- and Two-Liners
## Tips and Tricks

### Program Length
Duh. But is it truly duh? Perhaps not. We're trying to make Applesoft do interesting things in one or two lines of code, but how long can a single line of code be? When typing in a command or program line at the Applesoft prompt, you may have noticed it starts beeping at character 249 to warn you that you're approaching the max line length, and rejects the input when you go over 255 characters. You might be surprised to learn (just as I was) that Applesoft rejects all input after character 239. 

**TIP:** You are limited to **239 characters per line**.

### Line Numbers
This one's super easy. Line number count toward your 230 character budget, so stick to single-digits. This should be easy since you're optimizing for just one or two lines.

| Tip |
| --- |
| Keep it simple, **start your program at line 0**. |
| If you're writing a two-liner, impress your friends and **make the second line number 1**. |

### White Space
Another easy one: Don't. With few exceptions, Applesoft is incredibly good at parsing code with no spaces.

`0FORN=0TO1:?".";:N=PEEK(-16384)>128:NEXT:GETA$`

**TIP:**  **Don'tuseanyspaces** "Except in strings."

### Flow Control
This is one of the trickier aspects of trying to do useful things in one or two lines of Applesoft. Your old friends `GOTO`, `GOSUB`, and `IF` are not welcome in this dojo (at least, not in most of the cases where you would normally use them).

For example, let's say you're writing a program that uses the hi-res screen to do _something interesting_ infinitely...

(The spaces are just to make it easier to visually parse. Don't do this in production code!)

`0 HGR : { DO INTERESTING THINGS HERE }`

You can't use `GOTO 0` to loop the interesting part because it will clear the screen every time.

`FOR` is the obvious choice for repeating work a specific number of times, but it might not be so obvious if you want to do work indefinitely.

`FOR N = 0 TO 1 : PRINT "."; : N = 0 : NEXT`

Or if you want to conditionally exit a loop on keypress.

`FOR N = 0 TO 1 : PRINT "."; : N = PEEK(-16384) > 127 : NEXT : GET A$`

What's happening above is instead of just resetting N to 0 every time like in the previous example, we're setting it to the result of the expression `PEEK(-16384) > 127` which incidentally returns 1 if a key is pressed and 0 if no key is pressed. (BTW, If we don't `GET A$`, the keypress will remain in the buffer until some inopportune time, such as at the next Applesoft prompt, where it'll just dump out and look ugly, forcing the user to arrow-key to the left.)

### User Input
Patience.

### Strings
Patience.
