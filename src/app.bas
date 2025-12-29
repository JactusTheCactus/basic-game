dim tab$: tab$ = chr$(9)
const maxentries = 4
dim names(1 to maxentries) as string
dim species(1 to maxentries, 1 to 2) as string
dim details(1 to maxentries, 1 to 3) as string
'Characters
	'Ori del Corvo
		names(1) = "Ori del Corvo"
		species(1, 1) = "Human"
	'Morrigan Heffernan
		names(2) = "Morrigan Heffernan"
		species(2, 1) = "Reaper"
		details(2, 1) = "Killing touch"
		details(2, 2) = "Wields a scythe"
	'Ashley Korsaren
		names(3) = "Ashley Korsaren"
		species(3, 1) = "Human"
		details(3, 1) = "Is a privateer"
		details(3, 2) = "Wields a pair of sabres"
	'Hound NcNamara
		names(4) = "Hound NcNamara"
		species(4, 1) = "Human"
		species(4, 2) = "Changeling"
		details(4, 1) = "Shapeshifts into a large, black wolf"
	'Robot
		names(5) = "<ROBOT> (Placeholder)"
		species(5, 1) = "Robot"
		details(5, 1) = "Has a translucent torso"
		details(5, 2) = "Her internals are vidible"
		details(5, 3) = "Internals resemble that of a human"
for i = 1 to maxentries
	print str$(i); ". ";  names(i)
	print tab$; "Species:"
	for j = lbound(species, 2) to ubound(species, 2)
		if len(species(i, j)) <> 0 then
			print tab$; tab$; str$(j); ". "; species(i, j)
		end if
	next
	if len(details(i, 1)) <> 0 then
		print tab$; "Details:"
		for j = lbound(details, 2) to ubound(details, 2)
			if len(details(i, j)) <> 0 then
				print tab$; tab$; str$(j); ". "; details(i, j)
			end if
		next
	end if
next