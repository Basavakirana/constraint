class trans;
    rand bit[15:0]pktlen;
    constraint undersize {pktlen<=16'd64;}
endclass

    module con1();

        trans t1 = new();

        initial
            begin
                for(int i=0;i<16;i++)
                    begin
                        assert(t1.randomize);
                        $display("pklen is %d",t1.pktlen);
                    end
            end
    endmodule
