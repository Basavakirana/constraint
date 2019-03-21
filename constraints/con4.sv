// constraint overriding



class transaction;
    rand bit[15:0]pktlen;
    constraint oversize{pktlen>16'd0;}
endclass

class trans_ext extends transaction;
    constraint oversize{pktlen<=16'd10;}
endclass

    module con4();

        trans_ext t1;

        initial
            begin
                t1 = new();
                assert(t1.randomize());
                $display("pktlen is %d",t1.pktlen);
            end
     endmodule




