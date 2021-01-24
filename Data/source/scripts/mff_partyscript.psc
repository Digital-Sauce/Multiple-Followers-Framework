Scriptname MFF_PartyScript extends Quest  

MiscObject Property Gold001 Auto

GlobalVariable Property GoldCost Auto

GlobalVariable Property InfightingFollowers Auto
GlobalVariable Property InfightingPlayer Auto

GlobalVariable Property BowTypeDefault Auto
GlobalVariable Property BowTypeWood Auto
GlobalVariable Property BowTypeSteel Auto
GlobalVariable Property BowTypeBound Auto

GlobalVariable Property FollowerBows Auto
GlobalVariable Property AnimalBows Auto
GlobalVariable Property NPCBows Auto

GlobalVariable Property WaitLimit Auto
GlobalVariable Property WaitTime Auto

GlobalVariable Property PartyLimit Auto

Keyword Property Horse Auto

MFF_Script Property MFF Auto

Actor Property Player Auto
Actor Property MountReceiver Auto

Faction Property PlayerAlly Auto

Faction Property FollowerFaction Auto
Faction Property AnimalFaction Auto
Faction Property NPCFaction Auto

Faction Property PotentialFollowerFaction Auto
Faction Property PotentialAnimalFaction Auto
Faction Property DismissedFollowerFaction Auto
Faction Property CurrentHirelingFaction Auto

Faction Property RidingFaction Auto
Faction Property OwnedMount Auto

Weapon Property HiddenBowDefault Auto
Weapon Property HiddenBowWood Auto
Weapon Property HiddenBowSteel Auto
Weapon Property HiddenBowBound Auto

Ammo Property HiddenArrowDefault Auto
Ammo Property HiddenArrowWood Auto
Ammo Property HiddenArrowSteel Auto
Ammo Property HiddenArrowBound Auto

Spell Property GiveMountSpell Auto

Quest Property LinkQuest Auto
Quest Property Hirelings Auto

Message Property LimitReachedMessage Auto
Message Property RecruitedMessage Auto
Message Property DismissMessage Auto

Message Property GiveMountMessage Auto
Message Property MountSetMessage Auto

Message Property GoldError Auto

Int MountHit

Function Recruit(ObjectReference ref, Bool Messaging = true)
	(LinkQuest as MFF_PartyLink).RecruitPre(ref)

	If MFF.Count < PartyLimit.GetValue() as Int
		If GoldCost.GetValue() <= 0
			RecruitAlias(ref, none, Messaging)
		ElseIf Player.GetItemCount(Gold001) >= GoldCost.GetValue()
			Player.RemoveItem(Gold001, GoldCost.GetValue() as Int)
			(ref as Actor).AddItem(Gold001, GoldCost.GetValue() as Int)
			RecruitAlias(ref, none, Messaging)
		Else
			GoldError.Show()
		EndIf
	EndIf

	If MFF.Count >= PartyLimit.GetValue()
		LimitReachedMessage.Show()
	EndIf

	(LinkQuest as MFF_PartyLink).RecruitPost(ref)
EndFunction


Function Follow(ObjectReference ref)
	(LinkQuest as MFF_PartyLink).FollowPre(ref)
	(ref as Actor).UnRegisterForUpdateGameTime()
	(ref as Actor).SetActorValue("WaitingForPlayer", 0)
	(LinkQuest as MFF_PartyLink).FollowPost(ref)
EndFunction


Function Favor(ObjectReference ref)
	(LinkQuest as MFF_PartyLink).FavorPre(ref)
	(ref as Actor).SetDoingFavor()
	(LinkQuest as MFF_PartyLink).FavorPost(ref)
EndFunction


Function Trade(ObjectReference ref)
	(LinkQuest as MFF_PartyLink).TradePre(ref)
	(ref as Actor).OpenInventory()
	(LinkQuest as MFF_PartyLink).TradePost(ref)
EndFunction


Function Hold(ObjectReference ref)
	(LinkQuest as MFF_PartyLink).HoldPre(ref)
	actor actorRef = ref as Actor
	If WaitLimit.GetValue() == 1
		MFF.IndexToRefAlias(MFF.RefToIndex(ref)).RegisterForUpdateGameTime(WaitTime.GetValue())
	EndIf
	actorRef.SetActorValue("WaitingForPlayer", 1)
	(LinkQuest as MFF_PartyLink).HoldPost(ref)
EndFunction


Function Rest(ObjectReference ref)
	(LinkQuest as MFF_PartyLink).RestPre(ref)
	actor actorRef = ref as Actor
	If WaitLimit.GetValue() == 1
		MFF.IndexToRefAlias(MFF.RefToIndex(ref)).RegisterForUpdateGameTime(WaitTime.GetValue())
	EndIf
	actorRef.SetActorValue("WaitingForPlayer", 2)
	(LinkQuest as MFF_PartyLink).RestPost(ref)
EndFunction


Function Dismiss(ObjectReference ref, Bool Messaging = true)
	(LinkQuest as MFF_PartyLink).DismissPre(ref)
	Int index = MFF.RefToIndex(ref)
	If index < 512 ; is in range
		DismissAlias(MFF.IndexToRefAlias(index), Messaging)
	EndIf
	(LinkQuest as MFF_PartyLink).DismissPost(ref)
EndFunction


Function Calm(ObjectReference ref)
	(ref as Actor).StopCombat()
	(ref as Actor).StopCombatAlarm()
EndFunction


Function AddBow(ObjectReference ref, Int Type = 0)
	If Type == 0
		If BowTypeWood.GetValue() == 1
			ref.AddItem (HiddenBowWood, 1, true)
			ref.AddItem (HiddenArrowWood, 999, true)
		ElseIf BowTypeSteel.GetValue() == 1
			ref.AddItem (HiddenBowSteel, 1, true)
			ref.AddItem (HiddenArrowSteel, 999, true)
		ElseIf BowTypeBound.GetValue() == 1
			ref.AddItem (HiddenBowBound, 1, true)
			ref.AddItem (HiddenArrowBound, 999, true)
		ElseIf BowTypeDefault.GetValue() == 1
			ref.AddItem (HiddenBowDefault, 1, true)
			ref.AddItem (HiddenArrowDefault, 999, true)
		EndIf
	Else
		If Type == 1
			ref.AddItem (HiddenBowWood, 1, true)
			ref.AddItem (HiddenArrowWood, 999, true)
		ElseIf Type == 2
			ref.AddItem (HiddenBowSteel, 1, true)
			ref.AddItem (HiddenArrowSteel, 999, true)
		ElseIf Type == 3
			ref.AddItem (HiddenBowBound, 1, true)
			ref.AddItem (HiddenArrowBound, 999, true)
		ElseIf Type == 4
			ref.AddItem (HiddenBowDefault, 1, true)
			ref.AddItem (HiddenArrowDefault, 999, true)
		EndIf
	EndIf
EndFunction

Function RemoveBows(ObjectReference ref)
	ref.RemoveItem (HiddenBowDefault, 999, true)
	ref.RemoveItem (HiddenArrowDefault, 999, true)
	ref.RemoveItem (HiddenBowWood, 999, true)
	ref.RemoveItem (HiddenArrowWood, 999, true)
	ref.RemoveItem (HiddenBowSteel, 999, true)
	ref.RemoveItem (HiddenArrowSteel, 999, true)
	ref.RemoveItem (HiddenBowBound, 999, true)
	ref.RemoveItem (HiddenArrowBound, 999, true)
EndFunction


Function EnableMountGiving(ObjectReference ref)
	MountReceiver = ref as Actor
	MountHit = 0
	Player.EquipSpell(GiveMountSpell, 0)
	GiveMountMessage.Show()
EndFunction

Function DisableMountGiving()
	MountReceiver = None
	Player.UnequipSpell(GiveMountSpell, 0)
EndFunction

Function GiveMount(ObjectReference ref, Bool ShowMessage = true)
	If MountHit == 0
		MountHit = 1
		SetOwnership(MountReceiver, ref)
		(ref as Actor).AddToFaction(OwnedMount)
		If ShowMessage
			MountSetMessage.Show()
		EndIf
		DisableMountGiving()
	EndIf
EndFunction

Function MountUp(ObjectReference ref)
	(ref as Actor).AddToFaction(RidingFaction)
EndFunction

Function Dismount(ObjectReference ref)
	(ref as Actor).RemoveFromFaction(RidingFaction)
EndFunction


Function AddInfighting(ObjectReference ref, String Type = "")

	MFF_RefAlias refAlias = MFF.IndexToRefAlias(MFF.RefToIndex(ref))

	If Type == ""
		refAlias.InfightingParty = 1
		refAlias.InfightingPlayer = 1
	ElseIf Type == "Party"
		refAlias.InfightingParty = 1
	ElseIf Type == "Player"
		refAlias.InfightingPlayer = 1
	EndIf
EndFunction

Function RemoveInfighting(ObjectReference ref,  String Type = "")

	MFF_RefAlias refAlias = MFF.IndexToRefAlias(MFF.RefToIndex(ref))

	If Type == ""
		refAlias.InfightingParty = 0
		refAlias.InfightingPlayer = 0
	ElseIf Type == "Party"
		refAlias.InfightingParty = 0
	ElseIf Type == "Player"
		refAlias.InfightingPlayer = 0
	EndIf
EndFunction

Function DisableInfighting(ObjectReference ref,  String Type = "")

	MFF_RefAlias refAlias = MFF.IndexToRefAlias(MFF.RefToIndex(ref))

	If Type == ""
		refAlias.InfightingParty = -1
		refAlias.InfightingPlayer = -1
	ElseIf Type == "Party"
		refAlias.InfightingParty = -1
	ElseIf Type == "Player"
		refAlias.InfightingPlayer = -1
	EndIf

EndFunction


Function RecruitAlias(ObjectReference ref, MFF_RefAlias refAlias = None, Bool SendMessage = true)

	Actor RecruitedFollower = ref as Actor

	If MFF.ContainsRef(RecruitedFollower) == false && MFF.Count < PartyLimit.GetValue()

		MFF.Count += 1

		If refAlias == None
			refAlias = MFF.NextAlias()
			refAlias.ForceRefTo(RecruitedFollower)
		Else
			refAlias.ForceRefTo(RecruitedFollower)
		EndIf

		(LinkQuest as MFF_PartyLink).RecruitAliasPre(refAlias)

		; adds NPC to MFF based on default settings used for basic followers and animal followers

		; add as follower
		;If RecruitedFollower.GetFactionRank(PotentialFollowerFaction) > -2 && RecruitedFollower.GetRelationshipRank(Player) > 2
		If RecruitedFollower.GetFactionRank(PotentialFollowerFaction) > -2

			RecruitedFollower.RemoveFromFaction(DismissedFollowerFaction)
			RecruitedFollower.RemoveFromFaction(PotentialFollowerFaction)
			RecruitedFollower.AddToFaction(FollowerFaction)

			RemoveBows(RecruitedFollower as ObjectReference)
			If FollowerBows.GetValue() == 1
				AddBow(RecruitedFollower as ObjectReference)
			EndIf

		; add as animal
		ElseIf RecruitedFollower.GetFactionRank(PotentialAnimalFaction) > -2

			RecruitedFollower.RemoveFromFaction(PotentialAnimalFaction)
			RecruitedFollower.AddToFaction(AnimalFaction)

			RemoveBows(RecruitedFollower as ObjectReference)
			If AnimalBows.GetValue() == 1
				AddBow(RecruitedFollower as ObjectReference)
			EndIf

		; add as NPC
		Else

			refAlias.RelationshipRank = RecruitedFollower.GetRelationshipRank(Player)

			RecruitedFollower.AddToFaction(NPCFaction)	

			RemoveBows(RecruitedFollower as ObjectReference)
			If NPCBows.GetValue() == 1
				AddBow(RecruitedFollower as ObjectReference)
			EndIf
		EndIf

		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

		refAlias.InfightingParty = InfightingFollowers.GetValue() as Int
		refAlias.InfightingPlayer = InfightingPlayer.GetValue() as Int
		refAlias.MoralityRank = RecruitedFollower.GetAV ("Morality") as Int

		RecruitedFollower.SetActorValue("Morality", 0)
		RecruitedFollower.SetRelationshipRank(Player, 4)
		RecruitedFollower.SetPlayerTeammate()
		RecruitedFollower.StopCombat()
		RecruitedFollower.StopCombatAlarm()

		If SendMessage
			RecruitedMessage.Show()
		EndIf

	EndIf

	(LinkQuest as MFF_PartyLink).RecruitAliasPost(refAlias)
EndFunction


Function DismissAlias(MFF_RefAlias aliasRef, Bool SendMessage = true)
	(LinkQuest as MFF_PartyLink).DismissAliasPre(aliasRef)

	Actor DismissedFollower = aliasRef.GetReference() as Actor

	If DismissedFollower.GetFactionRank(FollowerFaction) > -2
		DismissedFollower.RemoveFromFaction(FollowerFaction)
		DismissedFollower.AddToFaction(DismissedFollowerFaction)
		DismissedFollower.AddToFaction(PotentialFollowerFaction)

		DismissedFollower.RemoveFromFaction(CurrentHirelingFaction)

		;hireling rehire function
;		Hirelings.DismissHireling(DismissedFollower.GetActorBase())

	ElseIf DismissedFollower.GetFactionRank(AnimalFaction) > -2
		DismissedFollower.RemoveFromFaction(AnimalFaction)
		DismissedFollower.AddToFaction(PotentialAnimalFaction)

	ElseIf DismissedFollower.GetFactionRank(NPCFaction) > -2
		DismissedFollower.RemoveFromFaction(NPCFaction)
		DismissedFollower.SetRelationshipRank(Player, aliasRef.RelationshipRank)
		DismissedFollower.SetAV("Morality", aliasRef.MoralityRank)
	EndIf

	If DismissedFollower.GetFactionRank(RidingFaction) > -2
		DismissedFollower.RemoveFromFaction(RidingFaction)
		DismissedFollower.Dismount()
	EndIf

	DismissedFollower.SetPlayerTeammate(false)
	DismissedFollower.SetActorValue("WaitingForPlayer", 0)

	DismissedFollower.RemoveItem(HiddenBowDefault, 999, true)
	DismissedFollower.RemoveItem(HiddenBowWood, 999, true)
	DismissedFollower.RemoveItem(HiddenBowSteel, 999, true)
	DismissedFollower.RemoveItem(HiddenBowBound, 999, true)
	DismissedFollower.RemoveItem(HiddenArrowDefault, 999, true)
	DismissedFollower.RemoveItem(HiddenArrowWood, 999, true)
	DismissedFollower.RemoveItem(HiddenArrowSteel, 999, true)
	DismissedFollower.RemoveItem(HiddenArrowBound, 999, true)

	aliasRef.Clear()
	MFF.Count -= 1

	If SendMessage
		DismissMessage.Show()
	EndIf

	(LinkQuest as MFF_PartyLink).DismissAliasPost(aliasRef)
EndFunction



;;; HELPERS

Function SetOwnership(ObjectReference PartyMember, ObjectReference Target)
	Int index = MFF.RefToIndex(PartyMember)

	If index < 512
		Target.SetFactionOwner(MFF.IndexToOwnerFaction(index))
	EndIf
EndFunction

Function SetBowType(String Type = "")

	BowTypeDefault.SetValue(0)
	BowTypeWood.SetValue(0)
	BowTypeSteel.SetValue(0)
	BowTypeBound.SetValue(0)

	If Type == ""
		BowTypeDefault.SetValue(1)
	ElseIf Type == "Wood"
		BowTypeWood.SetValue(1)
	ElseIf Type == "Steel"
		BowTypeSteel.SetValue(1)
	ElseIf Type == "Bound"
		BowTypeBound.SetValue(1)
	EndIf
EndFunction

Function SetPartyLimit(Int Limit = 512)

	PartyLimit.SetValue(Limit)

	Int i = Limit
	While i < 512
		MFF_RefAlias refAlias = MFF.IndexToRefAlias(i)
		If refAlias.GetReference() != None
			DismissAlias(refAlias)
		EndIf

		i += 1
	EndWhile
EndFunction

Function Summon(ObjectReference ref)
	(LinkQuest as MFF_PartyLink).SummonPre(ref)

	Int index = MFF.RefToIndex(ref)
	SummonAlias(MFF.IndexToRefAlias(index))

	(LinkQuest as MFF_PartyLink).SummonPost(ref)	
EndFunction

Function SummonAlias(MFF_RefAlias aliasRef)
	(LinkQuest as MFF_PartyLink).SummonAliasPre(aliasRef)

	Actor SummonedFollower = aliasRef.GetReference() as Actor
	Int index = MFF.RefToIndex(SummonedFollower)

	SummonedFollower.MoveTo(Player,0, 150.0 * Math.Cos(Player.GetAngleZ()), Player.GetHeight() + 3.0)
	SummonedFollower.SetActorValue("WaitingForPlayer", 0)

	(LinkQuest as MFF_PartyLink).SummonAliasPost(aliasRef)
EndFunction