module GreetIfCool1 where

greetIfCool :: String -> IO ()
greetIfCool coolness =
        if cool
            then putStrLn "eyy whats shakin"
        else
            putStrLn "pshhh"
        where cool =
                coolness == "downright frost yo"