// constraint to generate btwn 25 to 50 and same variable should generate >40 what happens



class trans;
    rand bit[5:0]data;
    constraint c1 {data inside {[25:50]};}
    constraint c2 {data > 40;}
endclass

    module ex7();

        trans t1;

        initial
            begin
                t1 = new();
                $display("\n\n");
                repeat(10)
                    begin
                        assert(t1.randomize());
                        $display("data is %d",t1.data);
                    end
                    $display("\n\n");
             end
     endmodule

