library verilog;
use verilog.vl_types.all;
entity Rom_Check1_rom_1port_161_mftnwoi is
    port(
        address         : in     vl_logic_vector(7 downto 0);
        clock           : in     vl_logic;
        rden            : in     vl_logic;
        q               : out    vl_logic_vector(31 downto 0)
    );
end Rom_Check1_rom_1port_161_mftnwoi;
