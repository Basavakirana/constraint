// condition implication and ifelse



class trans;
    rand int tag;
    bit mode;
    constraint tag1{mode==1'b1->tag<10;
                    mode==1'b0->tag>10;}

    /* if(mode==1)
            tag<10;
            else if (mode==0)
                tag>10;  */

endclass

    module con8();
        
        trans t1;

        initial
            begin
                t1 = new();
                assert(t1.randomize());
                $display("mode is %b,tag is %d",t1.mode,t1.tag);
            end
    endmodule
