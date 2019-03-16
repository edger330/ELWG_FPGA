library verilog;
use verilog.vl_types.all;
entity rom_512x32 is
    port(
        address         : in     vl_logic_vector(8 downto 0);
        clock           : in     vl_logic;
        rden            : in     vl_logic;
        q               : out    vl_logic_vector(31 downto 0)
    );
end rom_512x32;
