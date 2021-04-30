grammar Lisp;
import LispVariable;

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
assign: '(' 'define' ID expr ')'
;