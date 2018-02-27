module Learn where

x = 10 * 5 + y

myResult = x * 5

y = 10

multi = x * y where
    x = 5
    y = 6

stuff = x * 3 + y where
    x = 3
    y = 1000

otherStuff = x * 5 where
    y = 10
    x = 10 * 5 + y

lastStuff = z / x + y where
    x = 7
    y = (-x)
    z = y * 10