%{
    /*  Exemplo 2 :: flex
        reconhecimento e contagem de novas linhas, caracteres
        e tabulacoes    */

    int linhas = 0, caracteres = 0, tabs = 0;
%}

NOVALINHA   [\n]+
TAB         [\t]+

%%
{NOVALINHA}     { ++linhas; ++caracteres; }
{TAB}           { ++tabs; }
.               { ++caracteres; }
%%

int main (int nArgs, char* szArgs[]) {
    yylex();
    printf("Numero linhas: %d\n", linhas);
    printf("Numero tabulacoes: %d\n", tabs);
    printf("Numero caracteres: %d\n", caracteres);
    return 0;
}

int yywrap() {
    return 1;
}