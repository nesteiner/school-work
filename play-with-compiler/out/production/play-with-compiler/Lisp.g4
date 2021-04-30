grammar Lisp;
options {
language=Java;
}


lispy: expr* # lispLispy
;
expr: Number # lispNumber
| symbol # lispSymbol
| sexpr # lispSexpr
| qexpr # lispQexpr
;

sexpr: '(' expr* ')'
;

qexpr: '{' expr* '}'
;

symbol: '+' | '-' | '*' | '/';
Number: '-'?[0-9]+;

SPACE: [ \t\r\n] -> skip;