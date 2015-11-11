## ProTest

| ?- Testing Framework for Prolog.

### Usage

```prolog
% number_test.pl
:- include('path/to/protest.pl').

test_equal :-
  assert_equal(1, 1).

test_not_equal :-
  assert_not_equal(1, 2).
```

#### GNU Prolog

```shell
$ gprolog --consult-file number_test.pl --entry-goal run_tests
GNU Prolog 1.4.4 (64 bits)
Compiled Apr 29 2013, 20:42:46 with gcc
By Daniel Diaz
Copyright (C) 1999-2013 Daniel Diaz
compiling number_test.pl for byte code...
number_test.pl compiled, 80 lines read - 11142 bytes written, 8 ms
test_equal: passed
test_not_equal: passed
==
Passed Tests.
Passed: 2, Failed: 0, Total Assertions: 2
```

### API

(TBD)

## License

The **protest.pl** is licensed under the MIT-License, see details in the LICENSE.txt.
