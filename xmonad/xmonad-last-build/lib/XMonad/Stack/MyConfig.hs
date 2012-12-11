module XMonad.Stack.MyConfig
       (
         myConfig
       )
       where

import XMonad

import qualified XMonad.StackSet as W
import qualified Data.Map as M

-- This module provides a config suitable for use with the KDE desktop
-- environment.
--import XMonad.Config.Kde (kde4Config)

import XMonad.ManageHook (liftX)
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.DynamicLog

-- Makes XMonad set the _NET_WM_WINDOW_OPACITY atom for inactive windows, which
-- causes those windows to become slightly translucent if something like
-- xcompmgr is running.
import XMonad.Hooks.FadeInactive (fadeInactiveLogHook)

-- This module provides tools to automatically manage dock type programs, such
-- as gnome-panel, kicker, dzen, and xmobar.
import XMonad.Hooks.ManageDocks (manageDocks, avoidStrutsOn)

-- Make a given layout display without borders. This is useful for full-screen
-- or tabbed layouts, where you don't really want to waste a couple of pixels of
-- real estate just to inform yourself that the visible window has focus.
import XMonad.Layout.NoBorders (smartBorders)
-- This is a layout modifier that will show the workspace name.
import XMonad.Layout.ShowWName (showWName)

import XMonad.Util.Run
import XMonad.Util.EZConfig
-- Miscellaneous commonly used types. Direction2D exports: U, D, L, R
import XMonad.Util.Types (Direction2D(..))

-- Used for setting the lowest logging level.
-- haskell-hslogger package on arch linux
import System.Log.Logger (Priority(..))

-- My modifications
import XMonad.Stack.MyKeys (myKeys)
import XMonad.Stack.MyLayout (myLayoutHook)
import XMonad.Stack.MyTopics (myTopics, myManageHook)


myTerminal = "urxvt"

myDesktopConfig = defaultConfig --kde4Config

myConfig =
  myDesktopConfig
    { -- Use win key instead of alt key as modifier.
      -- Doesn't conflict emacs.
      modMask  = mod4Mask -- default is mod1Mask
    , terminal = myTerminal
                 
    , manageHook  = manageHook defaultConfig <+> manageDocks <+> composeAll myManageHook
    , startupHook = setWMName "LG3D"
    , normalBorderColor  = "#555555"
    , focusedBorderColor = "#bbbbbb"
    , borderWidth        = 1
    , layoutHook         = showWName $ myLayoutHook
    , workspaces         = myTopics
    , keys               = myKeys myDesktopConfig
    }
