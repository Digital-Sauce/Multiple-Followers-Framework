Scriptname MFF_PlayerScript extends ReferenceAlias

GlobalVariable Property AutoMount Auto

Actor Property Player Auto

Faction Property OwnedMount Auto

Spell Property GroupRecruit Auto
Spell Property GroupDismiss Auto
Spell Property GroupHold Auto
Spell Property GroupRest Auto
Spell Property GroupFollow Auto
Spell Property GroupCalm Auto

Spell Property MountGroupRecruit Auto
Spell Property MountGroupDismiss Auto
Spell Property MountGroupHold Auto
Spell Property MountGroupRest Auto
Spell Property MountGroupFollow Auto

Spell Property GroupMountUp Auto
Spell Property GroupDismount Auto

Spell Property GlobalRally Auto
Spell Property MountGlobalRally Auto

Spell Property RecruitCloak Auto
Spell Property DismissCloak Auto
Spell Property HoldCloak Auto
Spell Property RestCloak Auto
Spell Property FollowCloak Auto
Spell Property CalmCloak Auto

Spell Property MountRecruitCloak Auto
Spell Property MountDismissCloak Auto
Spell Property MountHoldCloak Auto
Spell Property MountRestCloak Auto
Spell Property MountFollowCloak Auto

Spell Property MountUpCloak Auto
Spell Property DismountCloak Auto

Message Property MessageRally Auto

Quest Property LinkQuest Auto
Quest Property CoreQuest Auto

Event OnPlayerLoadGame()
	LinkQuest.Stop()
	LinkQuest.Start()
EndEvent

;Event OnPlayerSaveGame()
	;Compiles but does nothing?
;EndEvent


Event OnAnimationEvent(ObjectReference akSource, String asEventName)

	If AutoMount.GetValue() == 1
		If akSource == Player && asEventName == "tailHorseMount"
			MountUpCloak.Cast(Player)
		ElseIf akSource == Player && asEventName == "tailHorseDismount"
			DismountCloak.Cast(Player)
		EndIf
	EndIf

EndEvent


Event OnSpellCast(form akSpell)
	
	If akSpell as Spell == GroupRecruit
		RecruitCloak.Cast(Player)
	ElseIf akSpell as Spell == GroupCalm
		CalmCloak.Cast(Player)

	ElseIf akSpell as Spell == GroupDismiss
		DismissCloak.Cast(Player)
	ElseIf akSpell as Spell == GroupHold
		HoldCloak.Cast(Player)
	ElseIf akSpell as Spell == GroupRest
		RestCloak.Cast(Player)
	ElseIf akSpell as Spell == GroupFollow
		FollowCloak.Cast(Player)

	ElseIf akSpell as Spell == MountGroupRecruit
		MountRecruitCloak.Cast(Player)
	ElseIf akSpell as Spell == MountGroupDismiss
		MountDismissCloak.Cast(Player)
	ElseIf akSpell as Spell == MountGroupHold
		MountHoldCloak.Cast(Player)
	ElseIf akSpell as Spell == MountGroupRest
		MountRestCloak.Cast(Player)
	ElseIf akSpell as Spell == MountGroupFollow
		MountFollowCloak.Cast(Player)

	ElseIf akSpell as Spell == GroupMountUp
		MountUpCloak.Cast(Player)
	ElseIf akSpell as Spell == GroupDismount
		DismountCloak.Cast(Player)

	ElseIf akSpell as Spell == GlobalRally
		PartyFollow()
	ElseIf akSpell as Spell == MountGlobalRally
		MountsFollow()
	EndIf

EndEvent


Function PartyFollow()

	Int i
	Int c = (CoreQuest as MFF_Script).Count
	Int x

	While x < c
		ObjectReference ref = (CoreQuest as MFF_Script).IndexToRef(i)

		If ref != None
			If (ref as Actor).GetFactionRank(OwnedMount) < 0
				(CoreQuest as MFF_PartyScript).Follow(ref)
			EndIf
			x += 1
		EndIf

		i += 1
	EndWhile

	MessageRally.Show()

EndFunction

Function MountsFollow()

	Int i
	Int c = (CoreQuest as MFF_Script).Count
	Int x

	While x < c
		ObjectReference ref = (CoreQuest as MFF_Script).IndexToRef(i)

		If ref != None
			If (ref as Actor).GetFactionRank(OwnedMount) > -1
				(CoreQuest as MFF_PartyScript).Follow(ref)
			EndIf
			x += 1
		EndIf

		i += 1
	EndWhile

EndFunction