import qualified Data.List as L
import Data.Char
import qualified Data.Map as M
import System.Environment
import Control.Monad

type Dict = M.Map String [String]

wordToKey :: String -> String
wordToKey = L.sort . filter isLetter . map toLower

addWord :: String -> Dict -> Dict
addWord word = M.insertWith (++) (wordToKey word) [word]

buildDictionary :: [String] -> Dict
buildDictionary strings = foldr addWord M.empty strings

anagrams :: Dict -> String -> [String]
anagrams dict word = maybe [] id $ M.lookup (wordToKey word) dict

{-
main = do
  str <- readFile "words"
  let dict = buildDictionary $ lines str
  args <- getArgs
  mapM_ putStrLn $ anagrams dict $ head args
-}

words = [
  ]
