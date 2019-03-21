class uart_trans;

    rand int baud_rate;
    rand bit parity_en;
    typedef enum {even,odd,mark,space,none}parity_e;
    rand parity_e parity_type;
    rand bit[7:0]data;

    constraint c1 {baud_rate inside {1200,2400,4800,9600,19200.38400,76800};}
    constraint c2 {baud_rate dist {[1200:9600]:=80,[19200:76800]:=20};}
    constraint c3 {parity_en dist{0:=20,1:=80};}
    constraint c4 {if(parity_en){
                    parity_type dist{even:=45,odd:=45,mark:=5,space:=5};}
                   else{
                     parity_type ==none;}}
    constraint c5 {data inside {[1:160]};}

endclass

    module uart1();

        uart_trans t1;

        initial
            begin
                t1 = new();
                $display("\n");
                repeat(5)
                    begin
                        assert(t1.randomize());
                        $display("uart transactions are");
                        $display(" baud_rate=%d\n parity_enable=%d\n parity_type=%s\n data=%d",t1.baud_rate,t1.parity_en,t1.parity_type.name
                                ,t1.data);
                        $display("\n");
                    end
            end
    endmodule
