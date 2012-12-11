module XMonad.Stack.MyLayout
       (
         myLayoutHook
       , myLogHook
       )
       where

-- Make a given layout display without borders. This is useful for full-screen
-- or tabbed layouts, where you don't really want to waste a couple of pixels of
-- real estate just to inform yourself that the visible window has focus.
import XMonad.Hooks.ManageDocks

import XMonad.Layout
import XMonad.Layout.NoBorders (smartBorders)
import XMonad.Layout.ResizableTile
-- A tabbed layout for the Xmonad Window Manager
import XMonad.Layout.Tabbed

import Data.Ratio
import XMonad.Util.Run
import XMonad.Util.EZConfig
import XMonad.Hooks.DynamicLog


import XMonad.Stack.MyTopics (myTopics)


-- Layouts
myLayoutHook = myLayoutMod (tiled ||| Mirror tiled ||| Full)
  where
    tiled   = ResizableTall nmaster delta ratio []
    nmaster = 1
    ratio   = 1/2
    delta   = 4/100
    myLayoutMod x = smartBorders $ avoidStruts x


-- Logs
myLogHook xmobar = dynamicLogWithPP $ defaultPP { 
  ppCurrent = xmobarColor "#429942" "" . wrap "[" "]"
  , ppUrgent  = xmobarColor "red" "" . wrap "[" "]"
  , ppTitle   = shorten 100
  , ppSep = xmobarColor "#555" "" " | "
  , ppOutput  = hPutStrLn xmobar
  , ppLayout = \x -> case x of
    "ResizableTall" -> "T"
    "Mirror ResizableTall" -> "M"
    "Full" -> "F"
    _ -> "?" }

{-
-- ion3 clean style
myTabConfig :: TConf
myTabConfig = defaultTConf {
  activeColor         = "#8a999e" 
  , inactiveColor       = "#545d75"
  , activeBorderColor   = "white"
  , inactiveBorderColor = "grey"
  , activeTextColor     = "white"
  , inactiveTextColor   = "grey"
  , tabSize             = 15
  } -}