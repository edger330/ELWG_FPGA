library verilog;
use verilog.vl_types.all;
entity test is
    generic(
        D               : integer := 2
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of D : constant is 1;
end test;
