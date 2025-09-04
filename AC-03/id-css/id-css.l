%{
    /*  Analisador lexico para id de css  */
    int classes = 0, id = 0, propriedades = 0;
%}

CLASS           \.[a-zA-Z_-][a-zA-Z0-9_-]*
ID              \#[a-zA-Z_-][a-zA-Z0-9_-]*
PROPRIEDADE     [a-zA-Z][-a-zA-Z]*:
WHITESPACE      [ \t\n]+

%%
{CLASS}         { printf("Classe: %s\n", yytext); classes++;}
{ID}            { printf("ID: %s\n", yytext); id++; }
{PROPRIEDADE}   { printf("propriedade: %s\n", yytext); propriedades++; }
{WHITESPACE}    ;
.               ;
%%

int main (int nArgs, char* szArgs[]) {
    yylex();
    printf("\nResumo:\n");
    printf("Classes: %d\n", classes);
    printf("IDs: %d\n", id);
    printf("Propriedades: %d\n", propriedades);
    return 0;
}

int yywrap() {
    return 1;
}