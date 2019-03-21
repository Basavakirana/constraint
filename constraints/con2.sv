//  rand and constraint modes



class trans;
    rand bit[15:0]pktlen;
    constraint undersize {pktlen<=16'd64;}
endclass

    module con2();

        trans t1;

        initial
            begin
                t1 = new();
                if(t1.pktlen.rand_mode())
                    begin
                        for(int i=0;i<16;i++)
                            assert(t1.randomize);
                            $display("pkt len is %d",t1.pktlen);
                    end
                t1.undersize.constraint_mode(0);
                $display("pkt len is %d",t1.pktlen);
                assert(t1.randomize() with {pktlen>64;});
                t1.undersize.constraint_mode(1);
                assert(t1.randomize());
                $display("pkt len is %d",t1.pktlen);
            end
     endmodule
