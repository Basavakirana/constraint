//  generate odd random no btwn 10 to 30


class trans;

    rand int a;
    constraint c1 {a inside {[10:30]};}
    constraint c2 {a%2==1;}
endclass

    module ex4();

        trans t1;

        initial
            begin
                t1 = new();
    //            assert(t1.randomize());
                $display("\nodd num btwn 10 to 30 are");
                repeat(10)
                    begin
                        assert(t1.randomize());
                        $display("%d",t1.a);
                    end
                    $display("\n");
            end
    endmodule
