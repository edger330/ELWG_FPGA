library verilog;
use verilog.vl_types.all;
entity ram_2_port_32x8_32 is
    port(
        data            : in     vl_logic_vector(7 downto 0);
        wraddress       : in     vl_logic_vector(4 downto 0);
        rdaddress       : in     vl_logic_vector(2 downto 0);
        wren            : in     vl_logic;
        clock           : in     vl_logic;
        rden            : in     vl_logic;
        q               : out    vl_logic_vector(31 downto 0)
    );
end ram_2_port_32x8_32;
