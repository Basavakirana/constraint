// 



class trans;

    rand enum{write,read,no_operation,clear}opcode;
    rand bit[7:0]addr;
    constraint c1 {opcode dist {write:=80,read:=10,no_operation:=0,clear:=10};}
    constraint c2 {opcode == write -> {addr % 4==0};}
    constraint c3 {addr inside {[12:40]};}

endclass

    module ex17();

        trans t1;

        initial
            begin
                t1 = new();
            //    t1.opcode = write;
                repeat(50)
                    begin
                        assert(t1.randomize());
                        $display("%s : %d,addr=%d",t1.opcode.name,t1.opcode,t1.addr);
                    end
             end
      endmodule
