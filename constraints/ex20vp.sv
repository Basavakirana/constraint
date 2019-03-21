module top;

    class transaction;
        rand real temperature;
        constraint c1 {soft temperature inside {[0:100]};}
    endclass

    transaction t1;

    initial begin
        t1 = new();
        repeat(10)
        begin
        assert(t1.randomize() with {temperature < 500;});
        $display("temp is %f celsius",t1.temperature);
        end
    end
    endmodule
