//generate pattern 00110011001100110011

class trans;
    
    rand bit[1:0]a[];
    constraint c1 {a.size()==10;}
    constraint c2 {foreach(a[i]){
                    if(i%2==0)
                        a[i]==2'b00;
                    else
                        a[i]==2'b11;}}
    function void post_randomize();
        $display("the pattern is");
        foreach(a[i])
            begin
                $write("%b",a[i]);
            end
            $display("\n");
    endfunction

endclass

    module ex28();

        trans t1;

        initial
            begin
                t1 =new();
                $display("\n");
     //           repeat(5)
     //           begin
                    assert(t1.randomize);
     //               $display("the pattern is");
   //                 $display("a=%p %b",t1.a,t1.a);
    //            end
            end
    endmodule
