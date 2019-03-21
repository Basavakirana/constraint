class i2c_trans;

    rand bit is_master;       //1 master
    rand bit[6:0]slave_address;
    rand bit read_write;      //1 read
    rand bit[7:0]data[];
    rand bit ack[];         //0 ack

    constraint c1 {is_master dist {1:=80,0:=20};}
    constraint c2 {slave_address inside{[8:119]};}
//    constraint c5 {slave_address inside{![0:7]};}
//    constraint c6 {slave_address inside{![120:127]};}
    constraint c7 {read_write dist{0:=80,1:=20};}
   
    constraint c3 {data.size inside{[1:10]};
                   ack.size == data.size;}

    constraint c4 {     if(is_master){
                            if(read_write==1){
                                    foreach(ack[i]){
                                        if(i<data.size-1){
                                                ack[i] dist{0:=95,1:=5};
                                        }else{
                                            ack[i] dist{0:=55,1:=45};
                                        }
                                    }
                            }else{
                                    foreach(ack[i]){
                                            ack[i] dist{0:=90,1:=10};
                                    }
                                }
                            }else{
                                    if(read_write==0){
                                        foreach(ack[i]){
                                            ack[i]==0;}
                                    }else{
                                            foreach(ack[i]){
                                                ack[i] dist{0:=95,1:=5};}
                                    }
                            }
                    }  
endclass

    module i2c1();

        i2c_trans t1;

        initial
            begin
                t1 = new();
                $display("\n");
                repeat(5)
                    begin
                        assert(t1.randomize());
                        $display("i2c transaction are");
                        $display(" is_master=%d\n slave_address=%d\n read_write=%d\n ack=%p\n data=%p\n",t1.is_master,t1.slave_address
                        ,t1.read_write,t1.ack,t1.data);
                        $display("\n");
                    end
            end
    endmodule
