//  set membership



class trans;
    rand bit[3:0]addr;
    constraint adc {addr inside {3,7,[11:15]};}
endclass

    module con6();

        trans t1;

        initial
            begin
                t1 = new();
                assert(t1.randomize());
                $display("addr is %d",t1.addr);
            end
    endmodule
