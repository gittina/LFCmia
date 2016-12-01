%{
%}

%%

[0-9]+		{ int a = atoi(yytext);
				if(a%7==0){
					printf("%d", a+3);
				}
				else
				{
				ECHO;}
			}

\n				|
.				{ECHO;
				}




%%
int main() {
  yylex();
  return 0;
}