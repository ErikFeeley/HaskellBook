# Basic Intro Stuff
I think it is worth noting that the wording of applying a function to arguments is so specificly used in the writing early in the chapter. A function is applied to its input(s) and those input(s) are mapped to their output(s). Since haskell is a pure language a function given the same input(s) will always return the same output(s). To be specific the input set is referred to as the domain and the output set the codomain. On a personal note functional programming "feels better" to me than object oriented programming due to mathmatical background. 

Valid functions

f(1) = a

f(2) = a

f(3) = b


f(1) = a

f(2) = a

f(3) = a

Not valid

f(1) = a

f(1) = b

f(1) = c

Functions map sets of inputs to sets of outputs. it should be pure, predictable, replicateable... etc.

# Lambda Calculus
basic components of the lambda calculus also known as lambda terms
1. expressions - superset of all the lambda terms
2. variables - only names for potential inputs to functions
3. abstractions - is a function lambda term with a head(a lambda symbol) and a body and is applied to an argument, argument is an input value

Annoying... no way to make the actual lambda symbol just gonna type lambda instead...

the head of a function is the lambda symbol followed by a variable name, the body of the funcion is another expression.

sooo (lambda-symbol)x.x means its a function with a variable x... its the identity function, when the function is applied to an argument say like 1 each x in the body is replaced by that argument. these basic lambda functions are also anonymous. the (.) dot symbol is what seperates the parameters from the function body

# Alpha Equivalence
basically is saying that (lamdba)x.x (lambda)y.y and (lambda)z.z all mean the exact same thing. they are all the same function 

# Beta Reduction
ok so beta reduction is the process of applying the function to an argument. the head of the function like (lamda)x is killed off since its purpose was to bind the variable, in this case x. All x(s) in the body are now bound to that argument from the applied head of the function.

Example

(lamda)x.x 2

we apply the function to the argument 2

therefore the x in the body of the function recieves the value 2

soooo

(lambda)x.x 2

equals

2

again this is the indentity function

little more complex

((lambda)x.x + 1) 2

apply the function to the argument 2

x is bound

body of the function now equals 2 + 1

reduces to 3

it equals to 3

wee

apply function to an argument substitute the input expression for all instances of bound variables within the body of the abstraction

again apply the lambda term to an argument replace the bound variables with the value of the argument eliminate the head (lambda) of the function signifying it has been applied

so how about
((lambda)x.x)((lambda)y.y)
this basically says we apply the first function to the second function
therefore the entirety of the second function is the argument that is bound by/to x

using some extra terminology

((lambda)x.x)((lambda)y.y)

[x := ((lambda)y.y)]

returns

(lambda)y.y

not suprising right
the identity function just returns what you give it even when what you give is is another identity function

soooo how about

((lambda)x.x)((lambda)y.y) z

applications in lambda calculus are left associative so unless parens says otherwise they associate/group to the left

so we can rewrite as

(((lambda)x.x)((lambda)y.y)) z

[x := (lambda)y.y]

((lambda)y.y) z

[x := z]

z

summarize... the identity function x is applied to the identity function y, then the resulting lambda function is applied to z, since that to is a indentiy function the final result is z.

functions can also have multiple heads and free variables, which are variables in the body that are not bound by the head.

beta reduction stops when there are either more heads/lamdas left to apply or no more arguments to apply to.

# Free Variables
the head of the function is for telling us which variables to replace when we apply our function that is to bind the variables. a bound variable must be the same value throughout the expression. sometimes the body expression will have variables that are not named in the head aka free variables

example

(lambda)x.xy

the y is not bound by the head so when we apply this function to some argument we cannot do anything with the y therefore it is left over. lets give it a go

((lambda)x.xy) z

[x := z]

zy

aaaand were done. to recap we apply the function to the argument z, x is bound to z and the x in the body of the function becomes z giving us zy. we now have not more heads to apply and have reached an irreducible form. sooo were doneeeeee

note on alpha equivalence, the following are not the same who knows what z or y are!!!

(lambda)x.xz

(lambda)x.xy

the following are the same tho

(lambda)xy.yx

(lambda)ab.ba

(lambda)x.xz

(lambda)y.yz

final 2 the important bit is the free variable being left alone

# multiple args
hmmm each lambda can only bind one parameter and can only accept one argument functions that require multiple arguments have multiple nested heads. when you apply it once and elminate the leftmost head the next one gets applied and so on etc...the term for this is currying!

example

(lambda)xy.xy

is just shorthand for two nested lambdas

this will get annoying to type out...

(lambda)x.(lambda)y.xy

sooooo when you apply the first arg you are binding x eliminating the outer lambda

lets take a peak

((lambda)xy.xy) 1 2

((lambda)x.(lambda)y.xy) 1 2

apply the first lambda, bind 1 to x or is it bind x to 1, does it matter?

[x := 1]

((lambda)y.1y) 2

[x := 2]

1 2

i dont think it implied that we would multiply at the end i think we just stop here since we have finished all beta reduction and are left with 1 and 2.

so ya nested identity functions above, lets try something more interesting

`((lambda)xy.xy) ((lambda)z.a) 1`

lets break it down

`((lambda)x.((lambda)y.xy)) ((lambda)z.a) 1`

`[x := (lambda)z.a]`

`(lambda)y.((lambda)z.a)y 1`

`[y := 1]`

`((lambda)z.a) 1`

`[z := 1]`

`a`

wait why is it just a like that... well since there is no z in the body it just gets dropped off and we still eliminate the head simply leaving the a

lets get wierd

`((lambda)xyz.xz(yz))((lambda)mn.m)((lambda)p.p)`

`((lambda)x.(lambda)y.(lambda)z.xz(yz)) ((lambda)m.(lambda)n.m) ((lambda)p.p)`

apply the first lambda x to the first argument which is the second lambda function

`[x := ((lambda)m.(lambda)n.m)]`

`((lambda)y.(lambda)z.((lambda)m.(lambda)n.m)z(yz)) ((lambda)p.p)`

next up apply the lambda y to the arg lambda p function

`((lambda)z.((lambda)m.(lambda)n.m)z((lambda)p.p)z)`

this is nutty

so there is no arg on the "outside" to apply to the lambda z. so we move in and find that the next thing we can work on the the lambda m which we can apply to z now things are left assoc, so we dont grab the last z we grab the first z as an argument and apply the lambda m to it.

`[m := z]`

`(lambda)z.((lambda)n.z)(((lambda)p.p)z)`

next up we can apply the lamba n function

`[n := ((lambda)p.p)z)]`

welll there is no n left so that essentially gets dropped

`(lambda)z.z`

oddly left with an irreducible lambda z expression

# intermission equivalence stuff
1. b
2. c
3. b

# Evaluation is Simplification
multiple normal forms in lambda calc here when we say normal form we mean beta normal form meaning you can no longer beta reduce. 

its like saying 2000 / 1000 instead of 2, u dont do that, 2 is the normal form 2000 / 1000 the divisor operator has not been fully applied and the function has not been fully evaluated so we can do that and get the normal form 2.

satuerated means all arguments have been applied so in division 2000 / 1000 is saturated. 

# Combinators
a combinator is a lambda term with no free variables and only serve to combine the arguments they are given

the following are combinators as every term in the body occurs in the head

1. (lambda)x.x
2. (lambda)x.xy
3. (lambda)xyz.xz(yz)

these are not due to free variables

1. (lamda)y.x
2. (lambda)x.xz

# Divergence
sooo sometimes following the beta reduction process causing divergence instead of converging to a final value. soo it essentially never ends as it will keep diverging.

example

`((lambda)x.xx)((lambda)x.xx)`

`[x := (lambda)x.xx]`

`((lambda)x.xx)((lambdax.xx))`

so your back to the start. infinite loop

# Summary
functional programming is based on expressions the include variables or constant values, expressions combined with other expressions, and functions

functions have head a body, head is applied to arguments and then reduce/evalute to the result

variables are bound, and must have the same value in the body

all functions take one arg and return one result, aka currying

functions map from a set of inputs the domain to a set of outputs the codomain

all of this applies to haskell and other pure functional programming languages. haskell is a lambda calculus a typed one specifically 

# Chapter Exercises

## Combinators
1. true
2. false
3. true
4. true
5. false

## Normal or Diverge
1. normal
2. diverge
3. normal

## beta reduce

not doin.... sry.. to much parens and typing...

