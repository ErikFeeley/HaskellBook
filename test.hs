sayHello :: String -> IO ()
sayHello x =
    putStrLn ("Hello, " ++ x ++ "!")

-- what is the significance of () in the above IO monad
tripple :: Integer -> Integer
tripple x =
    x * 3

multiplyByPie :: Integer -> Float
multiplyByPie r =
    pi * (fromInteger r * fromInteger r)