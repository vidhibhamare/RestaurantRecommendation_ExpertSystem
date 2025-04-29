% Show numbered options and get selected value
choose_from_list(Prompt, Options, Selected) :-
    write(Prompt), nl,
    print_options(Options, 1),
    read_line_to_string(user_input, IndexStr),
    number_string(Index, IndexStr),
    nth1(Index, Options, Selected).

print_options([], _).
print_options([H|T], N) :-
    format("~w. ~w~n", [N, H]),
    N1 is N + 1,
    print_options(T, N1).
