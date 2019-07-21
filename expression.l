%option noyywrap

%{
#include "expression.tab.h"
%}

%%
\n		{return NEW_L;}
[0-9]+	{return INT;}
"+"		{return PLUS;}
"-"		{return MINUS;}
"*"		{return MULTI;}
"/"		{return DIVIDE;}
"^"		{return EXPONENT;}
"("		{return L_PAREN;}
")"		{return R_PAREN;}
[a-zA-Z]+	{return VAR;}
.		{return INVAL;}
%%
