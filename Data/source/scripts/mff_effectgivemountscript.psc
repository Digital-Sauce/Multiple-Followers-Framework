Scriptname MFF_EffectGiveMountScript extends activemagiceffect  

GlobalVariable Property Safety Auto

Keyword Property Horse Auto

Quest Property QuestCore Auto


Event OnEffectStart(Actor akTarget, Actor akCaster)
	If Safety.GetValue() == 1
		If akTarget.HasKeyword(Horse)
			(QuestCore as MFF_PartyScript).GiveMount(akTarget)
		EndIf
	Else
		(QuestCore as MFF_PartyScript).GiveMount(akTarget)
	EndIf
EndEvent
