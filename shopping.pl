% ARTI 303 - Lab 7, Part 1: Shopping Program
% Start with ?- shopping. or ?- menu.
% Enter every choice and item with a full stop: d. a. bread. e.

shopping :-
    menu([coffee, milk, chocolate, apple, juice]).

menu :- shopping.

menu(Basket) :-
    nl,
    write('** SHOPPING LIST **'), nl,
    write('d. Display all items.'), nl,
    write('a. Add an item to the list.'), nl,
    write('e. Exit.'), nl,
    write('ENTER YOUR CHOICE: '),
    read(Choice),
    action(Choice, Basket).

action(d, Basket) :-
    !,
    display_items(Basket),
    menu(Basket).

action(a, Basket) :-
    !,
    write('Enter the item you want to add: '),
    read(Item),
    ( Item == end_of_file ->
        write('Goodbye!'), nl
    ;
        NewBasket = [Item|Basket],
        write('The item has been added.'), nl,
        menu(NewBasket)
    ).

action(e, _) :-
    !,
    write('Goodbye!'), nl.

action(end_of_file, _) :-
    !,
    write('Goodbye!'), nl.

action(_, Basket) :-
    write('Invalid choice. Please enter d, a, or e.'), nl,
    menu(Basket).

% Recursive display: stop at the empty list.
display_items([]).
display_items([Item|Rest]) :-
    write(Item), nl,
    display_items(Rest).

/*
TEST 1 - DISPLAY THE INITIAL FIVE ITEMS
?- shopping.
Enter d.
Displayed items, in order:
coffee
milk
chocolate
apple
juice
The menu appears again. Enter e. to exit.

TEST 2 - ADD AND DISPLAY
?- shopping.
Enter a. then bread. then d.
Displayed items, in order:
bread
coffee
milk
chocolate
apple
juice
The menu appears again. Enter e. to exit.

TEST 3 - TWO ADDITIONS ARE KEPT DURING THE SESSION
?- shopping.
Enter a. then bread. then a. then eggs. then d.
Displayed items: eggs, bread, coffee, milk, chocolate, apple, juice.
Enter e. to exit.

TEST 4 - INVALID CHOICE
?- shopping.
Enter x.
Invalid choice. Please enter d, a, or e.
The menu appears again. Enter e. to exit.

TEST 5 - EMPTY LIST DISPLAY
?- display_items([]).
true.
No items are printed.

Each new call to shopping/0 starts a fresh basket of five items.
*/
