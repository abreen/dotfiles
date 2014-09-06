-- ~/.xmonad/xmonad.hs
-- Alexander Breen (abreen@bu.edu)

import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Spacing
import XMonad.Layout.Gaps
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO


xmobarPath = "/usr/bin/xmobar"
xmobarConfig = "/home/abreen/.xmobarrc"

main = do
    xmproc <- spawnPipe $ xmobarPath ++ " " ++ xmobarConfig
    xmonad $ defaultConfig
        { manageHook = manageDocks <+> manageHook defaultConfig
        , layoutHook = gaps [(L, 35)] $ avoidStruts $ smartSpacing 6 $ layoutHook defaultConfig
        , logHook = dynamicLogWithPP defaultPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "#5677fc" "" . shorten 50
                        }
        , borderWidth        = 4
        , terminal           = "urxvt"
        , normalBorderColor  = "#222222"
        , focusedBorderColor = "#666666" }
