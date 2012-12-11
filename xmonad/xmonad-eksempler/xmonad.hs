-- Default stuff used.
import Data.Map (unions, fromList)
import Data.List (partition)
import Control.Monad (liftM2)

import XMonad

-- Enable topic related namespaces with hooks. The hooks are run if the
-- workspaces are empty
import XMonad.Actions.TopicSpace (checkTopicConfig)

import XMonad.Util.Run
import XMonad.Util.EZConfig
import XMonad.Hooks.DynamicLog

-- Makes XMonad set the _NET_WM_WINDOW_OPACITY atom for inactive windows, which
-- causes those windows to become slightly translucent if something like
-- xcompmgr is running.
import XMonad.Hooks.FadeInactive (fadeInactiveLogHook)

-- My Custom XMonad
import XMonad.Stack.MyTopics (myTopics, myTopicConfig)
import XMonad.Stack.MyConfig (myConfig)
import XMonad.Stack.MyLayout (myLogHook) -- myStatusBar, myConkyBar, myDzenPP

-- myStatusBarPipe <- spawnPipe myStatusBar
-- conkyBar <- spawnPipe myConkyBar
-- xmobar <- spawnPipe "xmobar ~/.xmonad/xmobarrc"

main = do xmobar <- spawnPipe "xmobar ~/.xmonad/xmobarrc"
          checkTopicConfig myTopics myTopicConfig
          xmonad $ myConfig {
            logHook = do
               -- Sets transparancy on non focused windows.
               fadeInactiveLogHook 0.7
               myLogHook xmobar
               --dynamicLogWithPP $ myDzenPP myStatusBarPipe
            }
