// static constraints  use static keyword for the constraint which acts as a common memory for all handles
// inline constraints  use with keyword along assert(h.randomize())
//   extern constraints 


class packet;
    rand bit[3:0]addr;
    constraint valid_addr;
endclass

constraint packet :: valid_addr{addr<10;}

    module con9();

        packet p1;

        initial
            begin
                p1 = new();
                repeat(2)
                    begin
                        assert(p1.randomize());
                        $display("addr for pkt is %d",p1.addr);
                    end
            end
    endmodule
