Scriptname MFF_MenuPowersScript extends Quest  

GlobalVariable Property RecruitFollower Auto
GlobalVariable Property RecruitAnimal Auto
GlobalVariable Property RecruitNPC Auto

GlobalVariable Property GiveSafety Auto


Actor Property Player Auto


Spell Property SpellTargetRecruit Auto
Spell Property SpellTargetDismiss Auto
Spell Property SpellTargetFollow Auto
Spell Property SpellTargetHold Auto
Spell Property SpellTargetRest Auto

Spell Property SpellTargetMountUp Auto
Spell Property SpellTargetDismount Auto

Spell Property SpellGroupRecruit Auto
Spell Property SpellGroupDismiss Auto
Spell Property SpellGroupFollow Auto
Spell Property SpellGroupHold Auto
Spell Property SpellGroupRest Auto

Spell Property SpellGroupMountUp Auto
Spell Property SpellGroupDismount Auto

Spell Property SpellGlobalRally Auto

Spell Property SpellMountTargetRecruit Auto
Spell Property SpellMountTargetDismiss Auto
Spell Property SpellMountTargetFollow Auto
Spell Property SpellMountTargetHold Auto
Spell Property SpellMountTargetRest Auto

Spell Property SpellMountGroupRecruit Auto
Spell Property SpellMountGroupDismiss Auto
Spell Property SpellMountGroupFollow Auto
Spell Property SpellMountGroupHold Auto
Spell Property SpellMountGroupRest Auto

Spell Property SpellMountGlobalRally Auto


Message Property PowersPage Auto
Message Property PowersPartyPage Auto
Message Property PowersMountPage Auto
Message Property PowersAllPage Auto

Message Property PowersTargetPage Auto
Message Property PowersGroupPage Auto
Message Property PowersGlobalPage Auto
Message Property PowersRecruitmentPage Auto
Message Property PowersPartyAllPage Auto

Message Property PowersTargetRecruitPage Auto
Message Property PowersTargetDismissPage Auto
Message Property PowersTargetFollowPage Auto
Message Property PowersTargetHoldPage Auto
Message Property PowersTargetRestPage Auto
Message Property PowersTargetMountPage Auto
Message Property PowersTargetDismountPage Auto
Message Property PowersTargetAllPage Auto

Message Property PowersGroupRecruitPage Auto
Message Property PowersGroupDismissPage Auto
Message Property PowersGroupFollowPage Auto
Message Property PowersGroupHoldPage Auto
Message Property PowersGroupRestPage Auto
Message Property PowersGroupMountPage Auto
Message Property PowersGroupDismountPage Auto
Message Property PowersGroupAllPage Auto

Message Property PowersGlobalRallyPage Auto

Message Property PowersRecruitFollowerPage Auto
Message Property PowersRecruitAnimalPage Auto
Message Property PowersRecruitNPCPage Auto

Message Property PowersMountGiveSafetyPage Auto
Message Property PowersMountTargetPage Auto
Message Property PowersMountGroupPage Auto
Message Property PowersMountGlobalPage Auto
Message Property PowersMountAllPage Auto

Message Property PowersMountTargetRecruitPage Auto
Message Property PowersMountTargetDismissPage Auto
Message Property PowersMountTargetFollowPage Auto
Message Property PowersMountTargetHoldPage Auto
Message Property PowersMountTargetRestPage Auto
Message Property PowersMountTargetAllPage Auto

Message Property PowersMountGroupRecruitPage Auto
Message Property PowersMountGroupDismissPage Auto
Message Property PowersMountGroupFollowPage Auto
Message Property PowersMountGroupHoldPage Auto
Message Property PowersMountGroupRestPage Auto
Message Property PowersMountGroupAllPage Auto

Message Property PowersMountGlobalRallyPage Auto


Quest Property CoreQuest Auto

Function Powers(Bool abMenu, Int aiButton)

	aiButton = PowersPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1
		Party(abMenu, aiButton)
	ElseIf aiButton == 2
		Mount(abMenu, aiButton)
	ElseIf aiButton == 3
		All(abMenu, aiButton)
	ElseIf aiButton == 4 ; Back
		(CoreQuest as MFF_ModMenu).Menu(abMenu, aiButton)
	EndIf
EndFunction


Function Party(Bool abMenu, Int aiButton)

	aiButton = PowersPartyPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1
		PartyRecruitment(abMenu, aiButton)
	ElseIf aiButton == 2
		PartyTarget(abMenu, aiButton)
	ElseIf aiButton == 3
		PartyGroup(abMenu, aiButton)
	ElseIf aiButton == 4
		PartyGlobal(abMenu, aiButton)
	ElseIf aiButton == 5
		PartyAll(abMenu, aiButton)
	ElseIf aiButton == 6 ; Back
		Powers(abMenu, aiButton)
	EndIf

EndFunction


Function PartyRecruitment(Bool abMenu, Int aiButton)

	aiButton = PowersRecruitmentPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1
		RecruitFollower(abMenu, aiButton)
	ElseIf aiButton == 2
		RecruitAnimal(abMenu, aiButton)
	ElseIf aiButton == 3
		RecruitNPC(abMenu, aiButton)
	ElseIf aiButton == 4 ; Back
		Party(abMenu, aiButton)
	EndIf

EndFunction

Function RecruitFollower(Bool abMenu, Int aiButton)

	aiButton = PowersRecruitFollowerPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; enable
		RecruitFollower.SetValue(1)
		PartyRecruitment(abMenu, aiButton)
	ElseIf aiButton == 2 ; disable
		RecruitFollower.SetValue(0)
		PartyRecruitment(abMenu, aiButton)
	ElseIf aiButton == 3 ; Back
		PartyRecruitment(abMenu, aiButton)
	EndIf

EndFunction

Function RecruitAnimal(Bool abMenu, Int aiButton)

	aiButton = PowersRecruitAnimalPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; enable
		RecruitAnimal.SetValue(1)
		PartyRecruitment(abMenu, aiButton)
	ElseIf aiButton == 2 ; disable
		RecruitAnimal.SetValue(0)
		PartyRecruitment(abMenu, aiButton)
	ElseIf aiButton == 3 ; Back
		PartyRecruitment(abMenu, aiButton)
	EndIf

EndFunction

Function RecruitNPC(Bool abMenu, Int aiButton)

	aiButton = PowersRecruitNPCPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; enable
		RecruitNPC.SetValue(1)
		PartyRecruitment(abMenu, aiButton)
	ElseIf aiButton == 2 ; disable
		RecruitNPC.SetValue(0)
		PartyRecruitment(abMenu, aiButton)
	ElseIf aiButton == 3 ; Back
		PartyRecruitment(abMenu, aiButton)
	EndIf

EndFunction


Function PartyTarget(Bool abMenu, Int aiButton)

	aiButton = PowersTargetPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1
		TargetRecruit(abMenu, aiButton)
	ElseIf aiButton == 2
		TargetDismiss(abMenu, aiButton)
	ElseIf aiButton == 3
		TargetFollow(abMenu, aiButton)
	ElseIf aiButton == 4
		TargetHold(abMenu, aiButton)
	ElseIf aiButton == 5
		TargetRest(abMenu, aiButton)
	ElseIf aiButton == 6
		TargetMount(abMenu, aiButton)
	ElseIf aiButton == 7
		TargetDismount(abMenu, aiButton)
	ElseIf aiButton == 8
		TargetAll(abMenu, aiButton)
	ElseIf aiButton == 9 ; Back
		Party(abMenu, aiButton)
	EndIf

EndFunction

Function TargetRecruit(Bool abMenu, Int aiButton)

	aiButton = PowersTargetRecruitPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; enable
		Player.AddSpell(SpellTargetRecruit)
		PartyTarget(abMenu, aiButton)
	ElseIf aiButton == 2 ; disable
		Player.RemoveSpell(SpellTargetRecruit)
		PartyTarget(abMenu, aiButton)
	ElseIf aiButton == 3 ; Back
		PartyTarget(abMenu, aiButton)
	EndIf

EndFunction

Function TargetDismiss(Bool abMenu, Int aiButton)

	aiButton = PowersTargetDismissPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; enable
		Player.AddSpell(SpellTargetDismiss)
		PartyTarget(abMenu, aiButton)
	ElseIf aiButton == 2 ; disable
		Player.RemoveSpell(SpellTargetDismiss)
		PartyTarget(abMenu, aiButton)
	ElseIf aiButton == 3 ; Back
		PartyTarget(abMenu, aiButton)
	EndIf

EndFunction

Function TargetFollow(Bool abMenu, Int aiButton)

	aiButton = PowersTargetFollowPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; enable
		Player.AddSpell(SpellTargetFollow)
		PartyTarget(abMenu, aiButton)
	ElseIf aiButton == 2 ; disable
		Player.RemoveSpell(SpellTargetFollow)
		PartyTarget(abMenu, aiButton)
	ElseIf aiButton == 3 ; Back
		PartyTarget(abMenu, aiButton)
	EndIf

EndFunction

Function TargetHold(Bool abMenu, Int aiButton)

	aiButton = PowersTargetHoldPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; enable
		Player.AddSpell(SpellTargetHold)
		PartyTarget(abMenu, aiButton)
	ElseIf aiButton == 2 ; disable
		Player.RemoveSpell(SpellTargetHold)
		PartyTarget(abMenu, aiButton)
	ElseIf aiButton == 3 ; Back
		PartyTarget(abMenu, aiButton)
	EndIf

EndFunction

Function TargetRest(Bool abMenu, Int aiButton)

	aiButton = PowersTargetRestPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; enable
		Player.AddSpell(SpellTargetRest)
		PartyTarget(abMenu, aiButton)
	ElseIf aiButton == 2 ; disable
		Player.RemoveSpell(SpellTargetRest)
		PartyTarget(abMenu, aiButton)
	ElseIf aiButton == 3 ; Back
		PartyTarget(abMenu, aiButton)
	EndIf

EndFunction

Function TargetMount(Bool abMenu, Int aiButton)

	aiButton = PowersTargetMountPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; enable
		Player.AddSpell(SpellTargetMountUp)
		PartyTarget(abMenu, aiButton)
	ElseIf aiButton == 2 ; disable
		Player.RemoveSpell(SpellTargetMountUp)
		PartyTarget(abMenu, aiButton)
	ElseIf aiButton == 3 ; Back
		PartyTarget(abMenu, aiButton)
	EndIf

EndFunction

Function TargetDismount(Bool abMenu, Int aiButton)

	aiButton = PowersTargetDismountPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; enable
		Player.AddSpell(SpellTargetDismount)
		PartyTarget(abMenu, aiButton)
	ElseIf aiButton == 2 ; disable
		Player.RemoveSpell(SpellTargetDismount)
		PartyTarget(abMenu, aiButton)
	ElseIf aiButton == 3 ; Back
		PartyTarget(abMenu, aiButton)
	EndIf

EndFunction

Function TargetAll(Bool abMenu, Int aiButton)

	aiButton = PowersTargetAllPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; enable
		AddAllPowersTarget()
		PartyTarget(abMenu, aiButton)
	ElseIf aiButton == 2 ; disable
		RemoveAllPowersTarget()
		PartyTarget(abMenu, aiButton)
	ElseIf aiButton == 3 ; Back
		PartyTarget(abMenu, aiButton)
	EndIf

EndFunction


Function PartyGroup(Bool abMenu, Int aiButton)

	aiButton = PowersGroupPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1
		GroupRecruit(abMenu, aiButton)
	ElseIf aiButton == 2
		GroupDismiss(abMenu, aiButton)
	ElseIf aiButton == 3
		GroupFollow(abMenu, aiButton)
	ElseIf aiButton == 4
		GroupHold(abMenu, aiButton)
	ElseIf aiButton == 5
		GroupRest(abMenu, aiButton)
	ElseIf aiButton == 6
		GroupMount(abMenu, aiButton)
	ElseIf aiButton == 7
		GroupDismount(abMenu, aiButton)
	ElseIf aiButton == 8
		GroupAll(abMenu, aiButton)
	ElseIf aiButton == 9 ; Back
		Party(abMenu, aiButton)
	EndIf

EndFunction

Function GroupRecruit(Bool abMenu, Int aiButton)

	aiButton = PowersGroupRecruitPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; enable
		Player.AddSpell(SpellGroupRecruit)
		PartyGroup(abMenu, aiButton)
	ElseIf aiButton == 2 ; disable
		Player.RemoveSpell(SpellGroupRecruit)
		PartyGroup(abMenu, aiButton)
	ElseIf aiButton == 3 ; Back
		PartyGroup(abMenu, aiButton)
	EndIf

EndFunction

Function GroupDismiss(Bool abMenu, Int aiButton)

	aiButton = PowersGroupDismissPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; enable
		Player.AddSpell(SpellGroupDismiss)
		PartyGroup(abMenu, aiButton)
	ElseIf aiButton == 2 ; disable
		Player.RemoveSpell(SpellGroupDismiss)
		PartyGroup(abMenu, aiButton)
	ElseIf aiButton == 3 ; Back
		PartyGroup(abMenu, aiButton)
	EndIf

EndFunction

Function GroupFollow(Bool abMenu, Int aiButton)

	aiButton = PowersGroupFollowPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; enable
		Player.AddSpell(SpellGroupFollow)
		PartyGroup(abMenu, aiButton)
	ElseIf aiButton == 2 ; disable
		Player.RemoveSpell(SpellGroupFollow)
		PartyGroup(abMenu, aiButton)
	ElseIf aiButton == 3 ; Back
		PartyGroup(abMenu, aiButton)
	EndIf

EndFunction

Function GroupHold(Bool abMenu, Int aiButton)

	aiButton = PowersGroupHoldPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; enable
		Player.AddSpell(SpellGroupHold)
		PartyGroup(abMenu, aiButton)
	ElseIf aiButton == 2 ; disable
		Player.RemoveSpell(SpellGroupHold)
		PartyGroup(abMenu, aiButton)
	ElseIf aiButton == 3 ; Back
		PartyGroup(abMenu, aiButton)
	EndIf

EndFunction

Function GroupRest(Bool abMenu, Int aiButton)

	aiButton = PowersGroupRestPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; enable
		Player.AddSpell(SpellGroupRest)
		PartyGroup(abMenu, aiButton)
	ElseIf aiButton == 2 ; disable
		Player.RemoveSpell(SpellGroupRest)
		PartyGroup(abMenu, aiButton)
	ElseIf aiButton == 3 ; Back
		PartyGroup(abMenu, aiButton)
	EndIf

EndFunction

Function GroupMount(Bool abMenu, Int aiButton)

	aiButton = PowersGroupMountPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; enable
		Player.AddSpell(SpellGroupMountUp)
		PartyGroup(abMenu, aiButton)
	ElseIf aiButton == 2 ; disable
		Player.RemoveSpell(SpellGroupMountUp)
		PartyGroup(abMenu, aiButton)
	ElseIf aiButton == 3 ; Back
		PartyGroup(abMenu, aiButton)
	EndIf

EndFunction

Function GroupDismount(Bool abMenu, Int aiButton)

	aiButton = PowersGroupDismountPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; enable
		Player.AddSpell(SpellGroupDismount)
		PartyGroup(abMenu, aiButton)
	ElseIf aiButton == 2 ; disable
		Player.RemoveSpell(SpellGroupDismount)
		PartyGroup(abMenu, aiButton)
	ElseIf aiButton == 3 ; Back
		PartyGroup(abMenu, aiButton)
	EndIf

EndFunction

Function GroupAll(Bool abMenu, Int aiButton)

	aiButton = PowersGroupAllPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; enable
		AddAllPowersGroup()
		PartyGroup(abMenu, aiButton)
	ElseIf aiButton == 2 ; disable
		RemoveAllPowersGroup()
		PartyGroup(abMenu, aiButton)
	ElseIf aiButton == 3 ; Back
		PartyGroup(abMenu, aiButton)
	EndIf

EndFunction


Function PartyGlobal(Bool abMenu, Int aiButton)

	aiButton = PowersGlobalPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1
		GlobalRally(abMenu, aiButton)
	ElseIf aiButton == 2 ; Back
		Party(abMenu, aiButton)
	EndIf

EndFunction

Function GlobalRally(Bool abMenu, Int aiButton)

	aiButton = PowersGlobalRallyPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; enable
		Player.AddSpell(SpellGlobalRally)
		PartyGlobal(abMenu, aiButton)
	ElseIf aiButton == 2 ; disable
		Player.RemoveSpell(SpellGlobalRally)
		PartyGlobal(abMenu, aiButton)
	ElseIf aiButton == 3 ; Back
		PartyGlobal(abMenu, aiButton)
	EndIf

EndFunction

Function PartyAll(Bool abMenu, Int aiButton)

	aiButton = PowersPartyAllPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; enable
		AddAllPowersTarget()
		AddAllPowersGroup()
		Player.AddSpell(SpellGlobalRally)
		Party(abMenu, aiButton)
	ElseIf aiButton == 2 ; disable
		RemoveAllPowersTarget()
		RemoveAllPowersGroup()
		Player.RemoveSpell(SpellGlobalRally)
		Party(abMenu, aiButton)
	ElseIf aiButton == 3 ; Back
		Party(abMenu, aiButton)
	EndIf

EndFunction


Function Mount(Bool abMenu, Int aiButton)

	aiButton = PowersMountPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1
		MountGiveSafety(abMenu, aiButton)
	ElseIf aiButton == 2
		MountTarget(abMenu, aiButton)
	ElseIf aiButton == 3
		MountGroup(abMenu, aiButton)
	ElseIf aiButton == 4
		MountGlobal(abMenu, aiButton)
	ElseIf aiButton == 5
		MountAll(abMenu, aiButton)
	ElseIf aiButton == 6 ; Back
		Powers(abMenu, aiButton)
	EndIf

EndFunction


Function MountGiveSafety(Bool abMenu, Int aiButton)

	aiButton = PowersMountGiveSafetyPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; enable
		GiveSafety.SetValue(1)
		Mount(abMenu, aiButton)
	ElseIf aiButton == 2 ; disable
		GiveSafety.SetValue(0)
		Mount(abMenu, aiButton)
	ElseIf aiButton == 3 ; Back
		Mount(abMenu, aiButton)
	EndIf

EndFunction


Function MountTarget(Bool abMenu, Int aiButton)

	aiButton = PowersMountTargetPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1
		MountTargetRecruit(abMenu, aiButton)
	ElseIf aiButton == 2
		MountTargetDismiss(abMenu, aiButton)
	ElseIf aiButton == 3
		MountTargetFollow(abMenu, aiButton)
	ElseIf aiButton == 4
		MountTargetHold(abMenu, aiButton)
	ElseIf aiButton == 5
		MountTargetRest(abMenu, aiButton)
	ElseIf aiButton == 6
		MountTargetAll(abMenu, aiButton)
	ElseIf aiButton == 7 ; Back
		Mount(abMenu, aiButton)
	EndIf

EndFunction

Function MountTargetRecruit(Bool abMenu, Int aiButton)

	aiButton = PowersMountTargetRecruitPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; enable
		Player.AddSpell(SpellMountTargetRecruit)
		MountTarget(abMenu, aiButton)
	ElseIf aiButton == 2 ; disable
		Player.RemoveSpell(SpellMountTargetRecruit)
		MountTarget(abMenu, aiButton)
	ElseIf aiButton == 3 ; Back
		MountTarget(abMenu, aiButton)
	EndIf

EndFunction

Function MountTargetDismiss(Bool abMenu, Int aiButton)

	aiButton = PowersMountTargetDismissPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; enable
		Player.AddSpell(SpellMountTargetDismiss)
		MountTarget(abMenu, aiButton)
	ElseIf aiButton == 2 ; disable
		Player.RemoveSpell(SpellMountTargetDismiss)
		MountTarget(abMenu, aiButton)
	ElseIf aiButton == 3 ; Back
		MountTarget(abMenu, aiButton)
	EndIf

EndFunction

Function MountTargetFollow(Bool abMenu, Int aiButton)

	aiButton = PowersMountTargetFollowPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; enable
		Player.AddSpell(SpellMountTargetFollow)
		MountTarget(abMenu, aiButton)
	ElseIf aiButton == 2 ; disable
		Player.RemoveSpell(SpellMountTargetFollow)
		MountTarget(abMenu, aiButton)
	ElseIf aiButton == 3 ; Back
		MountTarget(abMenu, aiButton)
	EndIf

EndFunction

Function MountTargetHold(Bool abMenu, Int aiButton)

	aiButton = PowersMountTargetHoldPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; enable
		Player.AddSpell(SpellMountTargetHold)
		MountTarget(abMenu, aiButton)
	ElseIf aiButton == 2 ; disable
		Player.RemoveSpell(SpellMountTargetHold)
		MountTarget(abMenu, aiButton)
	ElseIf aiButton == 3 ; Back
		MountTarget(abMenu, aiButton)
	EndIf

EndFunction

Function MountTargetRest(Bool abMenu, Int aiButton)

	aiButton = PowersMountTargetRestPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; enable
		Player.AddSpell(SpellMountTargetRest)
		MountTarget(abMenu, aiButton)
	ElseIf aiButton == 2 ; disable
		Player.RemoveSpell(SpellMountTargetRest)
		MountTarget(abMenu, aiButton)
	ElseIf aiButton == 3 ; Back
		MountTarget(abMenu, aiButton)
	EndIf

EndFunction

Function MountTargetAll(Bool abMenu, Int aiButton)

	aiButton = PowersMountTargetAllPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; enable
		AddAllPowersTarget()
		MountTarget(abMenu, aiButton)
	ElseIf aiButton == 2 ; disable
		RemoveAllPowersTarget()
		MountTarget(abMenu, aiButton)
	ElseIf aiButton == 3 ; Back
		MountTarget(abMenu, aiButton)
	EndIf

EndFunction


Function MountGroup(Bool abMenu, Int aiButton)

	aiButton = PowersMountGroupPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1
		MountGroupRecruit(abMenu, aiButton)
	ElseIf aiButton == 2
		MountGroupDismiss(abMenu, aiButton)
	ElseIf aiButton == 3
		MountGroupFollow(abMenu, aiButton)
	ElseIf aiButton == 4
		MountGroupHold(abMenu, aiButton)
	ElseIf aiButton == 5
		MountGroupRest(abMenu, aiButton)
	ElseIf aiButton == 6
		MountGroupAll(abMenu, aiButton)
	ElseIf aiButton == 7 ; Back
		Mount(abMenu, aiButton)
	EndIf

EndFunction

Function MountGroupRecruit(Bool abMenu, Int aiButton)

	aiButton = PowersMountGroupRecruitPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; enable
		Player.AddSpell(SpellMountGroupRecruit)
		MountGroup(abMenu, aiButton)
	ElseIf aiButton == 2 ; disable
		Player.RemoveSpell(SpellMountGroupRecruit)
		MountGroup(abMenu, aiButton)
	ElseIf aiButton == 3 ; Back
		MountGroup(abMenu, aiButton)
	EndIf

EndFunction

Function MountGroupDismiss(Bool abMenu, Int aiButton)

	aiButton = PowersMountGroupDismissPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; enable
		Player.AddSpell(SpellMountGroupDismiss)
		MountGroup(abMenu, aiButton)
	ElseIf aiButton == 2 ; disable
		Player.RemoveSpell(SpellMountGroupDismiss)
		MountGroup(abMenu, aiButton)
	ElseIf aiButton == 3 ; Back
		MountGroup(abMenu, aiButton)
	EndIf

EndFunction

Function MountGroupFollow(Bool abMenu, Int aiButton)

	aiButton = PowersMountGroupFollowPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; enable
		Player.AddSpell(SpellMountGroupFollow)
		MountGroup(abMenu, aiButton)
	ElseIf aiButton == 2 ; disable
		Player.RemoveSpell(SpellMountGroupFollow)
		MountGroup(abMenu, aiButton)
	ElseIf aiButton == 3 ; Back
		MountGroup(abMenu, aiButton)
	EndIf

EndFunction

Function MountGroupHold(Bool abMenu, Int aiButton)

	aiButton = PowersMountGroupHoldPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; enable
		Player.AddSpell(SpellMountGroupHold)
		MountGroup(abMenu, aiButton)
	ElseIf aiButton == 2 ; disable
		Player.RemoveSpell(SpellMountGroupHold)
		MountGroup(abMenu, aiButton)
	ElseIf aiButton == 3 ; Back
		MountGroup(abMenu, aiButton)
	EndIf

EndFunction

Function MountGroupRest(Bool abMenu, Int aiButton)

	aiButton = PowersMountGroupRestPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; enable
		Player.AddSpell(SpellMountGroupRest)
		MountGroup(abMenu, aiButton)
	ElseIf aiButton == 2 ; disable
		Player.RemoveSpell(SpellMountGroupRest)
		MountGroup(abMenu, aiButton)
	ElseIf aiButton == 3 ; Back
		MountGroup(abMenu, aiButton)
	EndIf

EndFunction

Function MountGroupAll(Bool abMenu, Int aiButton)

	aiButton = PowersMountGroupAllPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; enable
		AddAllPowersMountGroup()
		MountGroup(abMenu, aiButton)
	ElseIf aiButton == 2 ; disable
		RemoveAllPowersMountGroup()
		MountGroup(abMenu, aiButton)
	ElseIf aiButton == 3 ; Back
		MountGroup(abMenu, aiButton)
	EndIf

EndFunction


Function MountGlobal(Bool abMenu, Int aiButton)

	aiButton = PowersMountGlobalPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1
		MountGlobalRally(abMenu, aiButton)
	ElseIf aiButton == 2 ; Back
		Mount(abMenu, aiButton)
	EndIf

EndFunction

Function MountGlobalRally(Bool abMenu, Int aiButton)

	aiButton = PowersMountGlobalRallyPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; enable
		Player.AddSpell(SpellMountGlobalRally)
		MountGlobal(abMenu, aiButton)
	ElseIf aiButton == 2 ; disable
		Player.RemoveSpell(SpellMountGlobalRally)
		MountGlobal(abMenu, aiButton)
	ElseIf aiButton == 3 ; Back
		MountGlobal(abMenu, aiButton)
	EndIf

EndFunction

Function MountAll(Bool abMenu, Int aiButton)

	aiButton = PowersMountAllPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; enable
		AddAllPowersMountTarget()
		AddAllPowersMountGroup()
		Player.AddSpell(SpellMountGlobalRally)
		Mount(abMenu, aiButton)
	ElseIf aiButton == 2 ; disable
		RemoveAllPowersMountTarget()
		RemoveAllPowersMountGroup()
		Player.RemoveSpell(SpellMountGlobalRally)
		Mount(abMenu, aiButton)
	ElseIf aiButton == 3 ; Back
		Mount(abMenu, aiButton)
	EndIf

EndFunction


Function All(Bool abMenu, Int aiButton)

	aiButton = PowersAllPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; enable
		AddAllPowersTarget()
		AddAllPowersGroup()
		Player.AddSpell(SpellGlobalRally)
		AddAllPowersMountTarget()
		AddAllPowersMountGroup()
		Player.AddSpell(SpellMountGlobalRally)
		Powers(abMenu, aiButton)
	ElseIf aiButton == 2 ; disable
		RemoveAllPowersTarget()
		RemoveAllPowersGroup()
		Player.RemoveSpell(SpellGlobalRally)
		RemoveAllPowersMountTarget()
		RemoveAllPowersMountGroup()
		Player.RemoveSpell(SpellMountGlobalRally)
		Powers(abMenu, aiButton)
	ElseIf aiButton == 3 ; Back
		Powers(abMenu, aiButton)
	EndIf

EndFunction



; HELPERS

Function AddAllPowersTarget()
	Player.AddSpell(SpellTargetRecruit)
	Player.AddSpell(SpellTargetDismiss)
	Player.AddSpell(SpellTargetFollow)
	Player.AddSpell(SpellTargetHold)
	Player.AddSpell(SpellTargetRest)
	Player.AddSpell(SpellTargetMountUp)
	Player.AddSpell(SpellTargetDismount)
EndFunction

Function AddAllPowersMountTarget()
	Player.AddSpell(SpellMountTargetRecruit)
	Player.AddSpell(SpellMountTargetDismiss)
	Player.AddSpell(SpellMountTargetFollow)
	Player.AddSpell(SpellMountTargetHold)
	Player.AddSpell(SpellMountTargetRest)
EndFunction

Function AddAllPowersGroup()
	Player.AddSpell(SpellGroupRecruit)
	Player.AddSpell(SpellGroupDismiss)
	Player.AddSpell(SpellGroupFollow)
	Player.AddSpell(SpellGroupHold)
	Player.AddSpell(SpellGroupRest)
	Player.AddSpell(SpellGroupMountUp)
	Player.AddSpell(SpellGroupDismount)
EndFunction

Function AddAllPowersMountGroup()
	Player.AddSpell(SpellMountGroupRecruit)
	Player.AddSpell(SpellMountGroupDismiss)
	Player.AddSpell(SpellMountGroupFollow)
	Player.AddSpell(SpellMountGroupHold)
	Player.AddSpell(SpellMountGroupRest)
EndFunction


Function RemoveAllPowersTarget()
	Player.RemoveSpell(SpellTargetRecruit)
	Player.RemoveSpell(SpellTargetDismiss)
	Player.RemoveSpell(SpellTargetFollow)
	Player.RemoveSpell(SpellTargetHold)
	Player.RemoveSpell(SpellTargetRest)
	Player.RemoveSpell(SpellTargetMountUp)
	Player.RemoveSpell(SpellTargetDismount)
EndFunction

Function RemoveAllPowersMountTarget()
	Player.RemoveSpell(SpellMountTargetRecruit)
	Player.RemoveSpell(SpellMountTargetDismiss)
	Player.RemoveSpell(SpellMountTargetFollow)
	Player.RemoveSpell(SpellMountTargetHold)
	Player.RemoveSpell(SpellMountTargetRest)
EndFunction

Function RemoveAllPowersGroup()
	Player.RemoveSpell(SpellGroupRecruit)
	Player.RemoveSpell(SpellGroupDismiss)
	Player.RemoveSpell(SpellGroupFollow)
	Player.RemoveSpell(SpellGroupHold)
	Player.RemoveSpell(SpellGroupRest)
	Player.RemoveSpell(SpellGroupMountUp)
	Player.RemoveSpell(SpellGroupDismount)
EndFunction

Function RemoveAllPowersMountGroup()
	Player.RemoveSpell(SpellMountGroupRecruit)
	Player.RemoveSpell(SpellMountGroupDismiss)
	Player.RemoveSpell(SpellMountGroupFollow)
	Player.RemoveSpell(SpellMountGroupHold)
	Player.RemoveSpell(SpellMountGroupRest)
EndFunction