library verilog;
use verilog.vl_types.all;
entity rom_y_initial_rom_1port_161_dumqmsi is
    port(
        address         : in     vl_logic_vector(8 downto 0);
        clock           : in     vl_logic;
        rden            : in     vl_logic;
        q               : out    vl_logic_vector(31 downto 0)
    );
end rom_y_initial_rom_1port_161_dumqmsi;
