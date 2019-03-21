//   constraint to generate multiples of power 2


class trans;

    rand logic [7:0] value;
    rand logic [4:0] power;
    constraint c1 {value == 2**power;}

endclass

    module ex14();

        trans t1;

        initial
            begin
                t1 = new();
                repeat(10)
                    begin
                        assert(t1.randomize());
                        $display("value=%d,power=%d",t1.value,t1.power);
                    end
             end
     endmodule
