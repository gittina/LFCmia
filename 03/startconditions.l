%s A B C

%%
^a	{ECHO; BEGIN A;}
^b      {ECHO; BEGIN B;}
^c      {ECHO; BEGIN C;}
\n      {ECHO; BEGIN 0;}

<A>directory			printf("first");
<B>directory			printf("second");
<C>directory			printf("third");

%%
int main() {
  yylex();
  return 0;
}
