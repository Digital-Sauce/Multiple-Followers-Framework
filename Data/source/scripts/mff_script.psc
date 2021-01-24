Scriptname MFF_Script extends Quest Conditional

MFF_RefAlias[] Property Refs1 Auto
MFF_RefAlias[] Property Refs2 Auto
MFF_RefAlias[] Property Refs3 Auto
MFF_RefAlias[] Property Refs4 Auto

Faction[] Property Owners1 Auto
Faction[] Property Owners2 Auto
Faction[] Property Owners3 Auto
Faction[] Property Owners4 Auto

Int Property Count Auto Conditional


;;; ------------------------------------------------------- ------------------------------------------------------- Refs

MFF_RefAlias Function NextAlias()
	MFF_RefAlias refAlias

	Int i	
	Bool break
	While i < 512 && !break
		If i < 128
			If Refs1[i].GetReference() == None
				refAlias = Refs1[i]
				break = true
			EndIf
		ElseIf  i > 127 && i < 256
			If Refs2[i - 128].GetReference() == None
				refAlias = Refs2[i - 128]
				break = true
			EndIf
		ElseIf  i > 255 && i < 384
			If Refs3[i - 256].GetReference() == None
				refAlias = Refs3[i - 256]
				break = true
			EndIf
		ElseIf  i > 383 && i < 512
			If Refs4[i - 384].GetReference() == None
				refAlias = Refs4[i - 384]
				break = true
			EndIf
		EndIf

		i += 1
	EndWhile

	Return refAlias
EndFunction

MFF_RefAlias Function IndexToRefAlias (Int index)
	MFF_RefAlias refAlias
	
	If index < 128
		refAlias = Refs1[index]
	ElseIf index > 127 && index < 256
		refAlias = Refs2[index - 128]
	ElseIf index > 255 && index < 384
		refAlias = Refs3[index - 256]
	ElseIf index > 383 && index < 512
		refAlias = Refs4[index - 384]
	EndIf

	Return refAlias
EndFunction

ObjectReference Function IndexToRef (Int index)
	ObjectReference ref ; Returns None if no ObjectReference is found
	
	If index < 128
		ref = Refs1[index].GetReference()
	ElseIf index > 127 && index < 256
		ref = Refs2[index - 128].GetReference()
	ElseIf index > 255 && index < 384
		ref = Refs3[index - 256].GetReference()
	ElseIf index > 383 && index < 512
		ref = Refs4[index - 384].GetReference()
	EndIf

	Return ref
EndFunction

Int Function RefToIndex (ObjectReference ref)
	Bool break
	Int index = 512 ; 512 is out of range in the event that ref is not found
	Int i

	While i < 128 && !break
		If Refs1[i].GetReference() == ref
			index = i
			break = true
		ElseIf Refs2[i].GetReference() == ref
			index = (i + 128)
			break = true
		ElseIf Refs3[i].GetReference() == ref
			index = (i + 256)
			break = true
		ElseIf Refs4[i].GetReference() == ref
			index = (i + 384)
			break = true
		EndIf
		i += 1
	EndWhile

	Return index
EndFunction


Bool Function ContainsRef (ObjectReference ref)
	Bool query
	Bool break
	Int i
	
	While i < 128 && !break
		If Refs1[i].GetReference() == ref
			query = true
			break = true
		ElseIf Refs2[i].GetReference() == ref
			query = true
			break = true
		ElseIf Refs3[i].GetReference() == ref
			query = true
			break = true
		ElseIf Refs4[i].GetReference() == ref
			query = true
			break = true
		EndIf
		i += 1
	EndWhile

	Return query
EndFunction

Bool Function ContainsIndex (Int index)
	Bool query

	If index < 128
		If Refs1[index].GetReference() != None
			query = true
		EndIf
	ElseIf index > 127 && index < 256
		If Refs2[index - 128].GetReference() != None
			query = true
		EndIf
	ElseIf index > 255 && index < 384
		If Refs3[index - 256].GetReference() != None
			query = true
		EndIf
	ElseIf index > 383 && index < 512
		If Refs4[index - 384].GetReference() != None
			query = true
		EndIf
	EndIf

	Return query
EndFunction


;;; ------------------------------------------------------- ------------------------------------------------------- Faction Owners

Faction Function IndexToOwnerFaction(Int index)
	Faction OwnerFaction

	If index < 128
		OwnerFaction = Owners1[index]
	ElseIf index > 127 && index < 256
		OwnerFaction = Owners2[index - 128]
	ElseIf index > 255 && index < 384
		OwnerFaction = Owners3[index - 256]
	ElseIf index > 383 && index < 512
		OwnerFaction = Owners4[index - 384]
	EndIf

	Return OwnerFaction
EndFunction

Int Function OwnerFactionToIndex(Faction Owner)
	Bool break
	Int index = 512 ; 512 is out of range in the event that FactionOwner is not found
	Int i

	While i < 128 && !break
		If Owners1[i] == Owner
			index = i
			break = true
		ElseIf Owners2[i] == Owner
			index = (i + 128)
			break = true
		ElseIf Owners3[i] == Owner
			index = (i + 256)
			break = true
		ElseIf Owners4[i] == Owner
			index = (i + 384)
			break = true
		EndIf
		i += 1
	EndWhile

	Return index
EndFunction

Bool Function ContainsOwnerFaction(Faction Owner)
	Bool query
	Bool break
	Int i
	
	While i < 128 && !break
		If Owners1[i] == Owner
			query = true
			break = true
		ElseIf Owners2[i] == Owner
			query = true
			break = true
		ElseIf Owners3[i] == Owner
			query = true
			break = true
		ElseIf Owners4[i] == Owner
			query = true
			break = true
		EndIf
		i += 1
	EndWhile

	Return query
EndFunction