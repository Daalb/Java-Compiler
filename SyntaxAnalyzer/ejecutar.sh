#!/bin/bash
rm -rf ArchivoSalida.txt LAB02_Albor_Monsalve_Potte.tab.c LAB02_Albor_Monsalve_Potte.tab.h lex.yy.c sera
bison -d LAB02_Albor_Monsalve_Potte.y
flex LAB01_Albor_Monsalve_Potte.l
gcc LAB02_Albor_Monsalve_Potte.tab.c lex.yy.c -o LAB02 -ll
./LAB02
