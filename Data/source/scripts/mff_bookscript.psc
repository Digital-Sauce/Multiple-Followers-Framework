Scriptname MFF_BookScript extends ObjectReference  

GlobalVariable Property Started Auto
Quest Property LinkQuest Auto
 
 
Event OnRead()
	Game.DisablePlayerControls(False, False, False, False, False, True) ; Ensure MessageBox is not on top of other menus & prevent book from opening normally.
	Game.EnablePlayerControls(False, False, False, False, False, True) ; Undo DisablePlayerControls
	OpenMenu()
EndEvent

Function OpenMenu()
	If Started.GetValue() == 0
		(LinkQuest as MFF_BookLink).Startup()
	Else
		(LinkQuest as MFF_BookLink).Menu()
	EndIf
EndFunction