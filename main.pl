:- consult(utils).
:- consult(rules).

start :-
    write('--- Welcome to the Restaurant Recommender System ---'), nl,

    Cuisines = [indian, italian, mexican, japanese, american, continental, french, fusion, vegan, chinese, mediterranean, tibetan],
    choose_from_list('Select a cuisine:', Cuisines, Cuisine),

    Budgets = [low, medium, high],
    choose_from_list('Select your budget:', Budgets, Price),

    FoodTypes = [healthy, junk],
    choose_from_list('Select food type:', FoodTypes, FoodType),

    write('Maximum distance (in km): '), read_line_to_string(user_input, MaxDistStr), atom_number(MaxDistStr, MaxDist),
    write('Minimum rating (1 to 5): '), read_line_to_string(user_input, MinRatingStr), atom_number(MinRatingStr, MinRating),

    BoolOptions = [yes, no],
    choose_from_list('Should it be pure vegetarian?', BoolOptions, PureVeg),
    DessertsOptions = [yes, no, any],
    choose_from_list('Should it offer desserts?', DessertsOptions, Desserts),


    findall(Name, match_restaurant(Cuisine, Price, FoodType, MaxDist, MinRating, PureVeg, Desserts, Name), Matches),

    (
        Matches \= [] ->
            write('Matching restaurants:'), nl,
            print_matches(Matches)
        ;
            write('Sorry, no matching restaurant found.'), nl
    ).

print_matches([]).
print_matches([H|T]) :-
    write('- '), write(H), nl,
    print_matches(T).
