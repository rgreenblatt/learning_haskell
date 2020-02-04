import           Test.Hspec
import           Data.List
import           Test.QuickCheck
import           Control.Exception              ( evaluate )
import           Sort

main :: IO ()
main = hspec $ describe "Sort.quickSort" $ do
  it "sorts str lists" $ property $ \xs -> quickSort xs == sort (xs :: String)
  it "sorts int lists" $ property $ \xs -> quickSort xs == sort (xs :: [Int])
