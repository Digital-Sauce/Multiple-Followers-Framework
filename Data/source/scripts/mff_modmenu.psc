Scriptname MFF_ModMenu extends Quest  

Message Property MFFPage Auto

Quest Property CoreQuest Auto

Function Menu(Bool abMenu, Int aiButton)

	aiButton = MFFPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; Settings
		(CoreQuest as MFF_MenuSettingsScript).Settings(abMenu, aiButton)
	ElseIf aiButton == 2 ; Dialogue
		(CoreQuest as MFF_MenuDialogueScript).Dialogue(abMenu, aiButton)
	ElseIf aiButton == 3 ; Powers
		(CoreQuest as MFF_MenuPowersScript).Powers(abMenu, aiButton)
	ElseIf aiButton == 4 ; Debug
		(CoreQuest as MFF_MenuDebugScript).Debug(abMenu, aiButton)
	EndIf
EndFunction