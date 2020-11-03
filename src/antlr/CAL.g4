grammar CAL;


/* Statements */


prog
    :   decl_list function_list main;

decl_list
    :   decl SemiColon decl_list
    |   empty_statment
    ;

decl
    :   var_decl
    |   const_decl
    ;

var_decl
    :   Variable ID Colon type;
const_decl
    :   <assoc=right> Constant ID Colon type ASSIGNMENT expression
    ;


function_list
    :   function function_list
    |   empty_statment
    ;

function
    :   type ID O_Paren parameter_list C_Paren Is decl_list Begin statement_block Return O_Paren ( expression | empty_statment ) C_Paren SemiColon End
    ;

type
    :   Integer
    |   Boolean
    |   Void
    ;

parameter_list
    :   nemp_paramerter_list
    |   empty_statment
    ;

nemp_paramerter_list
    :   ID Colon type
    |   ID Colon type Comma nemp_paramerter_list
    ;

main
    :   Main Begin decl_list statement_block End
    ;

statement_block
    :   statement statement_block | empty_statment
    ;

statement
    :   <assoc=right> ID ASSIGNMENT expression SemiColon
    |   ID O_Paren argument_list C_Paren SemiColon
    |   Begin statement_block End
    |   If condition Begin statement_block End Else Begin statement_block End
    |   While condition Begin statement_block End
    |   Skip SemiColon
    ;

expression
    :   fragm binary_arith_op fragm
    |   O_Paren expression C_Paren
    |   ID O_Paren argument_list C_Paren
    |   fragm
    ;

condition
    :   <assoc=right> NOT condition
    |   O_Paren condition C_Paren
    |   expression comp_operators expression
    |   condition ( OR | AND ) condition
    ;

fragm
    :   ID
    |   MINUS ID
    |   NUMBER
    |   REAL_N
    |   True
    |   False
    ;

argument_list
    :   nemp_argument_list
    |   empty_statment
    ;

nemp_argument_list
    :   ID
    |   ID Comma nemp_argument_list
    ;

empty_statment
    :
    ;

binary_arith_op
    :   PLUS
    |   <assoc=right> MINUS
    ;

comp_operators
    :   OR
    |   EQUAL
    |   NOTEQUAL
    |   LT
    |   LTE
    |   GT
    |   GTE
    ;

Variable:               V A R I A B L E;
Constant:               C O N S T A N T;
Return:                 R E T U R N;
Integer:                I N T E G E R;
Boolean:                B O O L E A N;
Void:                   V O I D;
Main:                   M A I N;
If:                     I F;
Else:                   E L S E;
True:                   T R U E;
False:                  F A L S E;
While:                  W H I L E;
Begin:                  B E G I N;
End:                    E N D;
Is:                     I S;
Skip:                   S K I P;

SemiColon:              ';';
Colon:                  ':';
Comma:                  ',';

ID:                     Letter (Letter | Digit | UnderScore)*;
NUMBER:                 MINUS? ( Digit |  NonZero Digit+ );
REAL_N:                 NUMBER Dot NUMBER;

/* Fragments */

fragment A:             'a'  |  'A';
fragment B:             'b'  |  'B';
fragment C:             'c'  |  'C';
fragment D:             'd'  |  'D';
fragment E:             'e'  |  'E';
fragment F:             'f'  |  'F';
fragment G:             'g'  |  'G';
fragment H:             'h'  |  'H';
fragment I:             'i'  |  'I';
fragment K:             'k'  |  'K';
fragment L:             'l'  |  'L';
fragment M:             'm'  |  'M';
fragment N:             'n'  |  'N';
fragment O:             'o'  |  'O';
fragment P:             'p'  |  'P';
fragment R:             'r'  |  'R';
fragment S:             's'  |  'S';
fragment T:             't'  |  'T';
fragment U:             'u'  |  'U';
fragment V:             'v'  |  'V';
fragment W:             'w'  |  'W';

fragment Letter:        [a-zA-Z];
fragment Digit:         [0-9];
fragment NonZero:       [1-9];
fragment UnderScore:    '_';
fragment Dot:           '.';

/* Syntax Tokens*/

O_Brace:                '{';
C_Brace:                '}';
O_Bracket:              '[';
C_Bracket:              ']';
O_Paren:                '(';
C_Paren:                ')';

/* Aritmetic Opperators */

MINUS:                  '-';
PLUS:                   '+';

/* Logical Operators */

ASSIGNMENT:             ':=';
NOT:                    '~';
OR:                     '|';
AND:                    '&';
EQUAL:                  '=';
NOTEQUAL:               '!=';
LT:                     '<';
LTE:                    '<=';
GT:                     '>';
GTE:                    '>=';

/* Skips */

WS:                     [ \t\n\r]+ -> skip;
COMMENT:                ( '//' .*? '\n' | ( '/*' (. | '\n')*? '*/' ))  -> skip;
