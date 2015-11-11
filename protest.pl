/*********************************
 protest - ver. 0.0.0
 | ?- Testing Framework for Prolog
**********************************/
%
% runner
%
run_tests :-
  asserta(count_(assert, 0)),
  asserta(count_(passed, 0)),
  asserta(count_(failed, 0)),
  testcases_(TestCases),
  if_(call_each_(TestCases),
    (test_result_('Passed Tests.'), halt),
    (test_result_('Failed Tests.'), halt(1))
  ).

test_result_(Msg) :-
  writeln_('=='),
  writeln_(Msg),
  count_(passed, X),
  count_(failed, Y),
  count_(assert, Z),
  format('Passed: ~d, Failed: ~d, Total Assertions: ~d', [X, Y, Z]), nl.

testcase_(Pred, TestCase) :- atom_concat('test_', TestCase, Pred), !.
testcase_(_, TestCase) :- atom_concat('', TestCase, '').
testcases_(TestCases) :-
  findall(Pred, current_predicate(Pred/0), Preds),
  filter_tests_(Preds, TestCases).

filter_tests_([], Res) :- append([], Res, []).
filter_tests_([Pred | Preds], Res) :-
  testcase_(Pred, TestCase),
  if_(TestCase \== '', append([], [Pred], Res0)),
  filter_tests_(Preds, Res1),
  append(Res0, Res1, Res).

pass_(TestCase, S) :- write(TestCase), writeln_(': passed'), countup_(passed), S is 1.
fail_(TestCase, S) :- write(TestCase), writeln_(': failed'), countup_(failed), S is 0.
bool_(1) :- true.
bool_(0) :- false.

call_each_([]).
call_each_([TestCase | TestCases]) :-
  catch(
    if_(call(TestCase), pass_(TestCase, S), fail_(TestCase, S)),
    _, fail_(TestCase, S)
  ),
  call_each_(TestCases),
  bool_(S).

%
% assertions
%
assert_true(Pred) :- countup_(assert), Pred.
assert_false(Pred) :- countup_(assert), Pred, !, throw.
assert_false(_).
assert_raise(Pred) :- countup_(assert), catch((Pred, false, !), _, true).
assert_raise(_) :- throw.
assert_equal(A, B) :- countup_(assert), A == B, true; throw.
assert_not_equal(A, B) :- countup_(assert), A == B, throw; true.

%
% utils
%
if_(Cond, Then) :- Cond, !, Then.
if_(_, _).
if_(Cond, Then, _) :- Cond, !, Then.
if_(_, _, Else) :- Else.
writeln_(Msg) :- write(Msg), nl.
countup_(Name) :-
  count_(Name, X),
  Y is X+1,
  retract(count_(Name, _)),
  assertz(count_(Name, Y)).
