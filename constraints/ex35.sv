class trans;

    rand reg phone_no[];
    typedef enum{India,USA,Canada}country_c;
    rand country_c country;

    constraint c1 {country dist{India:=50,USA:=25,Canada:=25};}
    constraint c2 {foreach(phone_no[i]){
                    if(i==0 & country==India)
                     phone_no[i] inside {6,7,8,9};
                   else if(i==0 & country==USA)
                    phone_no[i] inside {3,4,5};
                   else if(i==0 & country==Canada)
                    phone_no[i] inside {1,2};}}
    constraint c3 {phone_no.size()==10;}
//    constraint c4 {phone_no[1:9] inside {[0:9]};}

    function void post_randomize();
        if(country==India)
        begin
            $display("country=%s",country.name);
            $write("+91-");
            foreach(phone_no[i])
            begin
//                $write("+91-");
                $write("%d",phone_no[i] );
            end
        end  
        else if(country==USA)
        begin
            $display("country=%s",country.name);
            $write("+22-");
            foreach(phone_no[i])
            begin
//                $write("+22-");
                $write("%d",phone_no[i] );
            end
        end
        else
        begin
            $display("country=%s",country.name);
            $write("+33-");
            foreach(phone_no[i])
            begin
//               $write("+33-");
                $write("%d",phone_no[i] );
            end
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
                 $display();
            end
    endmodule
