library verilog;
use verilog.vl_types.all;
entity ram_2_wrport_1024x32_ram_2port_161_n7zuzsy is
    port(
        address_a       : in     vl_logic_vector(9 downto 0);
        address_b       : in     vl_logic_vector(9 downto 0);
        clock           : in     vl_logic;
        data_a          : in     vl_logic_vector(31 downto 0);
        data_b          : in     vl_logic_vector(31 downto 0);
        rden_a          : in     vl_logic;
        rden_b          : in     vl_logic;
        wren_a          : in     vl_logic;
        wren_b          : in     vl_logic;
        q_a             : out    vl_logic_vector(31 downto 0);
        q_b             : out    vl_logic_vector(31 downto 0)
    );
end ram_2_wrport_1024x32_ram_2port_161_n7zuzsy;
