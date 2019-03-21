interface MemoryInterface;
   logic [31:0] address;
   logic [7:0] data;
endinterface

class trans;

       rand bit [31:0] address;
       rand bit [7:0] data;
      constraint c_memory {
                address inside {[32'h0000_0000:32'hFFFF_FFFF]};
                    data inside {[0:255]};
                      }
endclass

    module ex26vp();

        trans t1;
 //       memoryInterface DUV_IF();

        initial
            begin
                t1 = new();
                assert(t1.randomize());
                $display("address is%d,data is%d",t1.address,t1.data);
            end
     endmodule
    
      
