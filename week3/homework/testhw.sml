use "hw2.sml";

all_except_option("Fred", ["Fred","Fredrick","NONFred"]);
get_substitutions1([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], "Fred");
get_substitutions1([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], "Betty");
get_substitutions1([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], "F");
get_substitutions1([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]],"Jeff");



similar_names([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]],{first="Fred", middle="W", last="Smith"});

card_color Clubs;
card_color Spades;

card_value (Num (8));
card_value King;
card_value Ace;
card_value Queen;


same_card ((Clubs, Jack), (Clubs, Jack));
same_card ((Clubs, Jack), (Spades, Jack));



contains_card((Clubs, Num(10)), [(Clubs, Jack), (Spades, Jack),(Hearts, King), (Clubs, Num(10))]);
contains_card((Clubs, Num(8)), [(Clubs, Jack), (Spades, Jack),(Hearts, King), (Clubs, Num(10))]);
contains_card((Clubs, Jack), [(Clubs, Jack), (Spades, Jack),(Hearts, King), (Clubs, Num(10))]);

exception no_card;

remove_card((Clubs, Jack), [(Clubs, Jack), (Spades, Jack),(Hearts, King), (Clubs, Num(10))], no_card);
(*remove_card((Clubs, Num(8)), [(Clubs, Jack), (Spades, Jack),(Hearts, King), (Clubs, Num(10))], no_card);*)

all_same_color([(Clubs, Jack), (Spades, Jack)]);
all_same_color([(Clubs, Jack), (Spades, Jack), (Hearts, King)]);
all_same_color([(Clubs, Jack), (Spades, Jack), (Clubs, King)]);

sum_cards([(Clubs, Num (8)), (Clubs, King), (Clubs, Ace), (Clubs, Queen)]);
val reuse_sum = sum_cards([(Clubs, Num (5)), (Clubs, King), (Clubs, Queen), (Clubs, Jack)]);


val score1 = score([(Clubs, Num (5)), (Clubs, King), (Clubs, Queen), (Clubs, Jack)], 40);
val score2 = score([(Clubs, Num (5)), (Clubs, King), (Clubs, Queen), (Clubs, Jack)], 32);
