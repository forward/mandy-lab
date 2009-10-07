Word Count
==========

Problem
-------
Calculate occurrences of individual words from a given input set.

Example
-------

Given an input of:

> ALICE was beginning to get very tired of sitting by her
> sister on the bank	and of having nothing to do: once ...

produce the following:

		ALICE	1
		and	1
		bank 1
		beginning	1
		by	1
		do	1
		get	1
		having	1
		her	1
		nothing	1
		of	2
		on	1
		once	1
		sister	1
		sitting	1
		the	1
		tired	1
		to	2
		very	1
		was	1

Further example text (for input) is available in `./input/alice.txt or ./input/war.txt`

Further Optimisation
--------------------
For extra bonus points: To reduce the data sent to the reduce phase how would you re-implement the map phase to
minimise it's output.