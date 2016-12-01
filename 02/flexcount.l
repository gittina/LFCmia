%{
int lexcount = 0;
int flexcount = 0;
%}

%%
flex {flexcount++; lexcount++;}
lex {lexcount++;}
%%

int main(){
	yylex();
	printf("There were %d lex words\n", lexcount);
	printf("There were %d flex words\n", flexcount);
	return 0;
}
