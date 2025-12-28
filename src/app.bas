const maxentries = 4
dim names(1 to maxentries, 1 to maxentries) as string
dim species(1 to maxentries, 1 to maxentries) as string
dim details(1 to maxentries, 1 to maxentries) as string
'Characters
	'Ori
		names(1, 1) = "Ori"
		names(1, 2) = "del"
		names(1, 3) = "Corvo"
		species(1, 1) = "Human"
	'Morrigan
		names(2, 1) = "Morrigan"
		names(2, 2) = "Heffernan"
		species(2, 1) = "Reaper"
		details(2, 1) = "Killing touch"
		details(2, 2) = "Wields a scythe"
	'Ashley
		names(3, 1) = "Ashley"
		names(3, 2) = "Korsaren"
		species(3, 1) = "Human"
		details(3, 1) = "Is a privateer"
		details(3, 2) = "Wields a pair of sabres"
	'Hound
		names(4, 1) = "Hound"
		names(4, 2) = "NcNamara"
		species(4, 1) = "Human"
		species(4, 2) = "Changeling"
		details(4, 1) = "Shapeshifts into a large, black wolf"
for i = 1 to maxentries
	print str$(i); ". ";
	for j = lbound(names) to ubound(names)
		if len(names(i, j)) <> 0 then
			if j > lbound(names) then print " ";
			print names(i, j);
		end if
	next
	print
	print chr$(9); "Species:"
	for j = lbound(species) to ubound(species)
		if len(species(i, j)) <> 0 then
			print chr$(9); chr$(9); str$(j); ". "; species(i, j)
		end if
	next
	print chr$(9); "Details:"
	for j = lbound(details) to ubound(details)
		if len(details(i, j)) <> 0 then
			print chr$(9); chr$(9); str$(j); ". "; details(i, j)
		end if
	next
next