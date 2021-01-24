Scriptname MFF_RestartScript extends Quest  

GlobalVariable Property PartyLimit Auto
GlobalVariable Property DialogueCloak Auto

Actor Property Player Auto

Weapon Property BowWood Auto
Weapon Property BowSteel Auto
Weapon Property BowBound Auto
Weapon Property BowDefault Auto

Quest Property LinkQuest Auto
Quest Property CoreQuest Auto

Message Property DebugRestartPage Auto

Message Property DebugSystemRestart Auto

Message Property CombatDismissMessage Auto
Message Property WaitingDismissMessage Auto
Message Property DeathDismissMessage Auto
;Message Property DefaultDismissMessage Auto

Spell Property Cloak Auto


Function Menu(Bool abMenu, Int aiButton)
	(LinkQuest as MFF_MenuLink).RestartPre()

	aiButton = DebugRestartPage.Show()

	If aiButton == 0 ; Confirm
		Restart()
	ElseIf aiButton == 1 ; Cancel
		(CoreQuest as MFF_MenuDebugScript).Debug(abMenu, aiButton)
	EndIf

	(LinkQuest as MFF_MenuLink).RestartPost()
EndFunction

Function Restart(Bool SendMessage = true)
	(LinkQuest as MFF_MenuLink).RestartPre()

	MFF_RefAlias refAlias

	; actors
	ObjectReference[] objects1 = new ObjectReference[128]
	ObjectReference[] objects2 = new ObjectReference[128]
	ObjectReference[] objects3 = new ObjectReference[128]
	ObjectReference[] objects4 = new ObjectReference[128]

	;state capture
	Int[] InfightingParty1 = new Int[128]
	Int[] InfightingParty2 = new Int[128]
	Int[] InfightingParty3 = new Int[128]
	Int[] InfightingParty4 = new Int[128]

	Int[] InfightingPlayer1 = new Int[128]
	Int[] InfightingPlayer2 = new Int[128]
	Int[] InfightingPlayer3 = new Int[128]
	Int[] InfightingPlayer4 = new Int[128]

	Int[] RelationshipRank1 = new Int[128]
	Int[] RelationshipRank2 = new Int[128]
	Int[] RelationshipRank3 = new Int[128]
	Int[] RelationshipRank4 = new Int[128]

	Int[] MoralityRank1 = new Int[128]
	Int[] MoralityRank2 = new Int[128]
	Int[] MoralityRank3 = new Int[128]
	Int[] MoralityRank4 = new Int[128]

	Int[] Waiting1 = new Int[128]
	Int[] Waiting2 = new Int[128]
	Int[] Waiting3 = new Int[128]
	Int[] Waiting4 = new Int[128]

	Int[] Bow1 = new Int[128] ; 0 none 1 wood 2 steel 3 bound 4 default
	Int[] Bow2 = new Int[128]
	Int[] Bow3 = new Int[128]
	Int[] Bow4 = new Int[128]

	Int i
	While i < PartyLimit.GetValue()
		refAlias = (CoreQuest as MFF_Script).IndexToRefAlias(i)

		If refAlias.GetReference() != None
			ObjectReference ref = refAlias.GetReference()
			(ref as Actor).EnableAI(false)

			If i < 128
				objects1[i] = ref
				InfightingParty1[i] = refAlias.InfightingParty
				InfightingPlayer1[i] = refAlias.InfightingPlayer
				RelationshipRank1[i] = refAlias.RelationshipRank
				MoralityRank1[i] = refAlias.MoralityRank
				Waiting1[i] = refAlias.GetActorReference().GetActorValue("WaitingForPlayer") as Int

				If ref.GetItemCount(BowWood) > 0
					Bow1[i] = 1
				ElseIf ref.GetItemCount(BowSteel) > 0
					Bow1[i] = 2
				ElseIf ref.GetItemCount(BowBound) > 0
					Bow1[i] = 3
				ElseIf ref.GetItemCount(BowDefault) > 0
					Bow1[i] = 4
				Else
					Bow1[i] = 0
				EndIf

			ElseIf i > 127 && i < 256
				objects2[i - 128] = ref
				InfightingParty2[i - 128] = refAlias.InfightingParty
				InfightingPlayer2[i - 128] = refAlias.InfightingPlayer
				RelationshipRank2[i - 128] = refAlias.RelationshipRank
				MoralityRank2[i - 128] = refAlias.MoralityRank
				Waiting2[i - 128] = refAlias.GetActorReference().GetActorValue("WaitingForPlayer") as Int

				If ref.GetItemCount(BowWood) > 0
					Bow2[i - 128] = 1
				ElseIf ref.GetItemCount(BowSteel) > 0
					Bow2[i - 128] = 2
				ElseIf ref.GetItemCount(BowBound) > 0
					Bow2[i - 128] = 3
				ElseIf ref.GetItemCount(BowDefault) > 0
					Bow2[i - 128] = 4
				Else
					Bow2[i - 128] = 0
				EndIf

			ElseIf i > 255 && i < 384
				objects3[i - 256] = ref
				InfightingParty3[i - 256] = refAlias.InfightingParty
				InfightingPlayer3[i - 256] = refAlias.InfightingPlayer
				RelationshipRank3[i - 256] = refAlias.RelationshipRank
				MoralityRank3[i - 256] = refAlias.MoralityRank
				Waiting3[i - 256] = refAlias.GetActorReference().GetActorValue("WaitingForPlayer") as Int

				If ref.GetItemCount(BowWood) > 0
					Bow3[i - 256] = 1
				ElseIf ref.GetItemCount(BowSteel) > 0
					Bow3[i - 256] = 2
				ElseIf ref.GetItemCount(BowBound) > 0
					Bow3[i - 256] = 3
				ElseIf ref.GetItemCount(BowDefault) > 0
					Bow3[i - 256] = 4
				Else
					Bow3[i - 256] = 0
				EndIf

			ElseIf i > 383 && i < 512
				objects4[i - 384] = ref
				InfightingParty4[i - 384] = refAlias.InfightingParty
				InfightingPlayer4[i - 384] = refAlias.InfightingPlayer
				RelationshipRank4[i - 384] = refAlias.RelationshipRank
				MoralityRank4[i - 384] = refAlias.MoralityRank
				Waiting4[i - 384] = refAlias.GetActorReference().GetActorValue("WaitingForPlayer") as Int

				If ref.GetItemCount(BowWood) > 0
					Bow4[i - 384] = 1
				ElseIf ref.GetItemCount(BowSteel) > 0
					Bow4[i - 384] = 2
				ElseIf ref.GetItemCount(BowBound) > 0
					Bow4[i - 384] = 3
				ElseIf ref.GetItemCount(BowDefault) > 0
					Bow4[i - 384] = 4
				Else
					Bow4[i - 384] = 0
				EndIf

			EndIf
		EndIf
		i += 1
	EndWhile

	refAlias = None

	i = 0

	(CoreQuest as MFF_ShutdownScript).Shutdown(false)
	(CoreQuest as MFF_ModStartup).Startup(false)


	While i < 128

		If objects1[i] != None
			(CoreQuest as MFF_PartyScript).RecruitAlias(objects1[i] as Actor, (CoreQuest as MFF_Script).Refs1[i], false)
			refAlias = (CoreQuest as MFF_Script).Refs1[i]
			refAlias.InfightingParty = InfightingParty1[i]
			refAlias.InfightingPlayer = InfightingPlayer1[i]
;			refAlias.RelationshipRank = RelationshipRank1[i]
;			refAlias.MoralityRank = MoralityRank1[i]
			refAlias.GetActorReference().SetActorValue("WaitingForPlayer", Waiting1[i])
			If Bow1[i] == 0
				(CoreQuest as MFF_PartyScript).RemoveBows(refAlias.GetReference())
			ElseIf Bow1[i] == 1
				(CoreQuest as MFF_PartyScript).RemoveBows(refAlias.GetReference())
				(CoreQuest as MFF_PartyScript).AddBow(refAlias.GetReference(), 1)
			ElseIf Bow1[i] == 2
				(CoreQuest as MFF_PartyScript).RemoveBows(refAlias.GetReference())
				(CoreQuest as MFF_PartyScript).AddBow(refAlias.GetReference(), 2)
			ElseIf Bow1[i] == 3
				(CoreQuest as MFF_PartyScript).RemoveBows(refAlias.GetReference())
				(CoreQuest as MFF_PartyScript).AddBow(refAlias.GetReference(), 3)
			ElseIf Bow1[i] == 4
				(CoreQuest as MFF_PartyScript).RemoveBows(refAlias.GetReference())
				(CoreQuest as MFF_PartyScript).AddBow(refAlias.GetReference(), 4)
			EndIf

			(refAlias.GetReference() as Actor).EnableAI()
		EndIf

		If objects2[i] != None
			(CoreQuest as MFF_PartyScript).RecruitAlias(objects1[i] as Actor, (CoreQuest as MFF_Script).Refs2[i], false)
			refAlias = (CoreQuest as MFF_Script).Refs2[i]
			refAlias.InfightingParty = InfightingParty2[i]
			refAlias.InfightingPlayer = InfightingPlayer2[i]
;			refAlias.RelationshipRank = RelationshipRank2[i]
;			refAlias.MoralityRank = MoralityRank2[i]
			refAlias.GetActorReference().SetActorValue("WaitingForPlayer", Waiting2[i])
			If Bow2[i] == 0
				(CoreQuest as MFF_PartyScript).RemoveBows(refAlias.GetReference())
			ElseIf Bow2[i] == 1
				(CoreQuest as MFF_PartyScript).RemoveBows(refAlias.GetReference())
				(CoreQuest as MFF_PartyScript).AddBow(refAlias.GetReference(), 1)
			ElseIf Bow2[i] == 2
				(CoreQuest as MFF_PartyScript).RemoveBows(refAlias.GetReference())
				(CoreQuest as MFF_PartyScript).AddBow(refAlias.GetReference(), 2)
			ElseIf Bow2[i] == 3
				(CoreQuest as MFF_PartyScript).RemoveBows(refAlias.GetReference())
				(CoreQuest as MFF_PartyScript).AddBow(refAlias.GetReference(), 3)
			ElseIf Bow2[i] == 4
				(CoreQuest as MFF_PartyScript).RemoveBows(refAlias.GetReference())
				(CoreQuest as MFF_PartyScript).AddBow(refAlias.GetReference(), 4)
			EndIf

			(refAlias.GetReference() as Actor).EnableAI()
		EndIf

		If objects3[i] != None
			(CoreQuest as MFF_PartyScript).RecruitAlias(objects3[i] as Actor, (CoreQuest as MFF_Script).Refs3[i], false)
			refAlias = (CoreQuest as MFF_Script).Refs3[i]
			refAlias.InfightingParty = InfightingParty3[i]
			refAlias.InfightingPlayer = InfightingPlayer3[i]
;			refAlias.RelationshipRank = RelationshipRank3[i]
;			refAlias.MoralityRank = MoralityRank3[i]
			refAlias.GetActorReference().SetActorValue("WaitingForPlayer", Waiting3[i])
			If Bow3[i] == 0
				(CoreQuest as MFF_PartyScript).RemoveBows(refAlias.GetReference())
			ElseIf Bow3[i] == 1
				(CoreQuest as MFF_PartyScript).RemoveBows(refAlias.GetReference())
				(CoreQuest as MFF_PartyScript).AddBow(refAlias.GetReference(), 1)
			ElseIf Bow3[i] == 2
				(CoreQuest as MFF_PartyScript).RemoveBows(refAlias.GetReference())
				(CoreQuest as MFF_PartyScript).AddBow(refAlias.GetReference(), 2)
			ElseIf Bow3[i] == 3
				(CoreQuest as MFF_PartyScript).RemoveBows(refAlias.GetReference())
				(CoreQuest as MFF_PartyScript).AddBow(refAlias.GetReference(), 3)
			ElseIf Bow3[i] == 4
				(CoreQuest as MFF_PartyScript).RemoveBows(refAlias.GetReference())
				(CoreQuest as MFF_PartyScript).AddBow(refAlias.GetReference(), 4)
			EndIf

			(refAlias.GetReference() as Actor).EnableAI()
		EndIf

		If objects4[i] != None
			(CoreQuest as MFF_PartyScript).RecruitAlias(objects1[i] as Actor, (CoreQuest as MFF_Script).Refs4[i], false)
			refAlias = (CoreQuest as MFF_Script).Refs4[i]
			refAlias.InfightingParty = InfightingParty4[i]
			refAlias.InfightingPlayer = InfightingPlayer4[i]
;			refAlias.RelationshipRank = RelationshipRank4[i]
;			refAlias.MoralityRank = MoralityRank4[i]
			refAlias.GetActorReference().SetActorValue("WaitingForPlayer", Waiting4[i])
			If Bow4[i] == 0
				(CoreQuest as MFF_PartyScript).RemoveBows(refAlias.GetReference())
			ElseIf Bow4[i] == 1
				(CoreQuest as MFF_PartyScript).RemoveBows(refAlias.GetReference())
				(CoreQuest as MFF_PartyScript).AddBow(refAlias.GetReference(), 1)
			ElseIf Bow4[i] == 2
				(CoreQuest as MFF_PartyScript).RemoveBows(refAlias.GetReference())
				(CoreQuest as MFF_PartyScript).AddBow(refAlias.GetReference(), 2)
			ElseIf Bow4[i] == 3
				(CoreQuest as MFF_PartyScript).RemoveBows(refAlias.GetReference())
				(CoreQuest as MFF_PartyScript).AddBow(refAlias.GetReference(), 3)
			ElseIf Bow4[i] == 4
				(CoreQuest as MFF_PartyScript).RemoveBows(refAlias.GetReference())
				(CoreQuest as MFF_PartyScript).AddBow(refAlias.GetReference(), 4)
			EndIf

			(refAlias.GetReference() as Actor).EnableAI()
		EndIf

		i += 1
	EndWhile

	objects1 = None
	objects2 = None
	objects3 = None
	objects4 = None

	InfightingParty1 = None
	InfightingParty2 = None
	InfightingParty3 = None
	InfightingParty4 = None

	InfightingPlayer1 = None
	InfightingPlayer2 = None
	InfightingPlayer3 = None
	InfightingPlayer4 = None

	RelationshipRank1 = None
	RelationshipRank2 = None
	RelationshipRank3 = None
	RelationshipRank4 = None

	MoralityRank1 = None
	MoralityRank2 = None
	MoralityRank3 = None
	MoralityRank4 = None

	Waiting1 = None
	Waiting2 = None
	Waiting3 = None
	Waiting4 = None

	Bow1 = None
	Bow2 = None
	Bow3 = None
	Bow4 = None

	If DialogueCloak.GetValue() == 1
		Cloak.Cast(Player)
	EndIf


	DebugSystemRestart.Show()

	(LinkQuest as MFF_MenuLink).RestartPost()
EndFunction