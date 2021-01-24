Scriptname MFF_ModStartup extends Quest  

GlobalVariable Property Started Auto
GlobalVariable Property DialogueCloak Auto

Quest Property LinkQuest Auto
Quest Property CoreQuest Auto

MFF_Script Property MFF Auto
MFF_RefScript Property Ref Auto

Spell Property Cloak Auto

Message Property StartupPage Auto

ReferenceAlias Property PlayerRefAlias Auto


; startup variables for refalias

Actor Property Player Auto

Message Property StartupMessage Auto
Message Property CombatDismissMessage Auto
Message Property WaitingDismissMessage Auto
Message Property DeathDismissMessage Auto


ReferenceAlias Property MFFBook Auto

Function Menu(Bool abMenu = true, Int aiButton = 0)
	aiButton = StartupPage.Show() ; Main Menu
	If aiButton == 0 ; Startup
		Startup()
		(LinkQuest as MFF_BookLink).Menu()
	ElseIf aiButton == 1 ; Cancel
		abMenu = False
		Stop()
	EndIf
EndFunction

Function Startup(Bool SendMessage = true)
	(LinkQuest as MFF_MenuLink).StartupPre()

	CoreQuest.Start()

	MFF.Count = 0

	MFF.Refs1 = new MFF_RefAlias[128]
	MFF.Refs2 = new MFF_RefAlias[128]
	MFF.Refs3 = new MFF_RefAlias[128]
	MFF.Refs4 = new MFF_RefAlias[128]

	MFF.Owners1 = new Faction[128]
	MFF.Owners2 = new Faction[128]
	MFF.Owners3 = new Faction[128]
	MFF.Owners4 = new Faction[128]

	(CoreQuest as MFF_BuildRefsScript).Begin()
	(CoreQuest as MFF_BuildOwnersScript).Begin()

	Int i
	While i < 128
		MFF.Refs1[i].Player = Player
		MFF.Refs1[i].CombatDismissMessage = CombatDismissMessage
		MFF.Refs1[i].WaitingDismissMessage = WaitingDismissMessage
		MFF.Refs1[i].DeathDismissMessage = DeathDismissMessage
		MFF.Refs1[i].CoreQuest = CoreQuest

		MFF.Refs2[i].Player = Player
		MFF.Refs2[i].CombatDismissMessage = CombatDismissMessage
		MFF.Refs2[i].WaitingDismissMessage = WaitingDismissMessage
		MFF.Refs2[i].DeathDismissMessage = DeathDismissMessage
		MFF.Refs2[i].CoreQuest = CoreQuest

		MFF.Refs3[i].Player = Player
		MFF.Refs3[i].CombatDismissMessage = CombatDismissMessage
		MFF.Refs3[i].WaitingDismissMessage = WaitingDismissMessage
		MFF.Refs3[i].DeathDismissMessage = DeathDismissMessage
		MFF.Refs3[i].CoreQuest = CoreQuest

		MFF.Refs4[i].Player = Player
		MFF.Refs4[i].CombatDismissMessage = CombatDismissMessage
		MFF.Refs4[i].WaitingDismissMessage = WaitingDismissMessage
		MFF.Refs4[i].DeathDismissMessage = DeathDismissMessage
		MFF.Refs4[i].CoreQuest = CoreQuest
		i += 1
	EndWhile

	If DialogueCloak.GetValue() == 1
		Cloak.Cast(Player)
	EndIf

	PlayerRefAlias.RegisterForAnimationEvent(Player, "tailHorseMount")
	PlayerRefAlias.RegisterForAnimationEvent(Player, "tailHorseDismount")

	Started.SetValue(1)

	If SendMessage
		StartupMessage.Show()
	EndIf

	(LinkQuest as MFF_MenuLink).StartupPost()
EndFunction