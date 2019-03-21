//testing 

class ahb_trans;

    parameter num_masters=8;

    rand bit[num_masters-1:0]hburst_req;
    rand bit[num_masters-1:0]hlock;
    rand bit[num_masters-1:0]hgrant;
    rand bit[3:0]hmaster;
    rand bit[3:0]hmaster_next;
    rand bit[7:0]request_duration;
    rand bit[1:0]arbitration_type;

    constraint c1 {hmaster < num_masters;
                   hmaster_next < num_masters;}
    constraint c2 {hburst_req !=0;}
    constraint c3 {hgrant !=0;
                    foreach(hgrant[i]){
                            hgrant[i] -> hburst_req[i];}
                    $countones(hgrant)==1;
                    }
    constraint c4 {foreach(hlock[i]){
                        hlock[i] -> hburst_req[i];}
                   $countones(hlock)<=2;
                    }
    constraint c5 {request_duration inside {[1:20]};
                   request_duration dist {[1:5]:=50,[6:10]:=40,[11:20]:=10};}
    constraint c6 {arbitration_type inside {0,1,2};
                   arbitration_type dist {0:=40,1:=40,2:=20};}
    constraint c7 {foreach (hlock[i]) {
                    if (i < num_masters/4)
                        hlock[i] dist {0 := 70, 1 := 30}; 
                    else
                        hlock[i] dist {0 := 95, 1 := 5};}
                    }
endclass

    module ahb1();

        ahb_trans t1;

        initial
            begin
                t1 =new();
                repeat(5)
                    begin
                        assert(t1.randomize());
                        $display("\n");
                        $display("apb transactions are");
                        $display(" hmaster=%d\n hmaster_next=%d\n hburst_req=%d\n hgrant=%d\n hlock=%d\n request_duration=%d\n arbitration_type=%d",t1.hmaster,t1.hmaster_next,t1.hburst_req,t1.hgrant,t1.hlock,t1.request_duration,
                                   t1.arbitration_type);
                        $display("\n");
                    end
            end
    endmodule
