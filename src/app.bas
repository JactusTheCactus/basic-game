DIM tab$: tab$ = CHR$(9)
CONST maxentries = 5
DIM names(1 TO maxentries) AS STRING
DIM selected AS INTEGER: selected = 1
DIM species(1 TO maxentries, 1 TO 3) AS STRING
DIM details(1 TO maxentries, 1 TO 3) AS STRING
DIM c AS INTEGER
DIM char AS INTEGER: char = 0
c = 1
names(c) = "Ori del Corvo"
species(c, 1) = "Human"
c = c + 1
names(c) = "Morrigan Heffernan"
species(c, 1) = "Reaper"
details(c, 1) = "Killing touch": details(c, 2) = "Wields a scythe"
c = c + 1
names(c) = "Ashley Korsaren"
species(c, 1) = "Human"
details(c, 1) = "Is a privateer": details(c, 2) = "Wields a pair of sabres"
c = c + 1
names(c) = "Hound NcNamara"
species(c, 1) = "Human": species(c, 2) = "Changeling"
details(c, 1) = "Shapeshifts into a large, black wolf"
c = c + 1
names(c) = "H4L3Y-R0551 (Haley Rossi)"
species(c, 1) = "Robot": species(c, 2) = "COLOSSUS:RHODES[HYPERION]@SOLDIER#0551"
details(c, 1) = "Has a translucent torso": details(c, 2) = "Her internals are visible": details(c, 3) = "Internals resemble that of a human"
DO
    CLS
    SELECT CASE _KEYHIT
        CASE 32
            setchar: IF char = 0 THEN char = selected ELSE char = 0
        CASE 27
            CLS
            PRINT "Loading..."
            SLEEP 1
            CLS
            GOTO setchar
        CASE 18432: selected = selected - 1
        CASE 20480: selected = selected + 1
    END SELECT
    IF selected < 1 THEN
        selected = maxentries
    ELSEIF selected > maxentries THEN
        selected = 1
    END IF
    IF char = 0 THEN
        FOR i = 1 TO maxentries
            DIM n AS STRING
            IF selected = i THEN n = ">" ELSE n = " "
            n = n + STR$(i) + ". " + names(i)
            PRINT n
        NEXT
    ELSE
        PRINT names(char)
        PRINT tab$; "Species:"
        FOR i = LBOUND(species, 2) TO UBOUND(species, 2)
            IF LEN(species(char, i)) <> 0 THEN
                PRINT tab$; tab$; STR$(i); ". "; species(char, i)
            END IF
        NEXT
        IF LEN(details(char, 1)) <> 0 THEN
            PRINT tab$; "Details:"
            FOR i = LBOUND(details, 2) TO UBOUND(details, 2)
                IF LEN(details(char, i)) <> 0 THEN
                    PRINT tab$; tab$; STR$(i); ". "; details(char, i)
                END IF
            NEXT
        END IF
    END IF
    _TITLE "Characters"
    '_FONT _LOADFONT("firacode/FiraCode-Regular.ttf", 20)
    _LIMIT 60
LOOP UNTIL (_KEYDOWN(27) OR _KEYDOWN(113)) AND char = 0
