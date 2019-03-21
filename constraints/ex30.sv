/*generate pattern 1111111111
                   1000000001
                   1000000001
                   1000000001
                   1000000001
                   1000000001
                   1000000001
                   1000000001
                   1000000001
                   1111111111   */

class trans;

    rand int a[10][10];
    constraint c1 {foreach(a[i,j]){
                   if((i==0 && j<=9)||(i==9 && j<=9)||(j==0 && i>0 && i<9)||(j==9 && i>0 && i<9))
                        a[i][j]==1;
                    else
                        a[i][j]==0;}}

    function void post_randomize();
        foreach(a[i,j])
        begin
            $write("%d",a[i][j]);
            if(j==9)
                $display();
        end
    endfunction

endclass

    module ex30();

        trans t1;

        initial
            begin
                t1 = new();
                assert(t1.randomize());
            end
     endmodule
                   
