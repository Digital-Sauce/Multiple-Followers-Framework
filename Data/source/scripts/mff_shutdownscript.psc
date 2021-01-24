Scriptname MFF_ShutdownScript extends Quest  

Actor Property Player Auto

GlobalVariable Property PartyLimit Auto
GlobalVariable Property IsStarted Auto

Quest Property CoreQuest Auto
Quest Property LinkQuest Auto

Message Property DebugShutdownPage Auto

Message Property DebugSystemDismiss Auto
Message Property DebugSystemShutdown Auto

ReferenceAlias Property PlayerRefAlias Auto


Function Menu(Bool abMenu, Int aiButton)
	(LinkQuest as MFF_MenuLink).ShutdownPre()

	aiButton = DebugShutdownPage.Show()

	If aiButton == 0 ; Confirm
		Shutdown()
	ElseIf aiButton == 1 ; Cancel
		(CoreQuest as MFF_MenuDebugScript).Debug(abMenu, aiButton)
	EndIf

	(LinkQuest as MFF_MenuLink).ShutdownPost()
EndFunction

Function Shutdown(Bool SendMessage = true)
	(LinkQuest as MFF_MenuLink).ShutdownPre()

	Int i
	While i < PartyLimit.GetValue()
		MFF_RefAlias refAlias = (CoreQuest as MFF_Script).IndexToRefAlias(i)
		If refAlias.GetReference() != None

			(CoreQuest as MFF_PartyScript).DismissAlias(refAlias, false)
		EndIf
		i += 1
	EndWhile

	If SendMessage
		DebugSystemDismiss.Show()
	EndIf

	(CoreQuest as MFF_Script).Refs1 = None
	(CoreQuest as MFF_Script).Refs2 = None
	(CoreQuest as MFF_Script).Refs3 = None
	(CoreQuest as MFF_Script).Refs4 = None

	(CoreQuest as MFF_Script).Owners1 = None
	(CoreQuest as MFF_Script).Owners2 = None
	(CoreQuest as MFF_Script).Owners3 = None
	(CoreQuest as MFF_Script).Owners4 = None

	CoreQuest.Stop()

	IsStarted.SetValue(0)

	If SendMessage
		DebugSystemShutdown.Show()
	EndIf

	(LinkQuest as MFF_MenuLink).ShutdownPost()
EndFunction