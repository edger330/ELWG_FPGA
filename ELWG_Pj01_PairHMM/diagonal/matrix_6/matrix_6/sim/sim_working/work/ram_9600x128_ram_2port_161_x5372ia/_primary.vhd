library verilog;
use verilog.vl_types.all;
entity ram_9600x128_ram_2port_161_x5372ia is
    port(
        clock           : in     vl_logic;
        data            : in     vl_logic_vector(127 downto 0);
        rdaddress       : in     vl_logic_vector(15 downto 0);
        rden            : in     vl_logic;
        wraddress       : in     vl_logic_vector(13 downto 0);
        wren            : in     vl_logic;
        q               : out    vl_logic_vector(31 downto 0)
    );
end ram_9600x128_ram_2port_161_x5372ia;
