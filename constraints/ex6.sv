// without inside operator generate random values for range 34-43



class trans;
    rand bit[5:0] value;
    constraint c1 {(value > 34) && (value < 43);}
endclass

    module ex6();

        trans t1;

        initial
            begin
                t1 =new();
                $display("\n\n");
                repeat(10)
                    begin
                        assert(t1.randomize());
                        $display("value is %d",t1.value);
                    end
             end
      endmodule
