%{
    /*  Exemplo 4    :: flex
        realiza o escaneamento e o reconhecimento de tags (e.g., HTML)   */

    int linhas = 0, qtdTags = 0;
%}

TAG         \<(.)*\>
WHITESPACE  [\ \t]
LINHA       [\n]
lett1       [a-z]+
lett2       [A-Z]+
word        [A-Z][a-z]+

%%
{lett1}     { printf("minusculo: %s\n", yytext); }
{lett2}     { printf("maiusculo: %s\n", yytext); }
{word}      { printf("word: %s\n", yytext); }
{TAG}       { qtdTags++; printf("Tag: %s\n", yytext); }
{LINHA}     { linhas++; }
{WHITESPACE};
.           ;
%%

int main (int nArgs, char* szArgs[]) {
    yylex();
    printf("\nTotal de linhas processadas: %d\n", linhas);
    printf("\nQuantidade de tags reconhecidas: %d\n", qtdTags);
    return 0;
}

int yywrap() {
    return 1;
}