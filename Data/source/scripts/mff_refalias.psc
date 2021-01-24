Scriptname MFF_RefAlias extends ReferenceAlias

Actor Property Player Auto

Message Property CombatDismissMessage Auto
Message Property WaitingDismissMessage Auto
Message Property DeathDismissMessage Auto

Faction Property CurrentFollower Auto

Quest Property CoreQuest Auto

Int Property InfightingParty Auto
Int Property InfightingPlayer Auto

Int Property RelationshipRank Auto
Int Property MoralityRank Auto

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	If akTarget == Player
		If InfightingPlayer == 0
			Self.GetActorReference().StopCombat()
			Self.GetActorReference().StopCombatAlarm()
		ElseIf InfightingPlayer == 1
			Actor DismissedFollower = Self.GetActorReference()
			CombatDismissMessage.Show()
			(CoreQuest as MFF_PartyScript).DismissAlias(Self)
		EndIf
	Else
		If InfightingParty == 0
			If (CoreQuest as MFF_Script).ContainsRef(akTarget)
				Self.GetActorReference().StopCombat()
				Self.GetActorReference().StopCombatAlarm()
			EndIf
		EndIf
	EndIf
EndEvent

Event OnUpdateGameTime()
	If Self.GetActorRef().GetActorValue("WaitingforPlayer") == 0
		UnRegisterForUpdateGameTime()
	Else
		WaitingDismissMessage.Show()
		(CoreQuest as MFF_PartyScript).DismissAlias(Self, false)
		UnRegisterForUpdateGameTime()
	EndIf
EndEvent

Event OnDeath(Actor akKiller)
	DeathDismissMessage.Show()
	(CoreQuest as MFF_PartyScript).DismissAlias(Self, false)
EndEvent
