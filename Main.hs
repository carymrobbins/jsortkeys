{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}

import Control.Monad
import Data.Aeson
import Data.Aeson.Encode.Pretty
import Data.Maybe
import System.Environment
import System.Exit
import qualified Data.ByteString.Lazy.Char8 as LC8
import qualified Data.Text as Text

main :: IO ()
main = do
  sortKeys <- map Text.pack <$> getArgs
  when ("--help"  `elem` sortKeys) $ do
    putStrLn "Sorts JSON from stdin given an explicit key order"
    putStrLn "Usage: jsortkeys [key1 [key2 [..]]]"
    putStrLn ""
    putStrLn "Example:"
    putStrLn "$ jsortkeys foo bar <<< '{\"bar\":1,\"foo\":2}'"
    putStrLn "{\"foo\":2,\"bar\":1}"
    exitSuccess
  json :: Value <- either error id . eitherDecode <$> LC8.getContents
  let conf = defConfig
        { confIndent = Spaces 2
        , confCompare = keyOrder sortKeys
        }
  LC8.putStrLn $ encodePretty' conf json
