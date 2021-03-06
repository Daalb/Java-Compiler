#!/bin/bash
echo ""
echo "LABORATORIO 02"
echo ""

rm -rf salida.txt LAB02_Albor_Monsalve_Potte.tab.c LAB02_Albor_Monsalve_Potte.tab.h lex.yy.c
bison -d LAB02_Albor_Monsalve_Potte.y
flex LAB02_Albor_Monsalve_Potte.l

echo "****************************************************************************************************************"
echo "Generando ejecutable"
gcc LAB02_Albor_Monsalve_Potte.tab.c lex.yy.c -o LAB02_Albor_Monsalve_Potte -ll

echo ""
echo "*EJECUTANDO*"
./LAB02_Albor_Monsalve_Potte $1
