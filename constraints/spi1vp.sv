class spi_trans;

    rand bit[1:0]mode;
    rand bit cpol;
    rand bit cpha;
    rand bit[7:0] data;
    rand bit [7:0]clk_pattern;
    rand bit [7:0]data_pattern;
    constraint c1 {if(mode==2'b00)
                    (cpol==0 && cpha==0);
                   else if(mode==2'b01)
                       (cpol==0 && cpha==1);
                   else if(mode==2'b10)
                       (cpol==1 && cpha==0);
                    else
                        (cpol==1 && cpha==1);}
 
    constraint c2 {foreach(clk_pattern[i]){
                    if(cpol==0)
                        clk_pattern[i]==(i%2==0)?0:1;
                    else
                        clk_pattern[i]==(i%2==0)?1:0;}}

    constraint c3 {foreach(data_pattern[i]){
                    if((cpol==0 && cpha==0) || (cpol==1 && cpol==1))
                        data_pattern[i]==((i%2==0)?data[i]:(~data[i]));
                    else
                        data_pattern[i]==((i%2==0)?(~data[i]):data[i]);}}

    constraint c4 {data inside{[1:100]};}

endclass

    module spi1();

        spi_trans t1;

        initial
            begin
                t1 = new();
                $display("\n");
                repeat(5)
                    begin
                        assert(t1.randomize());
                        $display("spi transactions are");
                        $display("  cpol=%d,cpha=%d\n  mode=%d\n  clk_pattern=%b\n  data_pattern=%b\n  data=%d",t1.cpol,t1.cpha,t1.mode
                                ,t1.clk_pattern,t1.data_pattern,t1.data);
                        $display("\n");
                    end
            end
     endmodule
