//genrerate address where 9 bits are set to 1,seq 111,000 must not appear in 16 bit address

class trans;

    rand bit[15:0]a;
    constraint c1 {$countones(a)==9;}
    constraint c2 {foreach(a[i]){
                    if(i<14)
                        {a[i],a[i+1],a[i+2]}!=3'b000;}}
        //                {a[i],a[i+1],a[i+2]}!=3'b111;}}
    
    function void post_randomize();
        foreach(a[i])
            $display("%d",a[i]);
    endfunction

endclass

    module ex33();

        trans t1;

        initial
            begin
                t1 = new();
                assert(t1.randomize());
            end
    endmodule
