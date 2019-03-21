class apb_trans;

    rand bit[31:0] addr;
    rand bit[31:0] data;
    rand bit write;
    rand int setup_cycles;
    constraint c1 {addr inside{[32'h0000_0000:32'h1FFF_FFFF]};}
    constraint c2 {addr[1:0]==2'b00;}
    constraint c3 {data inside{[32'h0000_0000:32'hFFFF_FFFF]};}
    constraint c4 {setup_cycles inside{[2:5]};}
    constraint c5 {setup_cycles dist{2:=50,3:=30,[4:5]:/20};}
    constraint c6 {write dist{0:=10,1:=90};}
endclass

    module apb1();

        apb_trans t1;

        initial
            begin
                t1 = new();
                $display("\n");
                repeat(5)
                    begin
                        assert(t1.randomize());
                        $display("apb transactions are");
                        $display("  address=%h\n  data=%h\n  write=%d\n  setup_cycles=%d",t1.addr,t1.data,t1.write,t1.setup_cycles);
                        $display("\n");
                     end
             end
     endmodule
