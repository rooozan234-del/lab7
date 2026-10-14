% ARTI 303 - Lab 7, Part 2: List Tasks
% Intended mode: a known element and a known finite list, with Result free.

% Task 1: remove every occurrence of X, preserving the other items' order.
deleteElement(_, [], []).
deleteElement(X, [X|Tail], Result) :-
    !,
    deleteElement(X, Tail, Result).
deleteElement(X, [Head|Tail], [Head|Result]) :-
    deleteElement(X, Tail, Result).

% Task 2: add X at the end using recursion.
add_at_the_end(X, [], [X]).
add_at_the_end(X, [Head|Tail], [Head|Result]) :-
    add_at_the_end(X, Tail, Result).

/*
TASK 1 - TEST QUERIES AND RESULTS

1. Many occurrences, matching the lab example:
?- deleteElement(1, [1,2,1,4,3,4,1,1,1,3,4,2,1,1,1], List).
List = [2,4,3,4,3,4,2].

2. Remove every 3, matching the lab example:
?- deleteElement(3, [1,2,1,4,3,4,1,1,1,3,4,2,1,1,1], List).
List = [1,2,1,4,4,1,1,1,4,2,1,1,1].

3. Element appears once:
?- deleteElement(3, [1,2,3,4], List).
List = [1,2,4].

4. Element does not appear:
?- deleteElement(9, [1,2,3], List).
List = [1,2,3].

5. Empty list:
?- deleteElement(1, [], List).
List = [].

6. All elements match:
?- deleteElement(a, [a,a,a], List).
List = [].

7. Check that there is only one answer:
?- findall(R, deleteElement(1, [1,2,1,3,1], R), Results).
Results = [[2,3]].

TASK 2 - TEST QUERIES AND RESULTS

1. Numbers, matching the lab example:
?- add_at_the_end(5, [1,2,3,4], List).
List = [1,2,3,4,5].

2. Atoms, matching the lab example:
?- add_at_the_end(d, [a,b,c], List).
List = [a,b,c,d].

3. Empty list:
?- add_at_the_end(x, [], List).
List = [x].

4. An existing value can be added again:
?- add_at_the_end(a, [a,b], List).
List = [a,b,a].

5. A nested list is added as a single element:
?- add_at_the_end([b,c], [a], List).
List = [a,[b,c]].
*/
