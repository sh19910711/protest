:- include('../protest.pl').

test_square_2_8 :-
  ['square'],
  square(2, 8, Ret),
  write(Ret),
  assert_equal(Ret, 256).

test_square_3_3 :-
  ['square'],
  square(3, 3, Ret),
  write(Ret),
  assert_equal(Ret, 27).
