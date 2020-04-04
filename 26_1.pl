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

pr3_2:-read(N),read_list(A,N),read(Ind), el_by_number(A,Ind,El), write(El).

el_by_number(A,Ind,El):-el_by_number(A,1,Ind,El).
el_by_number([],_,_,nil):-!.
el_by_number([El|_],Ind,Ind,El):-!.
el_by_number([_|T],I,Ind,El):-I1 is I+1,el_by_number(T,I1,Ind,El).

pr3_6:- read(N),read_list(A,N),reverse(A,B),write_list(B).

reverse(A,B):-reverse(A,[],B).
reverse([],B,B):-!.
reverse([H|T],List,B):-reverse(T,[H|List],B).

read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).


pr5_1:-read_str(A,N),write_str(A),write(", "),write_str(A),write(", "),
					 write_str(A),write(", "),write(N).
					 
					 
pr5_2:-read_str(A,N),count_words(A,K),write(K).

count_words(A,K):-count_words(A,0,K).

count_words([],K,K):-!.
count_words(A,I,K):-skip_space(A,A1),get_word(A1,Word,A2),Word \=[],I1 is I+1,count_words(A2,I1,K),!.
count_words(_,K,K).

skip_space([32|T],A1):-skip_space(T,A1),!.
skip_space(A1,A1).

get_word([],[],[]):-!.
get_word(A,Word,A2):-get_word(A,[],Word,A2).

get_word([],Word,Word,[]).
get_word([32|T],Word,Word,T):-!.
get_word([H|T],W,Word,A2):-append(W,[H],W1),
							get_word(T,W1,Word,A2).
							


get_words(A,Words,K):-get_words(A,[],Words,0,K).

get_words([],B,B,K,K):-!.
get_words(A,Temp_words,B,I,K):-
	skip_space(A,A1),get_word(A1,Word,A2),Word \=[],
	I1 is I+1,append(Temp_words,[Word],T_w),get_words(A2,T_w,B,I1,K),!.
get_words(_,B,B,K,K).

pr5_3:-read_str(A,N),get_words(A,Words,K),write_list_str(Words).

write_list_str([]):-!.
write_list_str([H|T]):-write_str(H),nl,write_list_str(T).

%1. Uniq_el(A,B) В элементы списка А без повторов
%2. count(El,List,Count) сколько раз El в списке
%3. номер минимального элемента списка (нумерация с 1).

pr5_5:-	see('c:/Prolog/26_1_Prolog_F/1111.txt'),read_str(X,N),seen,
		tell('c:/Prolog/26_1_Prolog_F/111.txt'), write(X),nl,write(N),told.








						
						


