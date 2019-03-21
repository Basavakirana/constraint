class trans;

    rand int choice;
    constraint c1 {choice dist {0:=50,1:=50};}

endclass

    module ex22vp();

        trans t1;

        initial
            begin
                t1 =new();
                $display("\n");
                repeat(10)
                    begin
                        assert(t1.randomize());
                        $display("choice value is %d",t1.choice);
                    end
            end
     endmodule
