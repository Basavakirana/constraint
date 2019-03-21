//generate pattern 1234554321

class trans;

    rand int a[];
    constraint c1 {a.size()==10;}
    constraint c2 {foreach(a[i]){
                    if(i<=4)
                        a[i]==i+1;
                    else
                        a[i]==10-i;}
                   }

endclass

    module ex27();
        
        trans t1;

        initial
            begin
                t1 =new();
                $display("\n");
                repeat(10)
                begin
                    assert(t1.randomize);
                    $display("The pattern is");
                    $display("a=%p",t1.a);
                end
                $display("\n");
            end
    endmodule
