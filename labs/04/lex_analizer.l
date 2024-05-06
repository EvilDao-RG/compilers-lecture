%{
#include <stdio.h>
%}

%option noyywrap


%%
"//".*                  { printf("COMMENT"); }
"f"                     { printf("floatdcl "); }
"i"                     { printf("intdcl "); }
"p"                     { printf("print "); }
"+"                     { printf("plus "); }
"-"                     { printf("minus "); }
"*"                     { printf("times "); }
"/"                     { printf("divide "); }
"="                     { printf("assign "); }
[0-9]*\.[0-9]+          { printf("fnum "); }
[0-9]+                  { printf("inum "); }
[a-zA-Z]+[a-zA-Z0-9]*   { printf("id "); }
[ \t]+                  /* ignore whitespace */
.                       { printf("unknown token "); }
%%



int main() {
    yylex();
    return 0;
}


/* 
// basic code

//float b
f b

// integer a
i a

// a = 5
a = 5

// b = a + 3.2
b = a + 3.2

//print 8.5
p b
*/

/*
COMMENT
COMMENT
floatdcl id
COMMENT
intdcl id
COMMENT
id assign inum
COMMENT
id assign id plus fnum
COMMENT
print id
*/

