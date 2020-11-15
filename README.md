# CA4003 - Assignment 1


## Spec

The aim of this assignment is to implement a lexical and syntax analyser using Antlr4 for a simple language called CAL.

The details of the CAL language are given here.

### Deadline

**10am on Monday 16th November 2020.**

### Submission

**The parser and supporting code must be written in Java.**

You should submit the following
- Antlr4 grammar file
- other Java files which were used to generate your parser)
- a brief description of each of the major components of your lexical and syntax analyser that describes how you implemented them
- a declaration that this is solely your own work (except elements that are explicitly attributed to another source),


The paerser should take a file name as an input, say file.cal, and output one of the following messages if the input parsed successfully or did not parse respectively.

```sh
foo@bar:~$ java cal file.cal
file.cal parsed successfully
```

or

```sh
foo@bar:~$ java cal file.cal
file.cal has not parsed
```


Submissions without the declaration of that the assignment is the student's own work will not be assessed. The assignment carries 15 marks and late submissions will incur a 1.5 mark penalty for each 24 hours after the submission.

Please click here to review the School's policy on plagarism. All submissions will be checked for plagarism and severe penalties will apply.
