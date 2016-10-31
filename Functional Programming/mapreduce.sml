Control.Print.printDepth := 10;
datatype 'a ntree = leaf of 'a | node of 'a ntree list;

fun map(f, [ ]) =[ ]
| map(f, x::t) = f(x) :: map(f, t);

fun reduce(f, b, [ ]) = b
| reduce(f, b, x::t) = f(x, reduce(f, b, t));

val leaves = [];

fun subst(node(head::tail),v1,v2) =

                   let fun toMap(leaf x) = if(x = v1) then leaf v2
                                                      else leaf x

                                         | toMap(node(head::tail)) = node(map(toMap,head::tail));
                   in toMap(node(head::tail)) 
                   end;



fun funListOfLeaves(node([])) = leaves
  | funListOfLeaves(leaf x) = [leaf x]@leaves
  | funListOfLeaves(node(head::tail)) = funListOfLeaves(head)@funListOfLeaves(node(tail));

fun joinString(leaf m, n: string) = m^" "^n;

fun toString(node(head::tail)) = 
    reduce(joinString, "", funListOfLeaves(node(head::tail)))


