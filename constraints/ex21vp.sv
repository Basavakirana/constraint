module top();

    class transaction;
        rand bit a;
        bit b;
        constraint c1 {(a==1)->(b==0);}
        constraint c2 {a dist {1:=90,0:=10};}
   endclass

   transaction t1;

   initial begin
        t1 = new();
        repeat(10)
        begin
//        t1.a = 1'b1;
        assert(t1.randomize());
        $display("a is %d,b is %d",t1.a,t1.b);
        end
   end
endmodule

