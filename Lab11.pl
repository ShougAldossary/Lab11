
:- dynamic letter/1.

start :-
    retractall(letter(_)),
    assertz(letter(a)),
    assertz(letter(b)),
    assertz(letter(c)),
    write('Hi, This is the "Name Game".'), nl,
    write('You will be given a set of English letters in which you will add, delete or move to create your name.'), nl,
    menu.

menu :-
    nl,
    write('Choose from the following:'), nl,
    write('1- Display the current set of letters'), nl,
    write('2- Add a letter'), nl,
    write('3- Add a letter at the top'), nl,
    write('4- Add a letter at the bottom'), nl,
    write('5- Delete a letter'), nl,
    write('6- Delete all letters'), nl,
    write('7- Exit'), nl,
    write('Enter your choice....'), nl,
    read(Choice),
    action(Choice).

action(1) :-
    !,
    findall(L, letter(L), Letters),
    write(Letters), nl,
    menu.
action(2) :-
    !,
    write('Enter the letter you want to add: '),
    read(L),
    assert(letter(L)),
    write('The letter has been added'), nl,
    menu.
action(3) :-
    !,
    write('Enter the letter you want to add: '),
    read(L),
    asserta(letter(L)),
    write('The letter has been added'), nl,
    menu.
action(4) :-
    !,
    write('Enter the letter you want to add: '),
    read(L),
    assertz(letter(L)),
    write('The letter has been added'), nl,
    menu.
action(5) :-
    !,
    write('Enter the letter to delete: '),
    read(L),
    delete_letter(L),
    menu.
action(6) :-
    !,
    retractall(letter(_)),
    write('All letters have been deleted'), nl,
    menu.
action(7) :-
    !,
    write('Goodbye!'), nl.
action(_) :-
    write('Invalid choice, please enter a number from 1 to 7'), nl,
    menu.

delete_letter(L) :-
    retract(letter(L)),
    !,
    write('The letter has been deleted'), nl.
delete_letter(_) :-
    write('The letter was not found'), nl.

% RUN
% ?- start.
% Hi, This is the "Name Game".
% You will be given a set of English letters in which you will add, delete or move to create your name.
%
% Choose from the following:
% 1- Display the current set of letters
% 2- Add a letter
% 3- Add a letter at the top
% 4- Add a letter at the bottom
% 5- Delete a letter
% 6- Delete all letters
% 7- Exit
% Enter your choice....
% |: 1.
% [a,b,c]
%
% Choose from the following:
% 1- Display the current set of letters
% 2- Add a letter
% 3- Add a letter at the top
% 4- Add a letter at the bottom
% 5- Delete a letter
% 6- Delete all letters
% 7- Exit
% Enter your choice....
% |: 3.
% Enter the letter you want to add: |: s.
% The letter has been added
%
% Choose from the following:
% 1- Display the current set of letters
% 2- Add a letter
% 3- Add a letter at the top
% 4- Add a letter at the bottom
% 5- Delete a letter
% 6- Delete all letters
% 7- Exit
% Enter your choice....
% |: 4.
% Enter the letter you want to add: |: m.
% The letter has been added
%
% Choose from the following:
% 1- Display the current set of letters
% 2- Add a letter
% 3- Add a letter at the top
% 4- Add a letter at the bottom
% 5- Delete a letter
% 6- Delete all letters
% 7- Exit
% Enter your choice....
% |: 5.
% Enter the letter to delete: |: b.
% The letter has been deleted
%
% Choose from the following:
% 1- Display the current set of letters
% 2- Add a letter
% 3- Add a letter at the top
% 4- Add a letter at the bottom
% 5- Delete a letter
% 6- Delete all letters
% 7- Exit
% Enter your choice....
% |: 5.
% Enter the letter to delete: |: c.
% The letter has been deleted
%
% Choose from the following:
% 1- Display the current set of letters
% 2- Add a letter
% 3- Add a letter at the top
% 4- Add a letter at the bottom
% 5- Delete a letter
% 6- Delete all letters
% 7- Exit
% Enter your choice....
% |: 1.
% [s,a,m]
%
% Choose from the following:
% 1- Display the current set of letters
% 2- Add a letter
% 3- Add a letter at the top
% 4- Add a letter at the bottom
% 5- Delete a letter
% 6- Delete all letters
% 7- Exit
% Enter your choice....
% |: 7.
% Goodbye!
