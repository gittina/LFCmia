%{
int words = 0;
int lines = 0;
int chars = 0;

int totwords = 0;
int totlines = 0;
int totchars = 0;
%}

letter [^ \t\n]


%%

{letter}+ {words++; chars+=yyleng;}
. {chars++;}
\n {lines++; chars++;}

%%

int main(int argc, char **argv){
	
	int i;
	
	/*
	se c'è solo nome eseguibile
	*/
	if (argc<2){
		printf("missing arguments\n");
	} else {	
		for (i=1; i<argc; i++){
			char *file=argv[i];			
		
			FILE *f = fopen(file, "r");
			printf("aperto %s \n", file);
		
			//se file non è stato aperto
			if (!f){
				perror(file);
				return(1);
			}
		
			yyrestart(f);
			yylex();
			fclose(f);

			printf("%d lines\n", lines);
			printf("%d words\n", words);
			printf("%d chars\n", chars);
			printf("in file %s  \n", file);
			
			//aggiornamento contatatori		
			totlines+=lines;
			totwords+=words;
			totchars+=chars;
			
			//azzeramento contatori per prossimo file
			lines=0;
			words=0;
			chars=0;
		}
		
		//se ho inserito più files da terminal stampa il tot
		if (argc>1){
			printf("There were a total of %d lines\n", totlines);
			printf("total words %d\n", totwords);
			printf("total chars %d\n", totchars);		
		}

	}

	return 0;
}
