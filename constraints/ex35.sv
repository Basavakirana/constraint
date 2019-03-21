class trans;

    rand bit[9:0]phone_no;
    typedef enum{India,USA,Canada}country_c;
    rand country_c country;

    constraint c1 {country dist{India:=50,USA:=25,Canada:=25};}
    constraint c2 {if(country==India)
                    phone_no[9] inside {6,7,8,9};
                   else if(country==USA)
                    phone_no[9] inside {3,4,5};
                   else
                    phone_no[9] inside {1,2};}

    function void post_randomize();
        if(country==India)
        begin
            $display("country=%s",country.name);
            $write("+91-");
            $write("phone number=%d",phone_no);
        end  
        else if(country==USA)
        begin
            $display("country=%s",country.name);
            $write("+22-");
            $write("phone number=%d",phone_no);
        end
        else
        begin
            $display("country=%s",country.name);
            $write("+33-");
            $write("phone number=%d",phone_no);
        end
     endfunction

endclass

    module ex35();

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
