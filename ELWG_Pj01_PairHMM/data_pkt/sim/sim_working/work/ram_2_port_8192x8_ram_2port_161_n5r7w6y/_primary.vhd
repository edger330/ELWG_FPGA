library verilog;
use verilog.vl_types.all;
entity ram_2_port_8192x8_ram_2port_161_n5r7w6y is
    port(
        clock           : in     vl_logic;
        data            : in     vl_logic_vector(7 downto 0);
        rdaddress       : in     vl_logic_vector(12 downto 0);
        rden            : in     vl_logic;
        wraddress       : in     vl_logic_vector(12 downto 0);
        wren            : in     vl_logic;
        q               : out    vl_logic_vector(7 downto 0)
    );
end ram_2_port_8192x8_ram_2port_161_n5r7w6y;
