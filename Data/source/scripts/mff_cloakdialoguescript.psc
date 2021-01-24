Scriptname MFF_CloakDialogueScript extends activemagiceffect  

GlobalVariable Property FollowerDialogue Auto
GlobalVariable Property AnimalDialogue Auto
GlobalVariable Property NPCDialogue Auto

Faction Property PotentialFollower Auto
Faction Property PotentialAnimal Auto

Faction Property MFFPotential Auto
Faction Property CurrentFollower Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	If akTarget.GetFactionRank(CurrentFollower) > -2
		akTarget.AddToFaction(MFFPotential)
	ElseIf FollowerDialogue.GetValue() == 1 && akTarget.GetFactionRank(PotentialFollower) > -2
		akTarget.AddToFaction(MFFPotential)
	ElseIf AnimalDialogue.GetValue() == 1 && akTarget.GetFactionRank(PotentialAnimal) > -2
		akTarget.AddToFaction(MFFPotential)
	ElseIf NPCDialogue.GetValue() == 1
		akTarget.AddToFaction(MFFPotential)
	EndIf
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	If akTarget.GetFactionRank(MFFPotential) > -2
		akTarget.RemoveFromFaction(MFFPotential)
	EndIf
EndEvent