Scriptname MFF_MenuDialogueScript extends Quest  

GlobalVariable Property DetectionCloak Auto

GlobalVariable Property DetectFollower Auto
GlobalVariable Property DetectAnimal Auto
GlobalVariable Property DetectNPC Auto

GlobalVariable Property DialogueFollowerDismiss Auto
GlobalVariable Property DialogueFollowerFollow Auto
GlobalVariable Property DialogueFollowerHold Auto
GlobalVariable Property DialogueFollowerRest Auto
GlobalVariable Property DialogueFollowerDiscuss Auto
GlobalVariable Property DialogueFollowerBow Auto
GlobalVariable Property DialogueFollowerMount Auto

GlobalVariable Property DialogueAnimalDismiss Auto
GlobalVariable Property DialogueAnimalFollow Auto
GlobalVariable Property DialogueAnimalHold Auto
GlobalVariable Property DialogueAnimalRest Auto
GlobalVariable Property DialogueAnimalDiscuss Auto
GlobalVariable Property DialogueAnimalBow Auto
GlobalVariable Property DialogueAnimalMount Auto

GlobalVariable Property DialogueNPCDismiss Auto
GlobalVariable Property DialogueNPCFollow Auto
GlobalVariable Property DialogueNPCHold Auto
GlobalVariable Property DialogueNPCRest Auto
GlobalVariable Property DialogueNPCDiscuss Auto
GlobalVariable Property DialogueNPCBow Auto
GlobalVariable Property DialogueNPCMount Auto

Actor Property Player Auto

Spell Property DetectionCloakSpell Auto

Message Property DialoguePage Auto

Message Property RecruitmentPage Auto

Message Property DetectionCloakPage Auto
Message Property DetectFollowerPage Auto
Message Property DetectAnimalPage Auto
Message Property DetectNPCPage Auto

Message Property DialogueFollowerPage Auto
Message Property DialogueAnimalPage Auto
Message Property DialogueNPCPage Auto

Message Property DialogueFollowerDismissPage Auto
Message Property DialogueFollowerFollowPage Auto
Message Property DialogueFollowerHoldPage Auto
Message Property DialogueFollowerRestPage Auto
Message Property DialogueFollowerDiscussPage Auto
Message Property DialogueFollowerBowPage Auto
Message Property DialogueFollowerMountPage Auto
Message Property DialogueFollowerAllPage Auto

Message Property DialogueAnimalDismissPage Auto
Message Property DialogueAnimalFollowPage Auto
Message Property DialogueAnimalHoldPage Auto
Message Property DialogueAnimalRestPage Auto
Message Property DialogueAnimalDiscussPage Auto
Message Property DialogueAnimalBowPage Auto
Message Property DialogueAnimalMountPage Auto
Message Property DialogueAnimalAllPage Auto

Message Property DialogueNPCDismissPage Auto
Message Property DialogueNPCFollowPage Auto
Message Property DialogueNPCHoldPage Auto
Message Property DialogueNPCRestPage Auto
Message Property DialogueNPCDiscussPage Auto
Message Property DialogueNPCBowPage Auto
Message Property DialogueNPCMountPage Auto
Message Property DialogueNPCAllPage Auto

Message Property DialogueAllPage Auto


Quest Property CoreQuest Auto

Function Dialogue(Bool abMenu, Int aiButton)

	aiButton = DialoguePage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1
		Recruitment(abMenu, aiButton)
	ElseIf aiButton == 2
		Follower(abMenu, aiButton)
	ElseIf aiButton == 3
		Animal(abMenu, aiButton)
	ElseIf aiButton == 4
		NPC(abMenu, aiButton)
	ElseIf aiButton == 5
		All(abMenu, aiButton)
	ElseIf aiButton == 6 ; Back
		(CoreQuest as MFF_ModMenu).Menu(abMenu, aiButton)
	EndIf
EndFunction

Function Recruitment(Bool abMenu, Int aiButton)

	aiButton = RecruitmentPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1
		DetectionCloak(abMenu, aiButton)
	ElseIf aiButton == 2
		DetectFollower(abMenu, aiButton)
	ElseIf aiButton == 3
		DetectAnimal(abMenu, aiButton)
	ElseIf aiButton == 4
		DetectNPC(abMenu, aiButton)
	ElseIf aiButton == 5 ; back
		Dialogue(abMenu, aiButton)
	EndIf

EndFunction

Function DetectionCloak(Bool abMenu, Int aiButton)

	aiButton = DetectionCloakPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; On
		DetectionCloak.SetValue(1)
		DetectionCloakSpell.Cast(Player)

		Recruitment(abMenu, aiButton)
	ElseIf aiButton == 2 ; Off
		DetectionCloak.SetValue(0)

		Recruitment(abMenu, aiButton)
	ElseIf aiButton == 3 ; back
		Recruitment(abMenu, aiButton)
	EndIf

EndFunction

Function DetectFollower(Bool abMenu, Int aiButton)

	aiButton = DetectFollowerPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; On
		DetectFollower.SetValue(1)

		Recruitment(abMenu, aiButton)
	ElseIf aiButton == 2 ; Off
		DetectFollower.SetValue(0)

		Recruitment(abMenu, aiButton)
	ElseIf aiButton == 3 ; back
		Recruitment(abMenu, aiButton)
	EndIf

EndFunction

Function DetectAnimal(Bool abMenu, Int aiButton)

	aiButton = DetectAnimalPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; On
		DetectAnimal.SetValue(1)

		Recruitment(abMenu, aiButton)
	ElseIf aiButton == 2 ; Off
		DetectAnimal.SetValue(0)

		Recruitment(abMenu, aiButton)
	ElseIf aiButton == 3 ; back
		Recruitment(abMenu, aiButton)
	EndIf

EndFunction

Function DetectNPC(Bool abMenu, Int aiButton)

	aiButton = DetectNPCPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; On
		DetectNPC.SetValue(1)

		Recruitment(abMenu, aiButton)
	ElseIf aiButton == 2 ; Off
		DetectNPC.SetValue(0)

		Recruitment(abMenu, aiButton)
	ElseIf aiButton == 3 ; back
		Recruitment(abMenu, aiButton)
	EndIf

EndFunction

Function Follower(Bool abMenu, Int aiButton)

	aiButton = DialogueFollowerPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1
		FollowerDismiss(abMenu, aiButton)
	ElseIf aiButton == 2
		FollowerFollow(abMenu, aiButton)
	ElseIf aiButton == 3
		FollowerHold(abMenu, aiButton)
	ElseIf aiButton == 4
		FollowerRest(abMenu, aiButton)
	ElseIf aiButton == 5
		FollowerBow(abMenu, aiButton)
	ElseIf aiButton == 6
		FollowerMount(abMenu, aiButton)
	ElseIf aiButton == 7
		FollowerAll(abMenu, aiButton)
	ElseIf aiButton == 8 ; back
		Dialogue(abMenu, aiButton)
	EndIf

EndFunction

Function FollowerDismiss(Bool abMenu, Int aiButton)

	aiButton = DialogueFollowerDismissPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; On
		DialogueFollowerDismiss.SetValue(1)

		Follower(abMenu, aiButton)
	ElseIf aiButton == 2 ; Off
		DialogueFollowerDismiss.SetValue(0)

		Follower(abMenu, aiButton)
	ElseIf aiButton == 3 ; back
		Follower(abMenu, aiButton)
	EndIf

EndFunction

Function FollowerFollow(Bool abMenu, Int aiButton)

	aiButton = DialogueFollowerFollowPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; On
		DialogueFollowerFollow.SetValue(1)

		Follower(abMenu, aiButton)
	ElseIf aiButton == 2 ; Off
		DialogueFollowerFollow.SetValue(0)

		Follower(abMenu, aiButton)
	ElseIf aiButton == 3 ; back
		Follower(abMenu, aiButton)
	EndIf

EndFunction

Function FollowerHold(Bool abMenu, Int aiButton)

	aiButton = DialogueFollowerHoldPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; On
		DialogueFollowerHold.SetValue(1)

		Follower(abMenu, aiButton)
	ElseIf aiButton == 2 ; Off
		DialogueFollowerHold.SetValue(0)

		Follower(abMenu, aiButton)
	ElseIf aiButton == 3 ; back
		Follower(abMenu, aiButton)
	EndIf

EndFunction

Function FollowerRest(Bool abMenu, Int aiButton)

	aiButton = DialogueFollowerRestPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; On
		DialogueFollowerRest.SetValue(1)

		Follower(abMenu, aiButton)
	ElseIf aiButton == 2 ; Off
		DialogueFollowerRest.SetValue(0)

		Follower(abMenu, aiButton)
	ElseIf aiButton == 3 ; back
		Follower(abMenu, aiButton)
	EndIf

EndFunction

Function FollowerBow(Bool abMenu, Int aiButton)

	aiButton = DialogueFollowerBowPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; On
		DialogueFollowerBow.SetValue(1)

		Follower(abMenu, aiButton)
	ElseIf aiButton == 2 ; Off
		DialogueFollowerBow.SetValue(0)

		Follower(abMenu, aiButton)
	ElseIf aiButton == 3 ; back
		Follower(abMenu, aiButton)
	EndIf

EndFunction

Function FollowerMount(Bool abMenu, Int aiButton)

	aiButton = DialogueFollowerMountPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; On
		DialogueFollowerMount.SetValue(1)

		Follower(abMenu, aiButton)
	ElseIf aiButton == 2 ; Off
		DialogueFollowerMount.SetValue(0)

		Follower(abMenu, aiButton)
	ElseIf aiButton == 3 ; back
		Follower(abMenu, aiButton)
	EndIf

EndFunction

Function FollowerAll(Bool abMenu, Int aiButton)

	aiButton = DialogueFollowerAllPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; On

		DialogueFollowerDismiss.SetValue(1)
		DialogueFollowerFollow.SetValue(1)
		DialogueFollowerHold.SetValue(1)
 		DialogueFollowerRest.SetValue(1)
		DialogueFollowerDiscuss.SetValue(1)
		DialogueFollowerBow.SetValue(1)
		DialogueFollowerMount.SetValue(1)

		Follower(abMenu, aiButton)
	ElseIf aiButton == 2 ; Off

		DialogueFollowerDismiss.SetValue(0)
		DialogueFollowerFollow.SetValue(0)
		DialogueFollowerHold.SetValue(0)
 		DialogueFollowerRest.SetValue(0)
		DialogueFollowerDiscuss.SetValue(0)
		DialogueFollowerBow.SetValue(0)
		DialogueFollowerMount.SetValue(0)

		Follower(abMenu, aiButton)
	ElseIf aiButton == 3 ; back
		Follower(abMenu, aiButton)
	EndIf

EndFunction

Function Animal(Bool abMenu, Int aiButton)

	aiButton = DialogueFollowerPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1
		AnimalDismiss(abMenu, aiButton)
	ElseIf aiButton == 2
		AnimalFollow(abMenu, aiButton)
	ElseIf aiButton == 3
		AnimalHold(abMenu, aiButton)
	ElseIf aiButton == 4
		AnimalRest(abMenu, aiButton)
	ElseIf aiButton == 5
		AnimalBow(abMenu, aiButton)
	ElseIf aiButton == 6
		AnimalMount(abMenu, aiButton)
	ElseIf aiButton == 7
		AnimalAll(abMenu, aiButton)
	ElseIf aiButton == 8 ; back
		Dialogue(abMenu, aiButton)
	EndIf

EndFunction

Function AnimalDismiss(Bool abMenu, Int aiButton)

	aiButton = DialogueAnimalDismissPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; On
		DialogueAnimalDismiss.SetValue(1)

		Animal(abMenu, aiButton)
	ElseIf aiButton == 2 ; Off
		DialogueAnimalDismiss.SetValue(0)

		Animal(abMenu, aiButton)
	ElseIf aiButton == 3 ; back
		Animal(abMenu, aiButton)
	EndIf

EndFunction

Function AnimalFollow(Bool abMenu, Int aiButton)

	aiButton = DialogueAnimalFollowPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; On
		DialogueAnimalFollow.SetValue(1)

		Animal(abMenu, aiButton)
	ElseIf aiButton == 2 ; Off
		DialogueAnimalFollow.SetValue(0)

		Animal(abMenu, aiButton)
	ElseIf aiButton == 3 ; back
		Animal(abMenu, aiButton)
	EndIf

EndFunction

Function AnimalHold(Bool abMenu, Int aiButton)

	aiButton = DialogueAnimalHoldPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; On
		DialogueAnimalHold.SetValue(1)

		Animal(abMenu, aiButton)
	ElseIf aiButton == 2 ; Off
		DialogueAnimalHold.SetValue(0)

		Animal(abMenu, aiButton)
	ElseIf aiButton == 3 ; back
		Animal(abMenu, aiButton)
	EndIf

EndFunction

Function AnimalRest(Bool abMenu, Int aiButton)

	aiButton = DialogueAnimalRestPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; On
		DialogueAnimalRest.SetValue(1)

		Animal(abMenu, aiButton)
	ElseIf aiButton == 2 ; Off
		DialogueAnimalRest.SetValue(0)

		Animal(abMenu, aiButton)
	ElseIf aiButton == 3 ; back
		Animal(abMenu, aiButton)
	EndIf

EndFunction

Function AnimalBow(Bool abMenu, Int aiButton)

	aiButton = DialogueAnimalBowPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; On
		DialogueAnimalBow.SetValue(1)

		Animal(abMenu, aiButton)
	ElseIf aiButton == 2 ; Off
		DialogueAnimalBow.SetValue(0)

		Animal(abMenu, aiButton)
	ElseIf aiButton == 3 ; back
		Animal(abMenu, aiButton)
	EndIf

EndFunction

Function AnimalMount(Bool abMenu, Int aiButton)

	aiButton = DialogueAnimalMountPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; On
		DialogueAnimalMount.SetValue(1)

		Animal(abMenu, aiButton)
	ElseIf aiButton == 2 ; Off
		DialogueAnimalMount.SetValue(0)

		Animal(abMenu, aiButton)
	ElseIf aiButton == 3 ; back
		Animal(abMenu, aiButton)
	EndIf

EndFunction

Function AnimalAll(Bool abMenu, Int aiButton)

	aiButton = DialogueAnimalAllPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; On

		DialogueAnimalDismiss.SetValue(1)
		DialogueAnimalFollow.SetValue(1)
		DialogueAnimalHold.SetValue(1)
 		DialogueAnimalRest.SetValue(1)
		DialogueAnimalDiscuss.SetValue(1)
		DialogueAnimalBow.SetValue(1)
		DialogueAnimalMount.SetValue(1)

		Animal(abMenu, aiButton)
	ElseIf aiButton == 2 ; Off

		DialogueAnimalDismiss.SetValue(0)
		DialogueAnimalFollow.SetValue(0)
		DialogueAnimalHold.SetValue(0)
 		DialogueAnimalRest.SetValue(0)
		DialogueAnimalDiscuss.SetValue(0)
		DialogueAnimalBow.SetValue(0)
		DialogueAnimalMount.SetValue(0)

		Animal(abMenu, aiButton)
	ElseIf aiButton == 3 ; back
		Animal(abMenu, aiButton)
	EndIf

EndFunction


Function NPC(Bool abMenu, Int aiButton)

	aiButton = DialogueFollowerPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1
		NPCDismiss(abMenu, aiButton)
	ElseIf aiButton == 2
		NPCFollow(abMenu, aiButton)
	ElseIf aiButton == 3
		NPCHold(abMenu, aiButton)
	ElseIf aiButton == 4
		NPCRest(abMenu, aiButton)
	ElseIf aiButton == 5
		NPCBow(abMenu, aiButton)
	ElseIf aiButton == 6
		NPCMount(abMenu, aiButton)
	ElseIf aiButton == 7
		NPCAll(abMenu, aiButton)
	ElseIf aiButton == 8 ; back
		Dialogue(abMenu, aiButton)
	EndIf

EndFunction

Function NPCDismiss(Bool abMenu, Int aiButton)

	aiButton = DialogueNPCDismissPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; On
		DialogueNPCDismiss.SetValue(1)

		NPC(abMenu, aiButton)
	ElseIf aiButton == 2 ; Off
		DialogueNPCDismiss.SetValue(0)

		NPC(abMenu, aiButton)
	ElseIf aiButton == 3 ; back
		NPC(abMenu, aiButton)
	EndIf

EndFunction

Function NPCFollow(Bool abMenu, Int aiButton)

	aiButton = DialogueNPCFollowPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; On
		DialogueNPCFollow.SetValue(1)

		NPC(abMenu, aiButton)
	ElseIf aiButton == 2 ; Off
		DialogueNPCFollow.SetValue(0)

		NPC(abMenu, aiButton)
	ElseIf aiButton == 3 ; back
		NPC(abMenu, aiButton)
	EndIf

EndFunction

Function NPCHold(Bool abMenu, Int aiButton)

	aiButton = DialogueNPCHoldPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; On
		DialogueNPCHold.SetValue(1)

		NPC(abMenu, aiButton)
	ElseIf aiButton == 2 ; Off
		DialogueNPCHold.SetValue(0)

		NPC(abMenu, aiButton)
	ElseIf aiButton == 3 ; back
		NPC(abMenu, aiButton)
	EndIf

EndFunction

Function NPCRest(Bool abMenu, Int aiButton)

	aiButton = DialogueNPCRestPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; On
		DialogueNPCRest.SetValue(1)

		NPC(abMenu, aiButton)
	ElseIf aiButton == 2 ; Off
		DialogueNPCRest.SetValue(0)

		NPC(abMenu, aiButton)
	ElseIf aiButton == 3 ; back
		NPC(abMenu, aiButton)
	EndIf

EndFunction

Function NPCBow(Bool abMenu, Int aiButton)

	aiButton = DialogueNPCBowPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; On
		DialogueNPCBow.SetValue(1)

		NPC(abMenu, aiButton)
	ElseIf aiButton == 2 ; Off
		DialogueNPCBow.SetValue(0)

		NPC(abMenu, aiButton)
	ElseIf aiButton == 3 ; back
		NPC(abMenu, aiButton)
	EndIf

EndFunction

Function NPCMount(Bool abMenu, Int aiButton)

	aiButton = DialogueNPCMountPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; On
		DialogueNPCMount.SetValue(1)

		NPC(abMenu, aiButton)
	ElseIf aiButton == 2 ; Off
		DialogueNPCMount.SetValue(0)

		NPC(abMenu, aiButton)
	ElseIf aiButton == 3 ; back
		NPC(abMenu, aiButton)
	EndIf

EndFunction

Function NPCAll(Bool abMenu, Int aiButton)

	aiButton = DialogueNPCAllPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; On

		DialogueNPCDismiss.SetValue(1)
		DialogueNPCFollow.SetValue(1)
		DialogueNPCHold.SetValue(1)
 		DialogueNPCRest.SetValue(1)
		DialogueNPCDiscuss.SetValue(1)
		DialogueNPCBow.SetValue(1)
		DialogueNPCMount.SetValue(1)

		NPC(abMenu, aiButton)
	ElseIf aiButton == 2 ; Off

		DialogueNPCDismiss.SetValue(0)
		DialogueNPCFollow.SetValue(0)
		DialogueNPCHold.SetValue(0)
 		DialogueNPCRest.SetValue(0)
		DialogueNPCDiscuss.SetValue(0)
		DialogueNPCBow.SetValue(0)
		DialogueNPCMount.SetValue(0)

		NPC(abMenu, aiButton)
	ElseIf aiButton == 3 ; back
		NPC(abMenu, aiButton)
	EndIf

EndFunction

Function All(Bool abMenu, Int aiButton)

	aiButton = DialogueAllPage.Show()

	If aiButton == 0 ; main
	ElseIf aiButton == 1 ; On

		DialogueFollowerDismiss.SetValue(1)
		DialogueFollowerFollow.SetValue(1)
		DialogueFollowerHold.SetValue(1)
 		DialogueFollowerRest.SetValue(1)
		DialogueFollowerDiscuss.SetValue(1)
		DialogueFollowerBow.SetValue(1)
		DialogueFollowerMount.SetValue(1)

		DialogueAnimalDismiss.SetValue(1)
		DialogueAnimalFollow.SetValue(1)
		DialogueAnimalHold.SetValue(1)
 		DialogueAnimalRest.SetValue(1)
		DialogueAnimalDiscuss.SetValue(1)
		DialogueAnimalBow.SetValue(1)
		DialogueAnimalMount.SetValue(1)

		DialogueNPCDismiss.SetValue(1)
		DialogueNPCFollow.SetValue(1)
		DialogueNPCHold.SetValue(1)
 		DialogueNPCRest.SetValue(1)
		DialogueNPCDiscuss.SetValue(1)
		DialogueNPCBow.SetValue(1)
		DialogueNPCMount.SetValue(1)

		Dialogue(abMenu, aiButton)
	ElseIf aiButton == 2 ; Off

		DialogueFollowerDismiss.SetValue(0)
		DialogueFollowerFollow.SetValue(0)
		DialogueFollowerHold.SetValue(0)
 		DialogueFollowerRest.SetValue(0)
		DialogueFollowerDiscuss.SetValue(0)
		DialogueFollowerBow.SetValue(0)
		DialogueFollowerMount.SetValue(0)

		DialogueAnimalDismiss.SetValue(0)
		DialogueAnimalFollow.SetValue(0)
		DialogueAnimalHold.SetValue(0)
 		DialogueAnimalRest.SetValue(0)
		DialogueAnimalDiscuss.SetValue(0)
		DialogueAnimalBow.SetValue(0)
		DialogueAnimalMount.SetValue(0)

		DialogueNPCDismiss.SetValue(0)
		DialogueNPCFollow.SetValue(0)
		DialogueNPCHold.SetValue(0)
 		DialogueNPCRest.SetValue(0)
		DialogueNPCDiscuss.SetValue(0)
		DialogueNPCBow.SetValue(0)
		DialogueNPCMount.SetValue(0)

		Dialogue(abMenu, aiButton)
	ElseIf aiButton == 3 ; back
		Dialogue(abMenu, aiButton)
	EndIf

EndFunction
