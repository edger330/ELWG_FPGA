library verilog;
use verilog.vl_types.all;
entity rom_128x16_rom_1port_161_vksrila is
    port(
        address         : in     vl_logic_vector(6 downto 0);
        clock           : in     vl_logic;
        rden            : in     vl_logic;
        q               : out    vl_logic_vector(15 downto 0)
    );
end rom_128x16_rom_1port_161_vksrila;
