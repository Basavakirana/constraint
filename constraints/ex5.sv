//  constraints even no in odd locations and odd no in even location


class trans;
    
    rand bit[3:0]a[];
    int i;
    constraint c1 {a.size() inside {[15:20]};}
    constraint c2 {foreach (a[i]){
                    if(i%2==0)
                        a[i]%2==1;
                     else
                         a[i]%2==0;}
                         }

      function void current();
            $display("\n\t  size=%d  \n",a.size());
            foreach(a[i])
                if(i%2==0)
                    $write("index=%d [even location]",i);
                 else
                     $write("index=%d [odd location]",i);

                if(a[i]%2==0)
                    $display("value=%d [even no]",a[i]);
                 else
                     $display("value=%d [odd no]",a[i]);
       endfunction

endclass

    module ex5();

     //   int b;
        trans t1;

        initial
            begin
                t1 = new();
          //      repeat(10)
                begin
                assert(t1.randomize);
               t1.current();
               end
            end
     endmodule

