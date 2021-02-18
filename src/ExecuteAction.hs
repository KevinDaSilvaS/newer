module ExecuteAction where

import Errors

executeAction :: Maybe (t -> IO ()) -> t -> IO ()
executeAction (Just action) args = action args
executeAction Nothing _ = actionNotExist