Scriptname MFF_EffectRecruitScript extends activemagiceffect

GlobalVariable Property RecruitFollower Auto
GlobalVariable Property RecruitAnimal Auto
GlobalVariable Property RecruitNPC Auto

Faction Property PotentialFollower Auto
Faction Property PotentialAnimal Auto

Faction Property OwnedMount Auto
Faction Property PlayerHorse Auto


Quest Property CoreQuest Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	If !akTarget.IsDead()
		If RecruitFollower.GetValue() == 1 && akTarget.GetFactionRank(PotentialFollower) > -1
			(CoreQuest as MFF_PartyScript).Recruit(akTarget)
		ElseIf RecruitAnimal.GetValue() == 1 && akTarget.GetFactionRank(PotentialAnimal) > -1
			(CoreQuest as MFF_PartyScript).Recruit(akTarget)
		ElseIf RecruitNPC.GetValue() == 1 && akTarget.GetFactionRank(OwnedMount) < 0 && akTarget.GetFactionRank(PlayerHorse) < 0
			(CoreQuest as MFF_PartyScript).Recruit(akTarget)
		EndIf
	EndIf
EndEvent