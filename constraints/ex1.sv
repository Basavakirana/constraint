// constraint to generate random values divisible by 5


class trans;
    rand bit[5:0]a;
    constraint c1 {a%5==0;}
endclass

    module ex1();

        trans t1;

        initial
            begin
                t1 = new();
                repeat(10)
                    begin
                        assert(t1.randomize());
                        $display("value of a is %d",t1.a);
                    end
            end
    endmodule

