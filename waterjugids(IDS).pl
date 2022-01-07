%this is code for prolog to solve water jug problem 
%You are given two jugs, a 4-gallon one and a 3-gallon one. Neither has any measuring markers on it.
%There is a tap that can be used to fill the jugs with water. 
%How can you get exactly 2 gallons of water into the 4-gallon jug?

ids(Node,Sol,D,_):- depthlimitedfirst(Node,Sol,D),!.                %we have limit in our code(limit of how much deep we can go
ids(Node,Sol,D,Limit):- D1 is D+1,D1<Limit,ids(Node,Sol,D1,Limit).  %this is our code to build it iterative deeping search(IDS)

depthlimitedfirst(Node,[Node],_):- goal(Node), !.
depthlimitedfirst(Node,[Node|Sol],Maxdepth):-
	Maxdepth>0,
	s(Node,Node1),
	Max1 is Maxdepth-1,
	depthlimitedfirst(Node1,Sol,Max1).
  
  
goal([_,2]).                                                      %this is our goal to set

s( [0, L2] , [3, L2)).			%'fill pitcher1' 
s( [L1, 0] , [L1, 4]).                  %'fill pitcher2'
s( [L1, L2], [0, L2]) :- L1 > 0.          %'empty pitcher1'
s( [L1, L2], [L1, 0]) :- L2 > 0.         % 'empty pitcher2'

s( [L1, L2], [L3, 4]) :-
 L1 > 0 ,
 L2 < 4 ,
 L2+L1 >= 4 ,
 L3 is L1-(4-L2).
%'pitcher1 to pitcher2'
s( [L1, L2], [0, L4]) :-
 L1 > 0 ,
 L2 < 4 ,
 L2+L1 < 4,
 L4 is L2+L1.
%'pitcher1 to pitcher2'
                                                                                    
s( [L1, L2], [3, L4]) :- 
 L2 > 0 ,
 L1 < 3 ,
 L1+L2 >= 3 ,
 L4 is L2-(3-L1).
%'pitcher2 to pitcher1'
s( [L1, L2], [L3, 0]) :- 
L2 > 0 , 
L1 < 3 , 
L1+L2 < 3  , 
L3 is L1+L2.
%'pitcher2 to pitcher1'

%if we ask prolog below question .we can see our solution
%ids([0,0],Sol,1,50),print(Sol),nl.
%and this is our solution Sol = [[0, 0], [0, 4], [3, 1], [0, 1], [1, 0], [1, 4], [3, 2]]

