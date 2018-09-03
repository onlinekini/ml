use "hw2.sml";

val happy_path = all_except_option("Fred", ["Fred","Fredrick","NONFred"]);
val not_exist = all_except_option("Fre", ["Fred","Fredrick","NONFred"]);
val only_exit = all_except_option("Fred", ["Fred"]);



get_substitutions1([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], "Fred");
get_substitutions1([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], "Betty");
get_substitutions1([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], "F");
get_substitutions1([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]],"Jeff");



similar_names([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]],{first="Fred", middle="W", last="Smith"});

card_color (Clubs, King);
card_color (Spades, Queen);
card_color (Hearts, Queen);

card_value (Hearts, Num (8));
card_value (Hearts, King);
card_value (Hearts, Ace);
card_value (Hearts, Queen);


same_card ((Clubs, Jack), (Clubs, Jack));
same_card ((Clubs, Jack), (Spades, Jack));



contains_card((Clubs, Num(10)), [(Clubs, Jack), (Spades, Jack),(Hearts, King), (Clubs, Num(10))]);
contains_card((Clubs, Num(8)), [(Clubs, Jack), (Spades, Jack),(Hearts, King), (Clubs, Num(10))]);
contains_card((Clubs, Jack), [(Clubs, Jack), (Spades, Jack),(Hearts, King), (Clubs, Num(10))]);

exception no_card;

val remove_card_happy = remove_card([(Clubs, Jack), (Spades, Jack),(Hearts, King), (Clubs, Num(10))], (Clubs, Jack), no_card);
val remove_card_multi = remove_card([(Clubs, Jack), (Spades, Jack), (Clubs, Jack), (Hearts, King), (Clubs, Num(10))], (Clubs, Jack), no_card);
(*val remove_card_err = remove_card((Clubs, Num(8)), [(Clubs, Jack), (Spades, Jack),(Hearts, King), (Clubs, Num(10))], no_card);*)

all_same_color([(Clubs, Jack), (Spades, Jack)]);
all_same_color([(Clubs, Jack), (Spades, Jack), (Hearts, King)]);
all_same_color([(Clubs, Jack), (Spades, Jack), (Clubs, King)]);

sum_cards([(Clubs, Num (8)), (Clubs, King), (Clubs, Ace), (Clubs, Queen)]);
val reuse_sum = sum_cards([(Clubs, Num (5)), (Clubs, King), (Clubs, Queen), (Clubs, Jack)]);


val score1 = score([(Clubs, Num (5)), (Clubs, King), (Clubs, Queen), (Clubs, Jack)], 40);
val score2 = score([(Clubs, Num (5)), (Clubs, King), (Clubs, Queen), (Clubs, Jack)], 32);
