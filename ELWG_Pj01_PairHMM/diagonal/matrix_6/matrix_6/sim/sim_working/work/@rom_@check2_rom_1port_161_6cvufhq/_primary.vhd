library verilog;
use verilog.vl_types.all;
entity Rom_Check2_rom_1port_161_6cvufhq is
    port(
        address         : in     vl_logic_vector(7 downto 0);
        clock           : in     vl_logic;
        rden            : in     vl_logic;
        q               : out    vl_logic_vector(31 downto 0)
    );
end Rom_Check2_rom_1port_161_6cvufhq;
