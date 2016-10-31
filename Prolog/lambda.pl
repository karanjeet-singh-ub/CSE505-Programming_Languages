/*taken from lecture slide*/

occurs_free_in(X, v(X)).
occurs_free_in(X, l(Y,T)) :- X \== Y, occurs_free_in(X, T).
occurs_free_in(X, a(T1,T2)) :- occurs_free_in(X, T1); occurs_free_in(X, T2).

abst(l(_,_)).

/* beta redex*/
is_beta(a(T1,T2)):- abst(T1);is_beta(T1);is_beta(T2).
is_beta(l(_,T)):- is_beta(T).


/*eta redex*/
is_eta(l(X,a(T,v(X)))):- \+occurs_free_in(X, T);is_eta(T).
is_eta(l(_, T)):- is_eta(T).
is_eta(a(T1,T2)):- is_eta(T1);is_eta(T2).

/*reducible*/
reducible(Input):- is_beta(Input);is_eta(Input).

/*norm*/
norm(T):- \+is_beta(T),\+is_eta(T).




