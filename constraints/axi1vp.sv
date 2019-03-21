class axi_trans;

    rand bit[7:0]burst_length;
    rand bit[1:0]burst_type;

    constraint c1 {burst_length inside{[1:250]};}
    constraint c2 {burst_type inside {0,1,2};}
    constraint c3 {if(burst_type==0){
                    burst_length dist{1:=30,[2:4]:=40,[5:16]:=20,[17:256]:=10};}
                   else if (burst_type==1){
                    burst_length dist{1:=10,[2:8]:=30,[9:16]:=30,[17:64]:=20,[65:256]:=10};}
                   //burst_length==(2**power)-1 ;
                   else if (burst_type==2){
                     burst_length inside {2,4,8,16};
                     burst_length dist{2:=25,4:=35,8:=25,16:=15};}}
    constraint c4 {burst_type dist {0:=20,1:=60,2:=20};}

endclass

    module axi1();

        axi_trans t1;

        initial
            begin
                t1 = new();
                $display("\n");
                repeat(10)
                    begin
                        assert(t1.randomize());
                        $display("burst_length=%d,burst_type=%d",t1.burst_length,t1.burst_type);
                    end
             end
     endmodule
