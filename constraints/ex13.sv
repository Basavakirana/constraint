//  to generate phone no with 852 as starting


class trans;
    
    rand int no[];
    constraint c1 {no.size()==10;}
    constraint c2 {foreach(no[i]){
                   ((no[i]>=0) && (no[i]<10));
                    if(i==0)
                        no[i]==8;
                    else if(i==1)
                        no[i]==5;
                    else if(i==2)
                        no[i]==2;}}

    function void display();
            $write("random mobile no is");
            foreach(no[i])
                begin
                    $write("%d",no[i]);
                end
                    $write("\n");
     endfunction

endclass

    module ex13();

        trans t1;

        initial
            begin
                t1 = new();
                repeat(10)
                    begin
                        assert(t1.randomize());
                        t1.display();
                     end
            end
     endmodule
