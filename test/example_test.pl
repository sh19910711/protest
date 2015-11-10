:- include('../protest.pl').

test_foo.
test_bar.

test_true :-
  assert_true(1 == 1).

test_false :-
  assert_false(1 == 2).

not_test :-
  write('this is not a test case').

test_equal :-
  assert_equal(1, 1).

test_not_equal :-
  assert_not_equal(1, 2).

test_not_found :-
  assert_raise(not_found('foo')).
