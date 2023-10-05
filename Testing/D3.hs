y = 'a' --character
x = "a"   -- list of characters



--Pairs
-- type Pokemon = (String, Int)
-- picachu :: Pokemon
-- picachu = ("Pikachu", 25)

data Pokemon = Bulbasaur | Charmander | Squirtle | Pikachu --define this like a new data type e.g Bool
--     deriving Show  -- allow us to show this one the screen
data Trainer = Ash | Misty | Brock
data Colour = Red | Blue | Green

--cooomn data types are Bool,Int,Char and [Char] aka String
vk :: Pokemon
vk = Pikachu

getStarted_Guards :: String -> String
getStarted_Guards t 
    | t == "fire" = "Charmander"
    | t == "water" = "Squirtle"
    | t == "grass" = "Bulbasaur"
    | otherwise = "Pikachu"

getStarted_Case :: String -> String
getStarted_Case t = case t of   
    "fire" -> "Charmander"
    "water" -> "Squirtel"
    "grass" -> "Bulbasaur"
    _       -> "Pikachu"

getStarted_Function_Patterns :: String -> String
getStarted_Function_Patterns "fire" = "Charmander"
getStarted_Function_Patterns "water" = "Squirtle"
getStarted_Function_Patterns "grass" = "Bulbasaur"
getStarted_Function_Patterns _ = "Pikachu"



