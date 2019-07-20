%%
[0-9]+	{return INT;}
"+"		{return PLUS;}
"-"		{return MINUS;}
"*"		{return MULTI;}
"/"		{return DIVIDE;}
"^"		{return EXPONENT;}
"("		{return L_PAREN;}
")"		{return R_PAREN;}
[a-Z]+	{return VAR;}
%%
