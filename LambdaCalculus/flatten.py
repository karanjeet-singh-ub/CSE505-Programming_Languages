def flatten(l):
	for x in l:
		if isinstance(x, list):
			for x in flatten(x):
				yield x
		else:
			yield x



# part a:

# This cannot be done in Standard ML as the types wont match up for the built in list types.

# Example: 'a list list -> 'a list,
# We can apply recursive computation until it reaches a base case of a non-nested list, but,
# wont be able to detect the base case in any way, leaving the types mismatched.

# You could, however, do it if you created your own list type:
# datatype 'a nestableList = Cons of 'a * 'a nestableList
#                          | NCons of 'a nestableList * 'a nestableList
#                          | Nil;
# Here, Cons and Nil would work the same as :: and [], while NCons would allow for nested list building.

# As an example:

# (* The list [[[1],[2]],[[3]],[[4,5],[6]]] *)
# val nlist = NCons(
#               Cons(1, Cons(2, Nil)),
#               NCons(
#                 NCons(
#                   Cons(3, Nil),
#                   Cons(4, Cons(5, Cons(6, Nil)))
#                 ),
#                 Nil
#               )
#            );

# We could then flatten this nested list type like this:

# fun flatten nls =
# let
#   fun flatten_ Nil                 = []
#     | flatten_ (NCons(head, tail)) = flatten head @ flatten tail
#     | flatten_ ( Cons(head, tail)) = head :: flatten tail
# in
#     flatten_ nls
# end;

# Which then could be used like this

# val flattenedNlist = flatten nlist;     (* Yields [1, 2, 3, 4, 5, 6] *)