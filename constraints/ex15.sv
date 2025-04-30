// constraint tongenerate multiples of power 2 
// should not use ** and use only one variable


class trans;

    rand logic [7:0] value;
    constraint c1 {value!=0;
                    (value & (value-1))==0;}  //bitwise and ex:val =32 val-1=31
                                              //10000(32)
endclass                                      //01111(31)
                                              //00000(0)
    module ex15();

        trans t1;

        initial
            begin
                t1 = new();
                $display("\n");
                repeat(10)
                    begin
                        assert(t1.randomize());
                        $display("value=%d",t1.value);
                    end
            end

        //for mul of 4 i.e 2**2 last two digits will be 00 for mul of 4 so (value & 2'b11)==0;
    endmodule
