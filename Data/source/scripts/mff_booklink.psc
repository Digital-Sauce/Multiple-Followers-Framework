Scriptname MFF_BookLink extends Quest  

GlobalVariable Property Started Auto

Quest Property CoreQuest Auto

Message Property LinkMenu Auto

Bool abMenu
Int aiButton

Function Menu()
	abMenu = True
	aiButton = 0
	While abMenu && Started.GetValue() == 1
		If aiButton != -1 ; Wait for input (this can prevent problems if recycling the aiButton argument in submenus)
			aiButton = LinkMenu.Show() ; Main Menu
			If aiButton == 0 ; MFF Settings
				(CoreQuest as MFF_ModMenu).Menu(abMenu, aiButton)
			ElseIf aiButton == 1 ; Close
				abMenu = False
			EndIf
		EndIf
	EndWhile
EndFunction

Function Startup()
	(CoreQuest as MFF_ModStartup).Menu()
EndFunction

