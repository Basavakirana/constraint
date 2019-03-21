//   constraint for payload such that size should be randomly generated between 10 and 20
//     and each value of payload should be greater than the previous value by 2


class trans;

    rand logic[15:0]payload_data[];
    int que[$];
    constraint c1 {payload_data.size inside{[10:20]};
                    foreach(payload_data[i])
                        payload_data[i] inside {[1:500]};
                       }

    function void post_randomize();
        foreach(payload_data[i])
        begin
            $display("previous data=%d,payload size=%d",payload_data[i],payload_data.size());
            que.push_back(payload_data[i]);
            if(que.size()>0)
                begin
                    payload_data[i] = que.pop_front()*2;
                    $display("current data=%d [previous data *2]\n",payload_data[i]);
                end
       end
   endfunction
endclass

    module ex10();

        trans t1;

        initial
            begin
                t1 = new();
                repeat(10)
                    begin
                        assert(t1.randomize());
                    end
            end
    endmodule
