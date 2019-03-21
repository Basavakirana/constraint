class trans;
    rand byte counter;
//    constraint c1 {counter inside {[1:3]};}
endclass

class trans1 extends trans;
    
    covergroup count_coverage;
        
            count: coverpoint counter{
                            bins specific_values[] ={1,6,7};
                            bins exclude[] = default;}
    endgroup
            constraint c1 {counter inside {[1:3]};}
           
 //   endgroup;

    function new();
        count_coverage = new();
    endfunction

endclass

    module ex23vp();

        trans1 t1;

        initial
            begin
                t1 = new();
                repeat(5)
                    begin
                        assert(t1.randomize());
                        t1.count_coverage.sample();
                        $display("coverage is=%d",t1.counter);
                        end
                        end
                        endmodule

