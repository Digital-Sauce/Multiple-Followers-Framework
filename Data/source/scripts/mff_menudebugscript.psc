Scriptname MFF_MenuDebugScript extends Quest  

GlobalVariable Property PartyLimit Auto

Faction Property FollowerFaction Auto
Faction Property AnimalFaction Auto
Faction Property NPCFaction Auto

Message Property DebugPage Auto

Message Property DebugSummonPage Auto

Message Property DebugSummonFollowersPage Auto
Message Property DebugSummonAnimalsPage Auto
Message Property DebugSummonNPCsPage Auto
Message Property DebugSummonAllPage Auto


Message Property DebugDismissPage Auto

Message Property DebugDismissFollowersPage Auto
Message Property DebugDismissAnimalsPage Auto
Message Property DebugDismissNPCsPage Auto
Message Property DebugDismissAllPage Auto

Message Property DebugIncludeWaitingPage Auto

Message Property DebugSystemSummon Auto
Message Property DebugSystemDismiss Auto


Message Property DebugRestartPage Auto

Message Property DebugShutdownPage Auto

Quest Property CoreQuest Auto
Quest Property LinkQuest Auto


Function Debug(Bool abMenu, Int aiButton)
	aiButton = DebugPage.Show()
	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; Summon
		Summon(abMenu, aiButton)
	ElseIf aiButton == 2 ; Dismiss
		Dismiss(abMenu, aiButton)
	ElseIf aiButton == 3 ; Restart
		(CoreQuest as MFF_RestartScript).Menu(abMenu, aiButton)
	ElseIf aiButton == 4 ; Shutdown
		(CoreQuest as MFF_ShutdownScript).Menu(abMenu, aiButton)
	ElseIf aiButton == 5 ; Back
		(CoreQuest as MFF_ModMenu).Menu(abMenu, aiButton)
	EndIf
EndFunction

Function Summon(Bool abMenu, Int aiButton)

	aiButton = DebugSummonPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; Summon Followers
		SummonFollowers(abMenu, aiButton)
	ElseIf aiButton == 2 ; Summon Animals
		SummonAnimals(abMenu, aiButton)
	ElseIf aiButton == 3 ; Summon NPCs
		SummonNPCs(abMenu, aiButton)
	ElseIf aiButton == 4 ; Summon All
		SummonAll(abMenu, aiButton)
	ElseIf aiButton == 5 ; back
		Debug(abMenu, aiButton)
	EndIf

EndFunction

Function SummonFollowers(Bool abMenu, Int aiButton)

	aiButton = DebugSummonFollowersPage.Show()

	If aiButton == 0 ; Confirm
		IncludeWaiting(abMenu, aiButton, "SummonFollowers")
	ElseIf aiButton == 1 ; Cancel
		Summon(abMenu, aiButton)
	EndIf

EndFunction

Function SummonAnimals(Bool abMenu, Int aiButton)

	aiButton = DebugSummonAnimalsPage.Show()

	If aiButton == 0 ; Confirm
		IncludeWaiting(abMenu, aiButton, "SummonAnimals")
	ElseIf aiButton == 1 ; Cancel
		Summon(abMenu, aiButton)
	EndIf

EndFunction

Function SummonNPCs(Bool abMenu, Int aiButton)

	aiButton = DebugSummonNPCsPage.Show()

	If aiButton == 0 ; Confirm
		IncludeWaiting(abMenu, aiButton, "SummonNPCs")
	ElseIf aiButton == 1 ; Cancel
		Summon(abMenu, aiButton)
	EndIf

EndFunction

Function SummonAll(Bool abMenu, Int aiButton)

	aiButton = DebugSummonAllPage.Show()

	If aiButton == 0 ; Confirm
		IncludeWaiting(abMenu, aiButton, "SummonAll")
	ElseIf aiButton == 1 ; Cancel
		Summon(abMenu, aiButton)
	EndIf

EndFunction



Function Dismiss(Bool abMenu, Int aiButton)

	aiButton = DebugDismissPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; Dismiss Followers
		DismissFollowers(abMenu, aiButton)
	ElseIf aiButton == 2 ; Dismiss Animals
		DismissAnimals(abMenu, aiButton)
	ElseIf aiButton == 3 ; Dismiss NPCs
		DismissNPCs(abMenu, aiButton)
	ElseIf aiButton == 4 ; Dismiss All
		DismissAll(abMenu, aiButton)
	ElseIf aiButton == 5 ; back
		Debug(abMenu, aiButton)
	EndIf

EndFunction

Function DismissFollowers(Bool abMenu, Int aiButton)

	aiButton = DebugDismissFollowersPage.Show()

	If aiButton == 0 ; Confirm
		IncludeWaiting(abMenu, aiButton, "DismissFollowers")
	ElseIf aiButton == 1 ; Cancel
		Dismiss(abMenu, aiButton)
	EndIf
EndFunction

Function DismissAnimals(Bool abMenu, Int aiButton)

	aiButton = DebugDismissAnimalsPage.Show()

	If aiButton == 0 ; Confirm
		IncludeWaiting(abMenu, aiButton, "DismissAnimals")
	ElseIf aiButton == 1 ; Cancel
		Dismiss(abMenu, aiButton)
	EndIf
EndFunction

Function DismissNPCs(Bool abMenu, Int aiButton)

	aiButton = DebugDismissNPCsPage.Show()

	If aiButton == 0 ; Confirm
		IncludeWaiting(abMenu, aiButton, "DismissNPCs")
	ElseIf aiButton == 1 ; Cancel
		Dismiss(abMenu, aiButton)
	EndIf
EndFunction

Function DismissAll(Bool abMenu, Int aiButton)

	aiButton = DebugDismissAllPage.Show()

	If aiButton == 0 ; Confirm
		IncludeWaiting(abMenu, aiButton, "DismissAll")
	ElseIf aiButton == 1 ; Cancel
		Dismiss(abMenu, aiButton)
	EndIf
EndFunction

Function IncludeWaiting(Bool abMenu, Int aiButton, String strAction)

	aiButton = DebugIncludeWaitingPage.Show()

	If strAction == "SummonFollowers"
		If aiButton == 0 ; Yes
			(LinkQuest as MFF_MenuLink).SummonFollowersPre(true)

			Int i
			While i < PartyLimit.GetValue()
				MFF_RefAlias refAlias = (CoreQuest as MFF_Script).IndexToRefAlias(i)
				If refAlias.GetReference() != None && refAlias.GetActorReference().GetFactionRank(FollowerFaction) > -2
					(CoreQuest as MFF_PartyScript).SummonAlias(refAlias)
				EndIf
				i += 1
			EndWhile

			(LinkQuest as MFF_MenuLink).SummonFollowersPost(true)
			Summon(abMenu, aiButton)
		ElseIf aiButton == 1; No
			(LinkQuest as MFF_MenuLink).SummonFollowersPre(false)

			Int i
			While i < PartyLimit.GetValue()
				MFF_RefAlias refAlias = (CoreQuest as MFF_Script).IndexToRefAlias(i)
				If refAlias.GetReference() != None && refAlias.GetActorReference().GetFactionRank(FollowerFaction) > -2 && refAlias.GetActorReference().GetActorValue("WaitingForPlayer") == 0
					(CoreQuest as MFF_PartyScript).SummonAlias(refAlias)
				EndIf
				i += 1
			EndWhile

			(LinkQuest as MFF_MenuLink).SummonFollowersPost(false)
			Summon(abMenu, aiButton)
		EndIf

		DebugSystemSummon.Show()
	ElseIf strAction == "SummonAnimals"
		If aiButton == 0 ; Yes
			(LinkQuest as MFF_MenuLink).SummonAnimalsPre(true)

			Int i
			While i < PartyLimit.GetValue()
				MFF_RefAlias refAlias = (CoreQuest as MFF_Script).IndexToRefAlias(i)
				If refAlias.GetReference() != None && refAlias.GetActorReference().GetFactionRank(AnimalFaction) > -2
					(CoreQuest as MFF_PartyScript).SummonAlias(refAlias)
				EndIf
				i += 1
			EndWhile

			(LinkQuest as MFF_MenuLink).SummonAnimalsPost(true)
			Summon(abMenu, aiButton)
		ElseIf aiButton == 1; No
			(LinkQuest as MFF_MenuLink).SummonAnimalsPre(false)

			Int i
			While i < PartyLimit.GetValue()
				MFF_RefAlias refAlias = (CoreQuest as MFF_Script).IndexToRefAlias(i)
				If refAlias.GetReference() != None && refAlias.GetActorReference().GetFactionRank(AnimalFaction) > -2 && refAlias.GetActorReference().GetActorValue("WaitingForPlayer") == 0
					(CoreQuest as MFF_PartyScript).SummonAlias(refAlias)
				EndIf
				i += 1
			EndWhile

			(LinkQuest as MFF_MenuLink).SummonAnimalsPost(false)
			Summon(abMenu, aiButton)
		EndIf

		DebugSystemSummon.Show()
	ElseIf strAction == "SummonNPCs"
		If aiButton == 0 ; Yes
			(LinkQuest as MFF_MenuLink).SummonNPCsPre(true)

			Int i
			While i < PartyLimit.GetValue()
				MFF_RefAlias refAlias = (CoreQuest as MFF_Script).IndexToRefAlias(i)
				If refAlias.GetReference() != None && refAlias.GetActorReference().GetFactionRank(NPCFaction) > -2
					(CoreQuest as MFF_PartyScript).SummonAlias(refAlias)
				EndIf
				i += 1
			EndWhile

			(LinkQuest as MFF_MenuLink).SummonNPCsPost(true)
			Summon(abMenu, aiButton)
		ElseIf aiButton == 1; No
			(LinkQuest as MFF_MenuLink).SummonNPCsPre(false)

			Int i
			While i < PartyLimit.GetValue()
				MFF_RefAlias refAlias = (CoreQuest as MFF_Script).IndexToRefAlias(i)
				If refAlias.GetReference() != None && refAlias.GetActorReference().GetFactionRank(NPCFaction) > -2 && refAlias.GetActorReference().GetActorValue("WaitingForPlayer") == 0
					(CoreQuest as MFF_PartyScript).SummonAlias(refAlias)
				EndIf
				i += 1
			EndWhile

			(LinkQuest as MFF_MenuLink).SummonNPCsPost(false)
			Summon(abMenu, aiButton)
		EndIf

		DebugSystemSummon.Show()
	ElseIf strAction == "SummonAll"
		If aiButton == 0 ; Yes
			(LinkQuest as MFF_MenuLink).SummonAllPre(true)

			Int i
			While i < PartyLimit.GetValue()
				MFF_RefAlias refAlias = (CoreQuest as MFF_Script).IndexToRefAlias(i)
				If refAlias.GetReference() != None
					(CoreQuest as MFF_PartyScript).SummonAlias(refAlias)
				EndIf
				i += 1
			EndWhile

			(LinkQuest as MFF_MenuLink).SummonAllPost(true)
			Summon(abMenu, aiButton)
		ElseIf aiButton == 1; No
			(LinkQuest as MFF_MenuLink).SummonAllPre(false)

			Int i
			While i < PartyLimit.GetValue()
				MFF_RefAlias refAlias = (CoreQuest as MFF_Script).IndexToRefAlias(i)
				If refAlias.GetReference() != None && refAlias.GetActorReference().GetActorValue("WaitingForPlayer") == 0
					(CoreQuest as MFF_PartyScript).SummonAlias(refAlias)
				EndIf
				i += 1
			EndWhile

			(LinkQuest as MFF_MenuLink).SummonAllPost(false)
			Summon(abMenu, aiButton)
		EndIf

		DebugSystemSummon.Show()
	ElseIf strAction == "DismissFollowers"
		If aiButton == 0 ; Yes
			(LinkQuest as MFF_MenuLink).DismissFollowersPre(true)

			Int i
			While i < PartyLimit.GetValue()
				MFF_RefAlias refAlias = (CoreQuest as MFF_Script).IndexToRefAlias(i)
				If refAlias.GetReference() != None && refAlias.GetActorReference().GetFactionRank(FollowerFaction) > -2
					(CoreQuest as MFF_PartyScript).DismissAlias(refAlias, false)
				EndIf
				i += 1
			EndWhile
			Dismiss(abMenu, aiButton)

			(LinkQuest as MFF_MenuLink).DismissFollowersPost(true)
		ElseIf aiButton == 1; No
			(LinkQuest as MFF_MenuLink).DismissFollowersPre(false)

			Int i
			While i < PartyLimit.GetValue()
				MFF_RefAlias refAlias = (CoreQuest as MFF_Script).IndexToRefAlias(i)
				If refAlias.GetReference() != None && refAlias.GetActorReference().GetFactionRank(FollowerFaction) > -2 && refAlias.GetActorReference().GetActorValue("WaitingForPlayer") == 0

					(CoreQuest as MFF_PartyScript).DismissAlias(refAlias, false)
				EndIf
				i += 1
			EndWhile
			Dismiss(abMenu, aiButton)

			(LinkQuest as MFF_MenuLink).DismissFollowersPost(false)
		EndIf

		DebugSystemDismiss.Show()
	ElseIf strAction == "DismissAnimals"
		If aiButton == 0 ; Yes
			(LinkQuest as MFF_MenuLink).DismissAnimalsPre(true)

			Int i
			While i < PartyLimit.GetValue()
				MFF_RefAlias refAlias = (CoreQuest as MFF_Script).IndexToRefAlias(i)
				If refAlias.GetReference() != None && refAlias.GetActorReference().GetFactionRank(AnimalFaction) > -2
					(CoreQuest as MFF_PartyScript).DismissAlias(refAlias, false)
				EndIf
				i += 1
			EndWhile
			Dismiss(abMenu, aiButton)

			(LinkQuest as MFF_MenuLink).DismissAnimalsPost(true)
		ElseIf aiButton == 1; No
			(LinkQuest as MFF_MenuLink).DismissAnimalsPre(false)

			Int i
			While i < PartyLimit.GetValue()
				MFF_RefAlias refAlias = (CoreQuest as MFF_Script).IndexToRefAlias(i)
				If refAlias.GetReference() != None && refAlias.GetActorReference().GetFactionRank(AnimalFaction) > -2 && refAlias.GetActorReference().GetActorValue("WaitingForPlayer") == 0

					(CoreQuest as MFF_PartyScript).DismissAlias(refAlias, false)
				EndIf
				i += 1
			EndWhile
			Dismiss(abMenu, aiButton)

			(LinkQuest as MFF_MenuLink).DismissAnimalsPost(false)
		EndIf

		DebugSystemDismiss.Show()
	ElseIf strAction == "DismissNPCs"
		If aiButton == 0 ; Yes
			(LinkQuest as MFF_MenuLink).DismissNPCsPre(true)

			Int i
			While i < PartyLimit.GetValue()
				MFF_RefAlias refAlias = (CoreQuest as MFF_Script).IndexToRefAlias(i)
				If refAlias.GetReference() != None && refAlias.GetActorReference().GetFactionRank(NPCFaction) > -2
					(CoreQuest as MFF_PartyScript).DismissAlias(refAlias, false)
				EndIf
				i += 1
			EndWhile
			Dismiss(abMenu, aiButton)

			(LinkQuest as MFF_MenuLink).DismissNPCsPost(true)
		ElseIf aiButton == 1; No
			(LinkQuest as MFF_MenuLink).DismissNPCsPre(false)

			Int i
			While i < PartyLimit.GetValue()
				MFF_RefAlias refAlias = (CoreQuest as MFF_Script).IndexToRefAlias(i)
				If refAlias.GetReference() != None && refAlias.GetActorReference().GetFactionRank(NPCFaction) > -2 && refAlias.GetActorReference().GetActorValue("WaitingForPlayer") == 0

					(CoreQuest as MFF_PartyScript).DismissAlias(refAlias, false)
				EndIf
				i += 1
			EndWhile
			Dismiss(abMenu, aiButton)

			(LinkQuest as MFF_MenuLink).DismissNPCsPost(false)
		EndIf

		DebugSystemDismiss.Show()
	ElseIf strAction == "DismissAll"
		If aiButton == 0 ; Yes
			(LinkQuest as MFF_MenuLink).DismissAllPre(true)

			Int i
			While i < PartyLimit.GetValue()
				MFF_RefAlias refAlias = (CoreQuest as MFF_Script).IndexToRefAlias(i)
				If refAlias.GetReference() != None

					(CoreQuest as MFF_PartyScript).DismissAlias(refAlias, false)
				EndIf
				i += 1
			EndWhile
			Dismiss(abMenu, aiButton)

			(LinkQuest as MFF_MenuLink).DismissAllPost(true)
		ElseIf aiButton == 1; No
			(LinkQuest as MFF_MenuLink).DismissAllPre(false)

			Int i
			While i < PartyLimit.GetValue()
				MFF_RefAlias refAlias = (CoreQuest as MFF_Script).IndexToRefAlias(i)
				If refAlias.GetReference() != None && refAlias.GetActorReference().GetActorValue("WaitingForPlayer") == 0

					(CoreQuest as MFF_PartyScript).DismissAlias(refAlias, false)
				EndIf
				i += 1
			EndWhile
			Dismiss(abMenu, aiButton)

			(LinkQuest as MFF_MenuLink).DismissAllPost(false)
		EndIf

		DebugSystemDismiss.Show()
	EndIf
EndFunction
