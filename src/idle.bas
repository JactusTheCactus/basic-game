DIM title$: title$ = "Basic Incremental"
DIM fps%%: fps%% = 60
DIM money!: money! = 0 ' Change <money> to <&&> if value can exceed 9.22e18
DIM rate!
DIM count%%: count%% = 3
DIM selected%%
DIM name$(count%%): name$(1) = "A": name$(2) = "B": name$(3) = "C"
DIM level%(count%%)
DIM price!(count%%)
DIM income!(count%%)
FOR i = 1 TO count%%
    level%(i) = 0
NEXT
level%(1) = 1
DO
    CLS
    selected%% = VAL(INKEY$)
    FOR i = 1 TO count%%
        'PRINT name$(selected%%)
        income!(i) = level%(i) * (10 ^ (i - 1))
        price!(i) = level%(i) * (10 ^ i)
    NEXT
    IF selected%% > count%% THEN
    ELSEIF selected%% < 1 THEN
    ELSEIF money! >= price!(selected%%) THEN
        PRINT name$(selected%%)
        level%(selected%%) = level%(selected%%) + 1%
    END IF
    rate! = 0
    FOR i = 1 TO count%%
        rate! = rate! + income!(i)
    NEXT
    money! = money! + (rate! / fps%%)
    PRINT " "; to_money$(money!)
    PRINT "+"; to_money$(rate!); "/s"
    PRINT
    FOR i = 1 TO count%%
        PRINT name$(i); " lvl."; level%(i)
        PRINT CHR$(9); "income: "; to_money$(income!(i)); "/s"
        PRINT CHR$(9); "upgrade: "; to_money$(price!(i))
    NEXT
    _TITLE title$
    _LIMIT fps%%
LOOP UNTIL INKEY$ = CHR$(27)
FUNCTION to_money$ (number)
    to_money$ = "$" + LTRIM$(STR$(INT(number * 100) / 100))
END FUNCTION
