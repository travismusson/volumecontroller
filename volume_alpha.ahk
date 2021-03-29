;Program uses nircmds functionalities to lower the volume of the current application, or chosen multimedia applications
;Made by Travis Musson, utilizing NirCmd
;__________________________
#NoEnv
#SingleInstance, Force
#MaxThreads, 100
#MaxThreadsPerHotkey, 2
#Persistent
#MaxHotkeysPerInterval 200
;__________________________

;Settings

vol_amount = 0.1	;change this value to desired amount of volume to be changed, only use positive values

toggleGame = False	;defaults the audio, false = multi media, true = fullscreen application


;__________________________

;Hotkeys for toggle

NumpadDiv::
toggleGame = True
MsgBox, "You can alter your current game audio!"
Return

NumpadMult::
toggleGame = False
MsgBox, "You can alter your current multimedia audio!"
Return

;__________________________

;Hotkeys for altering audio

^!WheelDown:: ;ctrl + alt + scroll wheel down
    If (toggleGame = True){ ;changes current focused fullscreen window
        Run, nircmd.exe changeappvolume focused -%vol_amount%
        
        Return
    }Else{  ;changes multimedia by default
	;Run, nircmd.exe changeappvolume chrome.exe -%vol_amount%	;cant seem to get chrome to lower its audio via this?
        Run, nircmd.exe changeappvolume discord.exe -%vol_amount%	
	Run, nircmd.exe changeappvolume spotify.exe -%vol_amount%
        Return
        
    }

^!WheelUp:: ;ctrl + alt + scroll wheel up
    If (toggleGame = True){ ;changes current focused fullscreen window
        Run, nircmd.exe changeappvolume focused %vol_amount%
        Return
    }Else{  ;changes multimedia by default
	;Run, nircmd.exe changeappvolume chrome.exe -%vol_amount%	;Chrome audio levels not working... will look into
        Run, nircmd.exe changeappvolume discord.exe %vol_amount%
	Run, nircmd.exe changeappvolume spotify.exe %vol_amount%
        return
    }
;__________________________

