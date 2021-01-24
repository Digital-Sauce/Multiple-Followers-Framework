Scriptname MFF_EffectCalmScript extends activemagiceffect  

Faction Property PartyMember Auto
Faction Property OwnedMount Auto
Faction Property PlayerHorse Auto

Quest Property QuestCore Auto


Event OnEffectStart(Actor akTarget, Actor akCaster)
	If akTarget.GetFactionRank(PartyMember) > -1 ;&& akTarget.GetFactionRank(OwnedMount) < 0 && akTarget.GetFactionRank(PlayerHorse) < 0
		(QuestCore as MFF_PartyScript).Calm(akTarget)
	EndIf
EndEvent