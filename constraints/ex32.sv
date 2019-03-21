//generate odd and even factorials with size 10

class trans;

    rand int a[10];

    function int fact(int i);
        if(i==0)
            fact=1;
        else
            fact=i*fact(i-1);
    endfunction

    constraint c1{foreach(a[i]) a[i]==fact(i);}

    function void post_randomize();
        foreach(a[i])
        if(i%2==0)
            $display("even factorial %d",a[i]);
        else
            $display("odd factorial %d",a[i]);
    endfunction

endclass

    module ex32();

        trans t1;

        initial
            begin
                t1 = new();
                assert(t1.randomize());
            end
     endmodule
