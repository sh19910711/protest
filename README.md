## ProTest

| ?- Testing Framework for Prolog.

### Usage

```prolog
% number_test.pl
:- include('path/to/protest.pl').

test_equal:-
  assert_equal(1, 1).

test_not_equal :-
  assert_not_equal(1, 2).
```

#### GNU Prolog

```shell
$ gprolog --consult-file number_test.pl --entry-goal run_tests
```

### API

TBD.
