datatype 'a tree = leaf | node of 'a * 'a tree * 'a tree;
Control.Print.printDepth := 10;


fun insert (i,leaf) = node(i , leaf , leaf)
   | insert (i , node(v, left , right)) =

                   let val nodeval = i
                       val center = v
                       val leftval = left
                       val rightval = right

                   in
                     if nodeval<center
                       then
                           node(center , insert(nodeval , left ) , right)

                       else
                           node( center , left , insert(nodeval , right))
                   end



fun testcase() =
        let
             val t1 = node(100,leaf,leaf);
             val t2 = insert(50, t1);
             val t3 = insert(150, t2);
             val t4 = insert(200, t3);
             val t5 = insert(125, t4);
             val t6 = insert(175, t5);
             val t7 = insert(250, t6);
             val t8 = insert(25, t7);
             val root = insert(75, t8)
         in
             root
       end


(*Dfirst function*)

fun dfirst2(node(v,t1,t2)) =
                    let
                       	val listTree = [node(v, t1, t2)];
                        val acc = []
                         
                    (*Helper function df*)
                        fun df([], acc) = acc
                             | df(node(v, leaf, leaf)::tl, acc) = df(tl, acc@[v])
                             | df(node(v, left , right)::fullList , acc)  = df (left::node(v, leaf, leaf)::right::fullList , acc)
                       in
                        df(listTree , acc)        
                     end


fun test_dfirst2() = dfirst2(testcase());
