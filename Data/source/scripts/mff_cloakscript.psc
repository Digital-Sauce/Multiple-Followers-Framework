Scriptname MFF_CloakScript extends activemagiceffect  

Actor Property Player Auto
GlobalVariable Property DialogueCloak Auto
Spell Property Cloak Auto


Event OnEffectStart(Actor akTarget, Actor akCaster)
	Utility.Wait(0.76)

	If DialogueCloak.GetValue() == 1
		Cloak.Cast(Player)
	EndIf
EndEvent