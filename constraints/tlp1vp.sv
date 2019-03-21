class tlp_trans;

    typedef enum{mrd,mwr,cfgwr,cfgrd}tlptype_t;
    rand tlptype_t tlp_type;
    rand bit[9:0]length;
    rand bit[31:0]address;
    rand bit[31:0]data[];

    constraint c1 {length inside {[1:256]};}
    constraint c2 {address[1:0]==2'b00;}
    constraint c3 {if (tlp_type==mwr || tlp_type==cfgwr)
                        data.size()==length;
                    else
                        data.size()==0;}
    constraint c4 {if(tlp_type==cfgwr || tlp_type==cfgrd)
                        length inside {[1:4]};}
    constraint c5 {tlp_type dist {mwr:=40,mrd:=40,cfgwr:=10,cfgrd:=10};}
    constraint c6 {length !=0;}

endclass

    module tlp1();

        tlp_trans t1;

        initial
            begin
                t1 = new();
                repeat(5)
                    begin
                        assert(t1.randomize());
                        $display("\n");
                        $display("tlp transactions are");
                        $display(" tlp_type_state=%s\n tlp_type=%d\n length=%d\n address=%b\n data=%p",t1.tlp_type.name,t1.tlp_type,t1.length
                                ,t1.address,t1.data);
                        $display("\n");
                     end
             end
    endmodule

