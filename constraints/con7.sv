//  distribution constraint



class trans;
    rand int tag;
    constraint tag1 {tag dist {7:=5,[11:20]:=3,[21:26]:/5};}
endclass

    module con();

        trans t1;

        initial
            begin
                t1 = new();
                assert(t1.randomize());
                $display("tag no is %d",t1.tag);
            end
    endmodule
