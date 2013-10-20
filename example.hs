import Control.Monad.List
import Data.IORef
import System.Environment(getArgs) 

test1 :: ListT IO Int
test1 = do
  r <- liftIO (newIORef 0)
  (next r `mplus` next r >> next r `mplus` next r) >> next r `mplus` next r
 
test2 :: ListT IO Int
test2 = do
  r <- liftIO (newIORef 0)
  next r `mplus` next r >> (next r `mplus` next r >> next r `mplus` next r)
 
next :: IORef Int -> ListT IO Int
next r = liftIO $ do  x <- readIORef r
                      writeIORef r (x+1)
                      return x

main = do
  arg <- getArgs
  case head arg of 
    "1" -> runListT test1
    _   -> runListT test2
