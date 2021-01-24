Scriptname MFF_MenuSettingsScript extends Quest  


GlobalVariable Property PartyLimit Auto

GlobalVariable Property FollowerBows Auto
GlobalVariable Property AnimalBows Auto
GlobalVariable Property NPCBows Auto

GlobalVariable Property WaitLimit Auto
GlobalVariable Property WaitTime Auto

GlobalVariable Property AutoMount Auto

GlobalVariable Property InfightingPlayer Auto
GlobalVariable Property InfightingParty Auto

GlobalVariable Property GoldCost Auto


Actor Property Player Auto

Spell Property FFSpell Auto
Spell Property SpellTargetCalm Auto
Spell Property SpellGroupCalm Auto

Faction Property FollowerFaction Auto
Faction Property AnimalFaction Auto
Faction Property NPCFaction Auto


Message Property MFFPage Auto

Message Property SettingsPage Auto

Message Property BowPage Auto
Message Property BowTypePage Auto

Message Property BowTypeDefaultPage Auto
Message Property BowTypeWoodPage Auto
Message Property BowTypeSteelPage Auto
Message Property BowTypeBoundPage Auto

Message Property BowsFollowerPage Auto
Message Property BowsAnimalPage Auto
Message Property BowsNPCPage Auto
Message Property BowsAllPage Auto

Message Property WaitDismissPage Auto
Message Property WaitLimitPage Auto
Message Property WaitTimePage Auto

Message Property AutoMountPage Auto

Message Property TeammatePage Auto

Message Property FriendlyFirePage Auto
Message Property InfightingPlayerPage Auto
Message Property InfightingPartyPage Auto

Message Property PowersTargetCalmPage Auto
Message Property PowersGroupCalmPage Auto

Message Property PartyLimitPage Auto

Message Property GoldCostPage Auto


Quest Property CoreQuest Auto
Quest Property LinkQuest Auto


Function Settings(Bool abMenu, Int aiButton)

	aiButton = SettingsPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; Hidden Bows
		HiddenBows(abMenu, aiButton)
	ElseIf aiButton == 2 ; Wait/Dismiss
		WaitDismiss(abMenu, aiButton)
	ElseIf aiButton == 3 ; Auto-Mount
		AutoMount(abMenu, aiButton)
	ElseIf aiButton == 4 ; Teammate
		Teammate(abMenu, aiButton)
	ElseIf aiButton == 5 ; Party Limit
		PartyLimit(abMenu, aiButton)
	ElseIf aiButton == 6 ; Gold Cost
		GoldCostMenu(abMenu, aiButton)
	ElseIf aiButton == 7 ; back
		(CoreQuest as MFF_ModMenu).Menu(abMenu, aiButton)
	EndIf
EndFunction

Function HiddenBows(Bool abMenu, Int aiButton)

	aiButton = BowPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; Bow Type
		HiddenBowType(abMenu, aiButton)
	ElseIf aiButton == 2 ; Follower Bows
		HiddenBowFollower(abMenu, aiButton)
	ElseIf aiButton == 3 ; Animal Bows
		HiddenBowAnimal(abMenu, aiButton)
	ElseIf aiButton == 4 ; NPC Bows
		HiddenBowNPC(abMenu, aiButton)
	ElseIf aiButton == 5 ; All Bows
		HiddenBowAll(abMenu, aiButton)
	ElseIf aiButton == 6 ; back
		Settings(abMenu, aiButton)
	EndIf
EndFunction

Function HiddenBowType(Bool abMenu, Int aiButton)

	aiButton = BowTypePage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; Iron
		HiddenBowTypeWood(abMenu, aiButton)
	ElseIf aiButton == 2 ; Steel
		HiddenBowTypeSteel(abMenu, aiButton)
	ElseIf aiButton == 3 ; Bound
		HiddenBowTypeBound(abMenu, aiButton)
	ElseIf aiButton == 4 ; Default
		HiddenBowTypeDefault(abMenu, aiButton)
	ElseIf aiButton == 5 ; back
		HiddenBows(abMenu, aiButton)
	EndIf
EndFunction

Function HiddenBowTypeWood(Bool abMenu, Int aiButton)

	aiButton = BowTypeWoodPage.Show()

	If aiButton == 0 ; Confirm
		(CoreQuest as MFF_PartyScript).SetBowType("Wood")

		HiddenBows(abMenu, aiButton)
	ElseIf aiButton == 1 ; Cancel
		HiddenBowType(abMenu, aiButton)
	EndIf

EndFunction

Function HiddenBowTypeSteel(Bool abMenu, Int aiButton)

	aiButton = BowTypeSteelPage.Show()

	If aiButton == 0 ; Confirm
		(CoreQuest as MFF_PartyScript).SetBowType("Steel")

		HiddenBows(abMenu, aiButton)
	ElseIf aiButton == 1 ; Cancel
		HiddenBowType(abMenu, aiButton)
	EndIf

EndFunction

Function HiddenBowTypeBound(Bool abMenu, Int aiButton)

	aiButton = BowTypeBoundPage.Show()

	If aiButton == 0 ; Confirm
		(CoreQuest as MFF_PartyScript).SetBowType("Bound")

		HiddenBows(abMenu, aiButton)
	ElseIf aiButton == 1 ; Cancel
		HiddenBowType(abMenu, aiButton)
	EndIf

EndFunction

Function HiddenBowTypeDefault(Bool abMenu, Int aiButton)

	aiButton = BowTypeDefaultPage.Show()

	If aiButton == 0 ; Confirm
		(CoreQuest as MFF_PartyScript).SetBowType()

		HiddenBows(abMenu, aiButton)
	ElseIf aiButton == 1 ; Cancel
		HiddenBowType(abMenu, aiButton)
	EndIf

EndFunction

Function HiddenBowFollower(Bool abMenu, Int aiButton)

	aiButton = BowsFollowerPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; Add
		FollowerBows.SetValue(1)
		HiddenBows(abMenu, aiButton)

	ElseIf aiButton == 2 ; Remove
		FollowerBows.SetValue(0)
		HiddenBows(abMenu, aiButton)

	ElseIf aiButton == 3 ; back
		HiddenBows(abMenu, aiButton)
	EndIf
EndFunction

Function HiddenBowAnimal(Bool abMenu, Int aiButton)

	aiButton = BowsAnimalPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; Add
		AnimalBows.SetValue(1)
		HiddenBows(abMenu, aiButton)

	ElseIf aiButton == 2 ; Remove
		AnimalBows.SetValue(0)
		HiddenBows(abMenu, aiButton)

	ElseIf aiButton == 3 ; back
		HiddenBows(abMenu, aiButton)
	EndIf
EndFunction

Function HiddenBowNPC(Bool abMenu, Int aiButton)

	aiButton = BowsNPCPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; Add
		NPCBows.SetValue(1)
		HiddenBows(abMenu, aiButton)

	ElseIf aiButton == 2 ; Remove
		NPCBows.SetValue(0)
		HiddenBows(abMenu, aiButton)

	ElseIf aiButton == 3 ; back
		HiddenBows(abMenu, aiButton)
	EndIf
EndFunction

Function HiddenBowAll(Bool abMenu, Int aiButton)

	aiButton = BowsAllPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; Add
		FollowerBows.SetValue(1)
		AnimalBows.SetValue(1)
		NPCBows.SetValue(1)
		HiddenBows(abMenu, aiButton)

	ElseIf aiButton == 2 ; Remove
		FollowerBows.SetValue(0)
		AnimalBows.SetValue(0)
		NPCBows.SetValue(0)
		HiddenBows(abMenu, aiButton)

	ElseIf aiButton == 3 ; back
		HiddenBows(abMenu, aiButton)
	EndIf

EndFunction


Function WaitDismiss(Bool abMenu, Int aiButton)

	aiButton = WaitDismissPage.Show()

	If aiButton == 0 ;  main
	ElseIf aiButton == 1 ; Wait Limit
		WaitingLimit(abMenu, aiButton)
	ElseIf aiButton == 2 ; Wait Time
		WaitingTime(abMenu, aiButton)
	ElseIf aiButton == 3 ; back
		Settings(abMenu, aiButton)
	EndIf
EndFunction

Function WaitingLimit(Bool abMenu, Int aiButton)

	aiButton = WaitLimitPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; On
		WaitLimit.SetValue(1)
		WaitDismiss(abMenu, aiButton)
	ElseIf aiButton == 2 ; Off
		WaitLimit.SetValue(0)
		WaitDismiss(abMenu, aiButton)
	ElseIf aiButton == 3 ; back
		WaitDismiss(abMenu, aiButton)
	EndIf
EndFunction

Function WaitingTime(Bool abMenu, Int aiButton)

	aiButton = WaitTimePage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; 1
		WaitTime.SetValue(1)
		WaitDismiss(abMenu, aiButton)
	ElseIf aiButton == 2 ; 24
		WaitTime.SetValue(24)
		WaitDismiss(abMenu, aiButton)
	ElseIf aiButton == 3 ; 72
		WaitTime.SetValue(72)
		WaitDismiss(abMenu, aiButton)
	ElseIf aiButton == 4 ; 168
		WaitTime.SetValue(168)
		WaitDismiss(abMenu, aiButton)
	ElseIf aiButton == 5 ; 720
		WaitTime.SetValue(720)
		WaitDismiss(abMenu, aiButton)
	ElseIf aiButton == 6 ; back
		WaitDismiss(abMenu, aiButton)
	EndIf
EndFunction

Function AutoMount(Bool abMenu, Int aiButton)

	aiButton = AutoMountPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; enable
		AutoMount.SetValue(1)
	ElseIf aiButton == 2 ; disable
		AutoMount.SetValue(0)
	ElseIf aiButton == 3 ; back
		Settings(abMenu, aiButton)
	EndIf
EndFunction

Function Teammate(Bool abMenu, Int aiButton)

	aiButton = TeammatePage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1
		FriendlyFirePerk(abMenu, aiButton)
	ElseIf aiButton == 2 
		InfightingPlayer(abMenu, aiButton)
	ElseIf aiButton == 3
		InfightingParty(abMenu, aiButton)
	ElseIf aiButton == 4
		CalmTarget(abMenu, aiButton)
	ElseIf aiButton == 5
		CalmGroup(abMenu, aiButton)
	ElseIf aiButton == 6 ; back
		Settings(abMenu, aiButton)
	EndIf
EndFunction

Function FriendlyFirePerk(Bool abMenu, Int aiButton)

	aiButton = FriendlyFirePage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; On
		Player.AddSpell(FFSpell)

		Teammate(abMenu, aiButton)
	ElseIf aiButton == 2 ; Off
		Player.RemoveSpell(FFSpell)

		Teammate(abMenu, aiButton)
	ElseIf aiButton == 3 ; back
		Teammate(abMenu, aiButton)
	EndIf
EndFunction

Function InfightingPlayer(Bool abMenu, Int aiButton)

	aiButton = InfightingPlayerPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; On
		InfightingPlayer.SetValue(1)

		Teammate(abMenu, aiButton)
	ElseIf aiButton == 2 ; Off
		InfightingPlayer.SetValue(0)

		Teammate(abMenu, aiButton)
	ElseIf aiButton == 3 ; Disabled
		InfightingPlayer.SetValue(-1)

		Teammate(abMenu, aiButton)
	ElseIf aiButton == 4 ; back
		Teammate(abMenu, aiButton)
	EndIf
EndFunction

Function InfightingParty(Bool abMenu, Int aiButton)

	aiButton = InfightingPartyPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; On
		InfightingParty.SetValue(1)

		Teammate(abMenu, aiButton)
	ElseIf aiButton == 2 ; Off
		InfightingParty.SetValue(0)

		Teammate(abMenu, aiButton)
	ElseIf aiButton == 3 ; back
		Teammate(abMenu, aiButton)
	EndIf
EndFunction

Function CalmTarget(Bool abMenu, Int aiButton)

	aiButton = PowersTargetCalmPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; enable
		Player.AddSpell(SpellTargetCalm)
		Teammate(abMenu, aiButton)
	ElseIf aiButton == 2 ; disable
		Player.RemoveSpell(SpellTargetCalm)
		Teammate(abMenu, aiButton)
	ElseIf aiButton == 3 ; Back
		Teammate(abMenu, aiButton)
	EndIf

EndFunction

Function CalmGroup(Bool abMenu, Int aiButton)

	aiButton = PowersGroupCalmPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; enable
		Player.AddSpell(SpellGroupCalm)
		Teammate(abMenu, aiButton)
	ElseIf aiButton == 2 ; disable
		Player.RemoveSpell(SpellGroupCalm)
		Teammate(abMenu, aiButton)
	ElseIf aiButton == 3 ; Back
		Teammate(abMenu, aiButton)
	EndIf

EndFunction

Function PartyLimit(Bool abMenu, Int aiButton)

	aiButton = PartyLimitPage.Show()

	Int i = 512
	Bool b = false

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; Party Limit = 1
		i = 1
		b = true
		Settings(abMenu, aiButton)
	ElseIf aiButton == 2 ; Party Limit = 10
		i = 10
		b = true
		Settings(abMenu, aiButton)
	ElseIf aiButton == 3 ; Party Limit = 128
		i = 128
		b = true
		Settings(abMenu, aiButton)
	ElseIf aiButton == 4 ; Party Limit = 256
		i = 256
		b = true
		Settings(abMenu, aiButton)
	ElseIf aiButton == 5 ; Party Limit = 384
		i = 384
		b = true
		Settings(abMenu, aiButton)
	ElseIf aiButton == 6 ; Party Limit = 512
		b = true
		Settings(abMenu, aiButton)
	ElseIf aiButton == 7 ; back
		Settings(abMenu, aiButton)
	EndIf

	If b == true
		(CoreQuest as MFF_PartyScript).SetPartyLimit(i)
	EndIf
	
EndFunction

Function GoldCostMenu(Bool abMenu, Int aiButton)

	aiButton = GoldCostPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1
		GoldCost.SetValue(0)
		Settings(abMenu, aiButton)
	ElseIf aiButton == 2
		GoldCost.SetValue(100)
		Settings(abMenu, aiButton)
	ElseIf aiButton == 3
		GoldCost.SetValue(500)
		Settings(abMenu, aiButton)
	ElseIf aiButton == 4
		GoldCost.SetValue(1000)
		Settings(abMenu, aiButton)
	ElseIf aiButton == 5
		GoldCost.SetValue(2500)
		Settings(abMenu, aiButton)
	ElseIf aiButton == 6 ; back
		Settings(abMenu, aiButton)
	EndIf

EndFunction
