datatype 'a inf_list = lcons of 'a * (unit -> 'a inf_list);


fun church(n) = let fun thk() = church("(f " ^ n ^ ")")              
                  in lcons("Lf.Lx.(f " ^n^")" , thk)
              end;


fun take(0, _) = []
  | take(n, lcons(x, thk)) = x :: take(n-1, thk());
