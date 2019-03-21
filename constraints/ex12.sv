//  generate unique values without using unique keyword



class trans;

    rand int a[$];
    constraint c1 {a.size() inside {[10:20]};
                    foreach(a[i]){
                        a[i] inside {[1:10]}}
                        ;}
    constraint c2 {foreach(a[i]){
                    foreach(a[j]){
                        if(i!=j)
                            a[i]!=a[j];}}
                            }
endclass

    module ex12();

        trans t1;

        initial
            begin
                t1 = new();
                repeat(10)
                    begin
                        assert(t1.randomize);
                        $display("size of a=%d, a=%p",t1.a.size(),t1.a);
                    end
             end
      endmodule

