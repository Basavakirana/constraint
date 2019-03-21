class trans;

    rand int x;
    constraint c1 {if (x<0)
                    -x<10;
                  else
                      x>100;}

  //   function int abs(input int x);
  //     if (x < 0)
  //       abs = -x;
  //     else
  //       abs = x;
 //    endfunction

endclass

//class trans1 extends trans;
//    constraint c1 {if(x>=0){
//                    x>100;}}

//endclass

    module ex24vp();

        trans t1;

        initial
            begin
                t1 = new();
                t1.x = -3;
                repeat(10)
                    begin
                        assert(t1.randomize());
                        $display("absolute value of %d",t1.x);
                    end
            end
            endmodule
