class dma_trans;

    rand int transfer_size;
    rand int start_address;
    constraint c1 {transfer_size inside {[1:256]};}
    constraint c2 {start_address % transfer_size==0;}
    constraint c3 {start_address inside {[0:1000]};}

endclass

    module dma1();

        dma_trans t1;

        initial
            begin
                t1 = new();
                $display("\n");
                repeat(10)
                    begin
                        assert(t1.randomize());
                        $display("tranfer_size=%d,start_address=%d",t1.transfer_size,t1.start_address);
                    end
             end
    endmodule
