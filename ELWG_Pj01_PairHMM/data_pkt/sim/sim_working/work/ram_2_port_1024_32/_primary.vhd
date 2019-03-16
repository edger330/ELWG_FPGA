library verilog;
use verilog.vl_types.all;
entity ram_2_port_1024_32 is
    port(
        data            : in     vl_logic_vector(31 downto 0);
        wraddress       : in     vl_logic_vector(9 downto 0);
        rdaddress       : in     vl_logic_vector(9 downto 0);
        wren            : in     vl_logic;
        clock           : in     vl_logic;
        rden            : in     vl_logic;
        q               : out    vl_logic_vector(31 downto 0)
    );
end ram_2_port_1024_32;
