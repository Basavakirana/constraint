// constraint for an array, each element in an array should be unique
// and even val should be generated in even index.along with that 
// sum of an array should be < 1000


class trans;
    
    rand bit[15:0] val[];
    constraint c1{val.size() inside {[5:10]};}
    constraint c2 {foreach(val[i]){
                    unique{val[i]};
                    if(i%2==0)
                        val[i]%2==0;}
                    }
    constraint c3 {val.sum() with (int'(item))<1000;}

    function void display();
        foreach(val[i])
            begin
                $display("value[%d]=%d",i,val[i]);
            end
            $display("sum=%d",val.sum());
    endfunction

endclass

    module ex16();

        trans t1;

        initial
            begin
                t1 = new();
                $display("\n");
                repeat(5)
                    begin
                        assert(t1.randomize());
                        t1.display();
                     end
             end
    endmodule
