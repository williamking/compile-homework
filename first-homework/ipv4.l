%{
    #include "stdio.h"
    #include "stdlib.h"

    int find = 0;
%}

NORMAL ((0)|0{0,2}[1-9])|(0{0,1}[1-9][0-9])|(1[0-9][0-9])|(2[0-4][0-9])|(25[0-5])
TYPEA ((0)|0{0,2}[0-9])|(0{0,1}[1-9][0-9])|(1[0-1][0-9])|(12[0-7])
TYPEB (12[8-9])|(1[3-8][0-9])|(19[0-1])
TYPEC (19[2-9])|(2[0-1][0-9])|(22[0-3])
TYPED (22[4-9])|(23[0-9])
TYPEE (24[0-9])|(25[0-5])

%%

{TYPEA}\.{NORMAL}\.{NORMAL}\.{NORMAL}\n{0,1} {
    find = 1;
    printf("A\n");
                                           }
{TYPEB}\.{NORMAL}\.{NORMAL}\.{NORMAL}\n{0,1} {
    find = 1;
    printf("B\n");
                                           }
{TYPEC}\.{NORMAL}\.{NORMAL}\.{NORMAL}\n{0,1} {
    find = 1;
    printf("C\n");
                                           }
{TYPED}\.{NORMAL}\.{NORMAL}\.{NORMAL}\n{0,1} {
    find = 1;
    printf("D\n");
                                           }
{TYPEE}\.{NORMAL}\.{NORMAL}\.{NORMAL}\n{0,1} {
    find = 1;
    printf("E\n");
                                           }

.*\n{0,1} {
    printf("Invalid\n");
}

%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
