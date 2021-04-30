grammar Calculator;

prog: stat+;
stat: expr NEWLINE   # printExpr
| ID '=' expr NEWLINE # assign
| NEWLINE   # blank
;

expr: expr hello=('*'|'/') expr #MulDiv
|     expr hello=('+'|'-') expr #AddSub
| INT #int
| ID #id
| '(' expr ')' #parens
;

ID: [a-zA-Z]+;
INT: [0-9]+;
NEWLINE: '\r'?'\n';
WS: [ \t]+ -> skip;

MUL: '*';
DIV: '/';
ADD: '+';
SUB: '-';