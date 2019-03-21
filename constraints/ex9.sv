//  low < mid <high



class trans;
    rand bit[5:0] low,mid,high;
    constraint c1 {low<mid;
                    mid<high;}
endclass

    module ex9();

        trans t1;

        initial
            begin
                t1 = new();
                repeat(10)
                    begin
                        assert(t1.randomize);
                        $display("low=%d,mid=%d,high=%d",t1.low,t1.mid,t1.high);
                    end
             end
     endmodule
