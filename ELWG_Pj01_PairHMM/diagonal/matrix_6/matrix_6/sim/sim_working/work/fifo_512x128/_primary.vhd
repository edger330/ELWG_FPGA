library verilog;
use verilog.vl_types.all;
entity fifo_512x128 is
    port(
        data            : in     vl_logic_vector(127 downto 0);
        wrreq           : in     vl_logic;
        rdreq           : in     vl_logic;
        clock           : in     vl_logic;
        q               : out    vl_logic_vector(127 downto 0);
        usedw           : out    vl_logic_vector(8 downto 0);
        full            : out    vl_logic;
        empty           : out    vl_logic
    );
end fifo_512x128;
