# Counts

## Regular Assignment (200 points)

Write a script in **count.sh** that counts the words in each sentence in the given input.

1. The input must be read through standard input.
2. A sentence is defined as a collection of words that ends with a question mark (?), exclamation mark (!), or a period(.).
3. Each word is separated by one or more space ( ) or dash (-) characters. E.g., the sentence "I got a lot of thank-you notes!" has 8 words (thank-you counts as 2).
4. Assume that each line has only complete sentences (i.e., sentences will not break to continue on next line, see the extra credit part below).
5. You MUST add comments at the top of the file indicating the purpose of the file, the copyright note, and the behavior (input, output, and what the script does).
6. You should print the output, with each line showing the sentence number (starting with 1), a TAB, and the number of words in the sentence. E.g., consider the below input.

```txt
What, me worry? No.
And you?
```

The output for that should be as below.

```txt
1   3
2   1
3   2
```

## Extra Credit (100 points)

Add the condition that a line may contain a partial sentence. E.g., the following input counts as two sentences.

```txt
You laugh. But there will be a day
when Big Foot will roam
the earth.
```

And your code should print the following.

```txt
1   2
2   13
```

I have provided a **test.sh** script for unit testing, you can run it directly to check your implementation. Tests 1 and 2 are for the regular assignment, and test 3 is for the extra credit. **Be sure to run this before submitting!**

Aspect                        | Points
----------------------------- | :----:
Operation (100)               | 100
Application of concepts (100) | 100
Extra credit (100)            | 100
TOTAL                         | 300
