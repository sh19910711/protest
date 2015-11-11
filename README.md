## ProTest

[![Build Status](https://travis-ci.org/sh19910711/protest.svg?branch=master)](https://travis-ci.org/sh19910711/protest)

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

#### GNU Prolog (>= `ver. 1.4.x`)

```text
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

#### SWI-Prolog

```text
$ swipl -l test/example_test.pl -t run_tests
Welcome to SWI-Prolog (Multi-threaded, 64 bits, Version 7.2.3)
Copyright (c) 1990-2015 University of Amsterdam, VU Amsterdam
SWI-Prolog comes with ABSOLUTELY NO WARRANTY. This is free software,
and you are welcome to redistribute it under certain conditions.
Please visit http://www.swi-prolog.org for details.

For help, use ?- help(Topic). or ?- apropos(Word).

test_true: passed
test_bar: passed
test_false: passed
test_not_equal: passed
test_equal: passed
test_not_found: passed
test_foo: passed
==
Passed Tests.
Passed: 7, Failed: 0, Total Assertions: 5
```

### API

(TBD)

## License

The **protest.pl** is licensed under the MIT-License, see details in the LICENSE.txt.
