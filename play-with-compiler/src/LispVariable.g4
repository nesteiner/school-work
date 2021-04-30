lexer grammar LispVariable;

ID: [a-zA-Z0-9_]+;

Number: '-'?[0-9]+;

SPACE: [ \t\r\n] -> skip;
