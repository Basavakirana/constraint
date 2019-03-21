// constraint to generate pattern 0102030405


class trans;

    rand int a[];
    constraint c1 {a.size()==10;}
    constraint c2 {foreach(a[i])
                    if(i%2==0)
                        a[i]==0;
                        else
                            a[i]==(i+1)/2;}
endclass

    module ex2();

        trans t1;

        initial
            begin
                t1 = new();
                assert(t1.randomize());
                $display("\n\n");
                $write("required pattern is :");
                foreach(t1.a[i])
                $write("%d",t1.a[i]);
                $display("\n\n");
           end
             endmodule

