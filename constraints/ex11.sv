// two queues A,B,C,D,E and P,Q,R then op should be AP,AQ,AR........EP,EQ,ER



class trans;

    typedef enum {a,b,c,d,e}state;
    string qa[$] = {"A","B","C","D","E"};
    string qb[$] = {"P","Q","R"};
    rand state ss;
    string out[$];
    constraint c1 {ss dist {a:=2,b:=2,c:=2,d:=2,e:=2};}

    function void post_randomize();
        case(ss)
            a : begin
                if(out.size()>3)
                    out.delete();
                for(int i=0;i<qb.size();i++)
                    begin
                        out.push_back({qa[0],qb[i]});
                    end
                    $display("size=%d,out=%p",out.size(),out);
                   // if(out.size()>2)
                    //    out.pop_front();
                    out.delete();
                end

            b : begin
                for(int i=0;i<qb.size;i++)
                    begin
                        out.push_back({qa[1],qb[i]});
                    end
                    $display("size=%d,out=%p",out.size(),out);
                 //   if(out.size()>2)
                 //       out.pop_front();
                    out.delete();
                end   

            c : begin
                for(int i=0;i<qb.size();i++)
                    begin
                        out.push_back({qa[2],qb[i]});
                    end
                    $display("size=%d,out=%p",out.size(),out);
                //    if(out.size()>2)
                //        out.pop_front();
                    out.delete();
                 end

             d : begin
                 for(int i=0;i<qb.size();i++)
                     begin
                        out.push_back({qa[3],qb[i]});
                     end
                     $display("size=%d,out=%p",out.size(),out);
                 //    if(out.size()>2);
                 //       out.pop_front();
                    out.delete();
                  end

              e : begin
                  for(int i=0;i<qb.size();i++)
                      begin
                        out.push_back({qa[4],qb[i]});
                      end
                      $display("size=%d,out=%p",out.size(),out);
                  //    if(out.size()>2)
                  //      out.pop_front();
                    out.delete();
                  end
           endcase
        
        endfunction
endclass

    module ex11();

    trans t1;

    initial
        begin
            t1 = new();
            repeat(5)
                begin
                    assert(t1.randomize());
                end
         end
    endmodule   

