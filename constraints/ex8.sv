//non concecutive ones


class trans;
    rand bit[5:0]value;
    constraint c1 {foreach(value[i]) {
                if(value[i]==1 && value[i]<15)
                    value[i+1]==0
    ;}}
endclass

    module ex8();

        trans t1;

        initial
            begin
                t1 = new();
                repeat(10)
                    begin
                        assert(t1.randomize());
                        $display("value is %b",t1.value);
                    end
            end
    endmodule
