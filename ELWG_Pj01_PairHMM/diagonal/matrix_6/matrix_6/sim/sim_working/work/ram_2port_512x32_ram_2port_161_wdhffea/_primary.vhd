library verilog;
use verilog.vl_types.all;
entity ram_2port_512x32_ram_2port_161_wdhffea is
    port(
        clock           : in     vl_logic;
        data            : in     vl_logic_vector(31 downto 0);
        rdaddress       : in     vl_logic_vector(8 downto 0);
        rden            : in     vl_logic;
        wraddress       : in     vl_logic_vector(8 downto 0);
        wren            : in     vl_logic;
        q               : out    vl_logic_vector(31 downto 0)
    );
end ram_2port_512x32_ram_2port_161_wdhffea;
