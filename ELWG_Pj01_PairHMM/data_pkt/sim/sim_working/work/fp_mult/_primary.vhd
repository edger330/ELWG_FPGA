library verilog;
use verilog.vl_types.all;
entity fp_mult is
    port(
        a               : in     vl_logic_vector(31 downto 0);
        areset          : in     vl_logic;
        b               : in     vl_logic_vector(31 downto 0);
        clk             : in     vl_logic;
        en              : in     vl_logic_vector(0 downto 0);
        q               : out    vl_logic_vector(31 downto 0)
    );
end fp_mult;
