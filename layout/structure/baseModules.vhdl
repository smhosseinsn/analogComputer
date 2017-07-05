architecture structural of baseModules is
           -- Declarations
           component SWITCH
                port (in1, in2, select: in std_logic;
                      out1: out std_logic);
           end component;
           component A2D
                port (in1, clock: in std_logic;
                      out1: out std_logic_vector(7 downto 0));
           end component;
           component D2A
                port (clock: in std_logic;
                      in1: in std_logic_vector(7 downto 0);
                      out1: out std_logic);
           end component;
           component MUX21
                port (in1: in std_logic;
                      out1: out std_logic);
           end component;
           -- declaration of signals used to interconnect gates
signal DOOR_NOT, SBELT_NOT, B1, B2: std_logic;
     begin
           -- Component instantiations statements
           U0: NOT1
              port map (DOOR, DOOR_NOT);
           U1: NOT1
              port map (SBELT, SBELT_NOT);
           U2: AND2
              port map (IGNITION, DOOR_NOT, B1);
           U3: AND2
              port map (IGNITION, SBELT_NOT, B2);
           U4: OR2
              port map (B1, B2, WARNING);

end structural;
