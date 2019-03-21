// generate unique numbers between 99 and 100



class trans;

    rand int val;
    real real_val;
    constraint c1 {val inside {[990:1000]};}

    function post_randomize();
        real_val = val/10.0;
        $display("\nunique no btwn 99 and 100=%f",real_val);
    endfunction

endclass

    module ex3();

        trans t1;

        initial
            begin
                t1 = new();
                repeat(10)
                    begin
                        assert(t1.randomize());
                    end
            end
    endmodule
