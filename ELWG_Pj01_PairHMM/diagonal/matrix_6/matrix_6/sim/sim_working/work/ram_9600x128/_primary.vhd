library verilog;
use verilog.vl_types.all;
entity ram_9600x128 is
    port(
        data            : in     vl_logic_vector(127 downto 0);
        wraddress       : in     vl_logic_vector(13 downto 0);
        rdaddress       : in     vl_logic_vector(15 downto 0);
        wren            : in     vl_logic;
        clock           : in     vl_logic;
        rden            : in     vl_logic;
        q               : out    vl_logic_vector(31 downto 0)
    );
end ram_9600x128;
