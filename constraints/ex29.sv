//generate pattern 001002003004005

class trans;

    rand int a[5];
    constraint c1 {foreach(a[i]){
                        a[i]==i+1;
    }}

    function void post_randomize();
        foreach(a[i])
            begin
                $write("%03d",a[i]);
                end
    endfunction

endclass

    module ex29();

        trans t1;

        initial
            begin
                t1 =new();
                assert(t1.randomize);
             end
    endmodule
