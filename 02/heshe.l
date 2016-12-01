%{
int hecount = 0;
int shecount = 0;
%}

%%
she {shecount++; hecount++;}
he {hecount++;}
%%

int main(){
	yylex();
	printf("There were %d she words\n", shecount);
	printf("There were %d he words\n", hecount);
	return 0;
}
