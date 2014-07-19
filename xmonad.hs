-- ~/.xmonad/xmonad.hs
-- Alexander Breen (abreen@bu.edu)

import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO


xmobarPath = "/usr/bin/xmobar"
xmobarConfig = "/home/abreen/.xmobarrc"

main = do
    xmproc <- spawnPipe $ xmobarPath ++ " " ++ xmobarConfig
    xmonad $ defaultConfig
        { manageHook = manageDocks <+> manageHook defaultConfig
        , layoutHook = avoidStruts  $  layoutHook defaultConfig
        , logHook = dynamicLogWithPP defaultPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "#005faf" "" . shorten 50
                        }
        , borderWidth        = 4
        , terminal           = "urxvt"
        , normalBorderColor  = "#444444"
        , focusedBorderColor = "#5f87af" }
