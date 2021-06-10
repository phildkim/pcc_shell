# Tree

## Implementation

Write a function **tree()** that takes a single argument that represents a file or a folder and prints its contents hierarchically. E.g., if a folder **pcc/** contains a **README** file along with a folder **cs018** that in turn contains a **syllabus** file, your function should print the following to stdout when it is passed **pcc** as the argument.

```text
pcc/
    README
    cs018/
        syllabus
```

Note the following:

1. Each indent is exactly one TAB. E.g., **README** above is one TAB in and **syllabus** is two TABS in.
2. Folders must end with a **/**.

## Unit Testing

Create unit tests to make sure your function is working as expected.

1. Complete the six test functions in **test.sh** to test each situation specified by the comment.
2. Use **mktemp** to create the different assets to pass to your function. DO NOT CREATE THEM DIRECTLY.

Aspect                        | Points
----------------------------- | :----:
Operation (100)               | 100
Application of concepts (100) | 100
Organization (100)            | 90
TOTAL                         | 290
