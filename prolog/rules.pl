:- consult(facts).

% Matches restaurant based on all user preferences
match_restaurant(Cuisine, Price, FoodType, MaxDistance, MinRating, PureVeg, Desserts, Name) :-
    restaurant(Name, Cuisine, Price, FoodType, Distance, Rating, PureVegFlag, DessertsFlag),
    Distance =< MaxDistance,
    Rating >= MinRating,
    PureVegFlag = PureVeg,
    (
        Desserts = any ;  % skip filtering if user doesnt care about Desserts
        Desserts = DessertsFlag
    ).

% Recommendation rule based on users preferences
recommend(Name, Cuisine, Budget, Type, Distance, Rating, Veg, Desserts) :-
    match_restaurant(Cuisine, Budget, Type, Distance, Rating, Veg, Desserts, Name).
