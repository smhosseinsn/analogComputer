from enum import Enum

class ColumnTypes(Enum):
    D2A = 1
    A2D = 2
    IDFU = 3
    FU = 4

class Column(object):

    def __init__(self):
        self.num_functions = 10
        self.num_storage = 10
        self.type =


    def print_spice(self):
        print ""

    def print_vhdl(self):
        print ""

    def print_sim(self):
        print ""
