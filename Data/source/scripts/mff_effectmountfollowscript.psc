Scriptname MFF_EffectMountFollowScript extends activemagiceffect  

Faction Property PartyMember Auto
Faction Property OwnedMount Auto
Faction Property PlayerHorse Auto

Quest Property QuestCore Auto


Event OnEffectStart(Actor akTarget, Actor akCaster)
	If akTarget.GetFactionRank(PartyMember) > -1 && (akTarget.GetFactionRank(OwnedMount) > -1 || akTarget.GetFactionRank(PlayerHorse) > -1)
		(QuestCore as MFF_PartyScript).Follow(akTarget)
	EndIf
EndEvent
