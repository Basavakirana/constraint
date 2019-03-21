class trans;

    rand int arr [];
    constraint c1 {arr.size()==10;}
    constraint c2 {unique{arr};}
    constraint c3 {foreach(arr[i]){
                    arr[i] inside {[1:10]};}}
//    constraint c2 {foreach(arr[i]){
//                    foreach(arr[j]){
//                            if(i!=j)
//                                arr[i]!=arr[j];
//                    }}}
endclass

    module ex19vp();

        trans t1;
        
        initial
            begin
                t1 = new();
                $display("\n");
                repeat(10)
                    begin
                        assert(t1.randomize());
                        $display("arr=%p",t1.arr);
                    end
            end
     endmodule
