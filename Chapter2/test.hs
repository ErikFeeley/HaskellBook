sayHello :: String  -> IO ()
sayHello x =
    putStrLn ("Hello, " ++ x ++ "!")

tripple x =
    x * 3

timesPi x =
    pi * x