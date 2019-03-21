//generate pattern 010203040506070809010011012 without using array

class trans;

    rand int a;
    static int count=1;
    constraint c1 {if(count%2==0)
                    a==count/2;
                   else
                       a==0;}

    function void post_randomize();
        count=count+1;
        if(count>24)
            count=1;
    endfunction

endclass

    module ex31();

        trans t1;

        initial
            begin
                t1 = new();
                $display();
                repeat(24)
                begin
                    assert(t1.randomize());
                    $write("%d",t1.a);
                end
                $display();
            end
    endmodule
