import System.IO
import System.Environment
import Language.Fixpoint.Types
import Language.Fixpoint.Parse
import Text.PrettyPrint.HughesPJ

main = do
  cfg <- getArgs
  fq <- faultLocal $ head cfg
  print stdout $ toFixpoint fq

faultLocal :: String -> IO (FInfo ())
faultLocal file  = do
  fstr <- readFile file 
  let fq = rr' file fstr :: FInfo ()
  return fq
  
