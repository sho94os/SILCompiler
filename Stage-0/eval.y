%{
    #include <stdio.h>
    #include <stdlib.h>
    int yyerror();
%}

%token DIGIT NEWLINE


%left '+' '-'
%left '*' '/'


%%

start : expr NEWLINE        {   printf("Expression value = %d\n",$1); exit(1); };

expr:  expr '+' expr	    { $$ = $1 + $3; }
	| expr '*' expr		    { $$ = $1 * $3; }
	| expr '-' expr		    { $$ = $1 - $3; }
	| expr '/' expr		    { $$ = $1 / $3; }
	| '(' expr ')'	 	    { $$ = $2; }
	| DIGIT			        { $$ = $1; }
	;

%%

int yyerror(){

	printf("Error");
}

int main(){

  yyparse();
  return 1;
}
