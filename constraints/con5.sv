//  soft constraint



class trans;
    rand bit[3:0]addr;
    constraint addr_range {soft addr>15;}
endclass

    module con5();

        trans t1;

        initial
            begin
                t1 = new();
                assert(t1.randomize() with {addr<15;});
                $display("addr is %d",t1.addr);
            end
    endmodule
