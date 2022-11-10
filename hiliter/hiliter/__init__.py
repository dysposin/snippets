import sys
import json
import argparse

from pygments import highlight
from pygments import lexers
from pygments.formatters import TerminalFormatter
from pygments.util import ClassNotFound


def pretty_output(infile, lexer):
    with open(infile, 'r') as f:
        contents = f.read()
        if lexer is None:
            lexer = lexers.guess_lexer_for_filename(infile, contents)
        print(highlight(contents, lexer, TerminalFormatter()))

def argument_parsing():
    parser = argparse.ArgumentParser(description='Print source code in terminal with syntax hilighting')
    parser.add_argument('infile', metavar='file path', 
                        action='store', help='source file to be printed')
    parser.add_argument('-l', '--lexer', action='store')

    if len(sys.argv) == 1:
        parser.print_usage(sys.stderr)
        print('try \'python {} -h\' for more info'.format(sys.argv[0]), file=sys.stderr)
        sys.exit(1)
    args = parser.parse_args()

    infile = args.infile
    lexer = args.lexer
    if lexer is not None:
        try:
            lexer = lexers.get_lexer_for_filename(lexer)
        except ClassNotFound:
            pass
        try:
            lexer = lexers.get_lexer_by_name(lexer)
        except ClassNotFound:
            lexer = None
            print('Could not find requested lexer, guessing from file contents')
    return infile, lexer

if __name__=='__main__':
    infile, lexer = argument_parsing()
    pretty_output(infile, lexer)
