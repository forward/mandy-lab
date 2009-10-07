Distributed Grep
================

Problem
-------
Given an input document, perform a regular expression-based grep across the data, returning lines matching the
provided expression.

Example
-------

Given an input of:

> ALICE was beginning to get very tired of sitting by her
> sister on the bank and of having nothing to do: once ...

using the regular expression of `Alice` produce the following:

		ALICE was beginning to get very tired of sitting by her
				
Further example text (for input) is available in `./input/alice.txt`

Brucie Bonus
------------
Provide regular expression from command-line (rather than coded in the solution).