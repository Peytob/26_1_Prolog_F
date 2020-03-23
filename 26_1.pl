man(anatoliy).
man(dimitriy).
man(vladimir).
man(zahar).
man(artem).
woman(vera).
woman(fjokla).
woman(dasha).
woman(liza).
woman(lida).
reb(dimitriy,anatoliy).
reb(dimitriy,vera).
reb(vladimir,anatoliy).
reb(vladimir,vera).
reb(zahar,fjokla).
reb(zahar,dimitriy).
reb(dasha,fjokla).
reb(dasha,dimitriy).
reb(liza,lida).
reb(liza,vladimir).
reb(artem,lida).
reb(artem,vladimir).
son(X,Y):-reb(X,Y),man(X).
doch(X,Y):-reb(X,Y),woman(X).
/*bro(X,Y):- */
    /* Y bro for X*/
bro(X,Y):-reb(X,Z),!,reb(Y,Z),X\=Y,man(Y),!.
sister(X,Y):-reb(X,Z),!,reb(Y,Z),X\=Y,woman(Y),!.
br_s(X,Y):-bro(X,Y),!.
br_s(X,Y):-sister(X,Y).
max_2(X,Y,X):- X>Y,!.
max_2(_,Y,Y).
max_3(X,Y,U,Z):-max_2(X,Y,T),max_2(T,U,Z).

max_4(X,Y,U,X):-X>Y,X>U,!.
max_4(_,Y,U,Y):-Y>U,!.
max_4(_,_,U,U).

fact(X,_):-X<0,write("TI NE HOROSHIY"),!,fail.
fact(0,1):-!.
fact(N,F):-N1 is N-1,fact(N1,F1),F is N*F1.

fact1(X,N):-fact1(X,0,1,N).
fact1(X,X,F,F):-!.
fact1(X,K,F,N):-K1 is K+1,F1 is F*K1,fact1(X,K1,F1,N).

fibchik(1,1):-!.
fibchik(2,1):-!.
fibchik(N, X):- N1 is N - 1, N2 is N - 2, fibchik(N1, X1), fibchik(N2, X2), X is X1 + X2.

fib(N,X):-fib(1,1,2,N,X).
fib(_,F,N,N,F):-!.
fib(A,B,K,N,X):-C is A+B, K1 is K+1,fib(B,C,K1,N,X).

pr(X):-pr(2,X).
pr(X,X):-!.
pr(K,X):- Ost is X mod K, Ost=0,!,fail.
pr(K,X):-K1 is K+1,pr(K1,X).

n_pr(X,N):-n_pr(X,X,N).
n_pr(X,K,K):-Ost is X mod K,Ost=0,pr(K),!.
n_pr(X,K,N):- K1 is K-1, n_pr(X,K1,N).

pr3_1:-read(N),read_list(A,N),sum_list(A,Sum),write(Sum).

read_list(A,N):-read_list([],A,0,N).
read_list(A,A,N,N):-!.
read_list(List,A,I,N):-	I1 is I+1,read(X),append(List,[X],List1),
						read_list(List1,A,I1,N).

sum_list(A,Sum):-sum_list(A,0,Sum).
sum_list([],Sum,Sum):-!.
sum_list([H|T],S,Sum):-S1 is S+H,sum_list(T,S1,Sum).

pr3_2:-read(N),read_list(A,N),el_by_number(A,Ind,El),write(El).
el_by_number(A,Ind,El):-el_by_number(A,1,Ind,El).
el_by_number([El|_],Ind,Ind,El):-!.
el_by_number([_|T],I,Ind,El):-I1 is I+1,el_by_number(T,I1,Ind,El).

						
						


