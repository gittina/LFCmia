%{
	int sum=0;
%}
number -?[0-9]+

%%

{number} {sum+=atoi(yytext);}

%%

int main()
{
yylex();
printf("sum = %d\n", sum);
return 0;
}
