#!/bin/bash
echo "LABORATORIO 02"
echo ""
rm -rf ArchivoSalida.txt LAB02_Albor_Monsalve_Potte.tab.c LAB02_Albor_Monsalve_Potte.tab.h lex.yy.c sera
bison -d LAB02_Albor_Monsalve_Potte.y
flex LAB01_Albor_Monsalve_Potte.l

echo "**********************"
echo "Generando ejecutable"
gcc LAB02_Albor_Monsalve_Potte.tab.c lex.yy.c -o LAB02 -ll

echo "*EJECUTANDO*"
./LAB02
