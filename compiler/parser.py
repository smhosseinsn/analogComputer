import re

from tdparser import Lexer, Token
#Grammar definition                         Precedence
#Range
#dep var
#ind var
#const
#arg1 + arg2 => expr                        10
#arg1 - arg2 => expr                        10
#arg1 * arg2 => expr                        20
#arg1 / arg2 => expr                        20
#(arg) => expr                              30
#deriv(arg, var, order) => expr             40
#int(arg, var, order) => expr               40
#exp(base, arg) => expr                     40
#ln(base,arg) => expr                       40
#sigmoid(lower, upper, arg) => expr         40
#pow(exp, arg) => expr                      40
#Optional
#sin(arg) => expr                           40
#cos(arg) => expr                           40
#tan(arg) => expr                           40
#arg1 = arg2                                50      Assignment
#arg1 == arg2                               50      Constraint

class Integer(Token):
    def __init__(self, text):
        self.value = int(text)

    def nud(self, context):
        """What the token evaluates to"""
        return self.value

class Addition(Token):
    lbp = 10  # Precedence

    def led(self, left, context):
        """Compute the value of this token when between two expressions."""
        # Fetch the expression to the right, stoping at the next boundary
        # of same precedence
        right_side = context.expression(self.lbp)
        return left + right_side

class Substraction(Token):
    lbp = 10  # Same precedence as addition

    def led(self, left, context):
        return left - context.expression(self.lbp)

    def nud(self, context):
        """When a '-' is present on the left of an expression."""
        # This means that we are returning the opposite of the next expression
        return - context.expression(self.lbp)

class Multiplication(Token):
    lbp = 20  # Higher precedence than addition/substraction

    def led(self, left, context):
        return left * context.expression(self.lbp)


lexer = Lexer(with_parens=True)
lexer.register_token(Integer, re.compile(r'\d+'))
lexer.register_token(Addition, re.compile(r'\+'))
lexer.register_token(Substraction, re.compile(r'-'))
lexer.register_token(Multiplication, re.compile(r'\*'))

def parse(text):
    return lexer.parse(text)
