class emac_trans;

    typedef enum{unicast,multicast,broadcast,control}frametype_t;
    rand frametype_t frame_type;
    rand bit[15:0]frame_size;
    rand bit[47:0]src_mac;
    rand bit[47:0]dst_mac;
    rand bit[15:0]eth_type;
    rand bit[7:0]payload[];

    constraint c1 {if(frame_type==control)
                        frame_size==64;
                   else if(eth_type==16'h8100)
                        frame_size inside {[68:1522]};
                   else
                       frame_size inside {[64:1518]};}
    constraint c2 {frame_type dist {unicast:=50,multicast:=30,broadcast:=15,control:=5};}
    constraint c3 {if(frame_type==broadcast)
                        dst_mac==48'hFFFFFFFFFFFF;
                   else if(frame_type==multicast)
                        dst_mac[47:24]==24'h010005E;
                   else if(frame_type==unicast)
                        dst_mac[47]==0;}
    constraint c4 {payload.size()==frame_size - 18;}

endclass

    module emac1();

        emac_trans t1;

        initial
            begin
                t1 = new();
                repeat(5)
                    begin
                        assert(t1.randomize());
                        $display("\n");
                        $display("ethernet mac transactions are");
                        $display(" frame_type=%s\n frame_size=%d\n source_mac=%d\n dest_mac=%d\n ethernet_type=%d\n payload=%p"
                                 ,t1.frame_type.name,t1.frame_size,t1.src_mac,t1.dst_mac,t1.eth_type,t1.payload);
                        $display("\n");
                    end
             end
    endmodule
