// scope randomization


module con11();

    int a, b;
    bit success;

    initial
        begin
            success = std::randomize(a,b) with{a>10;a<20;b>30;b<40;};
            $display("a =%d,b =%d",a,b);
        end
endmodule
