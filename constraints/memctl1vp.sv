class mem_trans;

    rand bit read;
    rand bit write;
    rand int addr;
    rand int data;
    constraint c1 {read dist{[0:1]:/100};}
    constraint c2 {write dist{[0:1]:/100};}
    constraint c3 {(read != write);}
    constraint c4 {addr inside{[32'h00000000:32'h1FFFFFFF]};}
    constraint c5 {data inside{[32'h00000000:32'hFFFFFFFF]};}

endclass

    module mem1();

        mem_trans t1;

        initial
            begin
                t1 = new();
                $display("\n");
                repeat(5)
                    begin
                        assert(t1.randomize());
                        $display("memory controller transactions are");
                        $display("  read=%d\n  write=%d\n  address=%d\n  data=%d",t1.read,t1.write,t1.addr,t1.data);
                    end
             end
     endmodule
