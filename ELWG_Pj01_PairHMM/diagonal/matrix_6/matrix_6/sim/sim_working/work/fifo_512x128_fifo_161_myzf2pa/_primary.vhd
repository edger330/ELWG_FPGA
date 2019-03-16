library verilog;
use verilog.vl_types.all;
entity fifo_512x128_fifo_161_myzf2pa is
    port(
        clock           : in     vl_logic;
        data            : in     vl_logic_vector(127 downto 0);
        rdreq           : in     vl_logic;
        wrreq           : in     vl_logic;
        empty           : out    vl_logic;
        full            : out    vl_logic;
        q               : out    vl_logic_vector(127 downto 0);
        usedw           : out    vl_logic_vector(8 downto 0)
    );
end fifo_512x128_fifo_161_myzf2pa;
