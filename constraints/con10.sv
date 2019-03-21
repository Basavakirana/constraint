// calling function inside constraint



class packet;
    rand bit[3:0]s_addr;
    rand bit[3:0]e_addr;
    constraint valid_addr {e_addr==addr_calc(s_addr);}

    function bit[3:0] addr_calc(bit[3:0]s_addr);
        if(s_addr>8)
            addr_calc=0;
            else
                addr_calc = s_addr +2;
    endfunction
endclass

    module con10();

    packet p1;

    initial
        begin
            p1 = new();
            repeat(5)
                begin
                    assert(p1.randomize);
                    $display("start_addr =%d,end_addr = %d",p1.s_addr,p1.e_addr);
                end
         end
   endmodule

