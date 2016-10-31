Control.Print.printDepth := 10;
datatype 'a tree = leaf | node of 'a * 'a tree * 'a tree;


val temp : int = 5;


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
