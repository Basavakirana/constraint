class packet;

    rand int length;
    rand bit type1;
    constraint c1 {length inside {[0:100]};}
    constraint c2 {if (length <= 20)
                      type1 dist {0:=80,1:=20};
                   else
                       type1 dist {0:=20,1:=80};}

endclass

    module ex25vp();

        packet t1;

        initial
            begin
                t1 = new();
                $display("\n");
                repeat(10)
                    begin
                        assert(t1.randomize());
                        $display("packet length=%d,packet type=%d",t1.length,t1.type1);
                    end
           end
    endmodule 
