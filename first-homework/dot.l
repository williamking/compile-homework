%{
    #include "stdio.h"
    #include "stdlib.h"
%}

STRICT [S|s][T|t][R|r][I|i][C|c][T|t]
GRAPH [G|g][R|r][P|p][A|a][H|h]
DIGRPAH [D|d][I|i][G|g][R|r][P|p][A|a][H|h]
SUBGRPAH [S|s][U|u][B|b][G|g][R|r][P|p][A|a][H|h]
NODE [N|n][O|o][D|d][E|e]
STRING \".*\"
NUMBER [-+]{0,1}?[1-9][0-9]*
ID [_a-zA-Z][a-zA-Z_0-9]*
SPACE [\ \n\t]
DIVIDE ;|(,)|(\{)|(\})|(\[)|(\])
OTHER --|->|=
COMMENT (#.*\n)|(\/\/.*\n)|(\/\*(.|\n)*\*\/)

%%

\n {

}

{STRICT}|{GRAPH}|{DIGRPAH}|{SUBGRPAH}|{NODE} {
    printf("%s\n", yytext);
                                             }
{STRING} {
    printf("%s\n", yytext);
         }
{NUMBER}|{ID}|{DIVIDE}|{OTHER} {
    printf("%s\n", yytext);
                                      }
{SPACE} {

        }

{COMMENT} {
          }

[\s\S] {
}

%%

