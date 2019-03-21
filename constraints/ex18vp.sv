class trans;

    rand bit[7:0] data;
    constraint c1 {data inside {[0:100]};}

endclass

    module ex18vp();

        trans t1;

        initial
            begin
                t1 = new();
                $display("\n");
                repeat(10)
                    begin
                        assert(t1.randomize());
                        $display("data=%d",t1.data);
                    end
            end
     endmodule

