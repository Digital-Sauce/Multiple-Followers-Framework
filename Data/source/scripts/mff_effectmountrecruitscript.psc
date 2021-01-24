Scriptname MFF_EffectMountRecruitScript extends activemagiceffect  

Faction Property PartyMember Auto
Faction Property OwnedMount Auto
Faction Property PlayerHorse Auto

Quest Property CoreQuest Auto


Event OnEffectStart(Actor akTarget, Actor akCaster)
	If akTarget.GetFactionRank(PartyMember) < 0 && (akTarget.GetFactionRank(OwnedMount) > - 1 || akTarget.GetFactionRank(PlayerHorse) > -1)
		(CoreQuest as MFF_PartyScript).RecruitAlias(akTarget, None, false)
	EndIf
EndEvent