library verilog;
use verilog.vl_types.all;
entity rom_16384x32_rom_1port_161_n3lea5i is
    port(
        address         : in     vl_logic_vector(13 downto 0);
        clock           : in     vl_logic;
        rden            : in     vl_logic;
        q               : out    vl_logic_vector(31 downto 0)
    );
end rom_16384x32_rom_1port_161_n3lea5i;
