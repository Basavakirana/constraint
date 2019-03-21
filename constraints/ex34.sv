//generate phone no's if india +91 with starting no 6 to 9
        //            if usa +22 strating no 3 to 5
        //            if canada +33 starting no 1 to 2


class trans;

    typedef enum{india,usa,canada}phone;
    rand phone phone_no[];

    constraint c3 {phone_no.size()==10;}
    constraint c1 {if(phone_no==india)
                    foreach(phone_no[i])
                        if(i==0)
                            phone_no inside {[6:9]};
                   else if(phone_no==usa)
                     foreach(phone_no[i])
                        if(i==0)
                            phone_no[i] inside {[3:5]};
                   else
                     foreach(phone_no[i])
                        if(i==0)
                            phone_no[i] inside {[1:2]};}

    constraint c2 {phone_no dist {india:=50,usa:=25,canada:=25};}

    function void post_randomize();
        if(phone_no==india)
        begin
        foreach(phone_no[i])
        begin
            $display("%s",phone_no[i].name);
        end
            $write("+91-");
            foreach(phone_no[i])
                $write("%d",phone_no[i]);
        end
        else if(phone_no==usa)
        begin
        foreach(phone_no[i])
        begin
            $display("%s",phone_no[i].name);
        end
            $write("+22-");
            foreach(phone_no[i])
                $write("%d",phone_no[i]);
        end
        else
        begin
        foreach(phone_no[i])
        begin
            $display("%s",phone_no[i].name);
        end 
            $write("+33-");
            foreach(phone_no[i])
                $write("%d",phone_no[i]);
        end
    endfunction

endclass

    module ex34();

    trans t1;

    initial
        begin
            t1 = new();
            repeat(10)
            begin
                assert(t1.randomize());
            end
     endmodule

