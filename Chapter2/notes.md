# Chapter 2
### Hello Haskell

mostly intro haskell stuff... install stack play in the repl

stack ghci to get the repl going

:quit or :q for short to quit

Prelude is a standard library of functions.

"in base" equals its a part of a large standard package

:info :i

Type signatures

`SayHello :: String -> IO ()`

is like saying SayHello has the type `String -> IO ()` which im guessing means its a function that takes a string and returns an IO () thingy. spooky monad stuff.

:load or :l to load files direct into repl

:m short for :module will return you from having a file loaded in to the simple prelude REPL

## Understanding Expressions

Everything in haskell is an expression or declaration. expressions may be values combinations of values and/or functions applied to values. expressions eval to a result
expressions are the building blocks which make up one big expression which is our program.

declartions are top level bindings which allow us to name expressions. bindings, bet that word is important in this context.

normal form coming up again. normal form is when an expression can no longer be reduced/evaulated. simply 1 + 1 is not in normal form, when reduced to 2 it is 2 can be reduced no further

## Functions
specific type of expression in haskell
related to math, maps inputs to outputs
applied to argument always returns result
always get same result for same values

all haskell functions are curried by default so when you pass multiple args its like applying a series of nested functions each to one arg.

functions have parameters argmuents are the values passed to those parameters

:r :reload reloads file in repl

Stuff about haskell being lazy. evaulates to weak normal head form, terms are only evaulated when they absolutely need to / are forced to

## Exercies
1. repl is updated to 8 no longer need to use let
2. timesPi x = 3.14 * x
3. timesPi x = Pi * x

stuff about infix operations, its the maths stuff or operators in-between the arguments

you can do stuff like

10 \``div`\` 4

and 

`(+) 10 4`

to turn infix to prefix operator

symbols are infix by default, named stuff are prefix by default

can use :i or :info to see operator precedence in the repl

## exercies
1. changes
2. no change
3. changes

order in haskell files does not matter as it is loaded in entirety.

# Indentation is super important! whitespace matters!

style stuff.. so dont indent after module declaration

## exercises
1. extra space in the 3.14
2. missnamed arg x should be b.
3. indenation

mod will have the same sign as the divisor

while rem while have the same sign as the dividend

(-5) \`mod\` 2

1

5 \`mod\` (-2)

-1

rem would be opposite

haskell treats negatives a bit special as seen above u cant just do `-3` you gotta do `(-3)` to keep all the precedence stuff squared away. gotta get dat syntactic sugar that - translates to the negate function

($) operator is interesting it allows everything to the right to be evaled first and can be used to delay function application

you can only load one file at a time into ghci. loading a new file unloads the previous one.

let binds stuff beforehand... and where binds stuff afterwards.. like after the expression so you can either say let something = something then do the function or do the function and say where the parameters are equal to something oohhh dont forget its let in. let some stuff equal stuff in this expression. and where is heres an expression where the stuff is these things afterwards.


hmmmmm when to use let vs where is actually a bit of a problem. they each have advantages, and when used incorrectly you can actually run into performance issues. for example there was a function using where on the wiki that showed how when you write the fib function in a certain way using where you are actually redefining the function for each evaluation and killing the perf pretty hard, and it was shown by taking a function using where and re-writing it using let syntax to point out what exactly was changed.

given the examples it looks like one place where "where syntax" might be useful is in pattern matching.