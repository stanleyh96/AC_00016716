         org      100h

        section  .text

        mov      byte [200h], "S"

        mov      byte [201h], "A"

        mov      byte [202h], "H"

        mov      byte [203h], "B"

        ;directo
        mov      AX, [200h]
        ;indirecto
        mov      BX, [201h]
        mov      CX,[BX]
        ;INDIRECTO BASE+INDICE
        mov      SI,[202h]
        mov      DX,[BX+SI]

        int      20h

        