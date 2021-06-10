# Find

You're hired to write a script to look up names and emails in a database. The requirements are as follows.

1. The data will be listed in a text file (**data.txt**), each line containing the first name, last name, and email of one person in three columns separated by a TAB. E.g.,

    ```text
    Shawn   King    brittanymorgan@owens.com
    ```

2. The user will query with command line options specifying first name (**-f**), last name (**-l**), email (**-e**), along with an optional flag **-n** to specify the maximum number of entries to show. If **-n** is not specified, you will need to show all matching entries, with each column separated by a single TAB. E.g.,

    ```text
    find.sh -f Shawn
    Shawn   Diaz    crystalroberts@gardner-hoffman.com
    Shawn   Dixon   karenward@hickman-merritt.com
    Shawn   King    brittanymorgan@owens.com
    Shawn   Scott   samanthalove@hotmail.com
    Shawn   Thompson    nstanton@hotmail.com
    Shawn   Young   downskimberly@blake.com
    ```

3. If there are multiple matching entries, they must be sorted in the order of last name, then first name, and then email. If a **-n** option is specified, you will need to sort the all matching entries and then show up to **n** entries from the top. E.g.,

    ```text
    find.sh -f Shawn -n 2
    Shawn   Diaz    crystalroberts@gardner-hoffman.co
    Shawn   Dixon   karenward@hickman-merritt.com
    ```

4. Multiple filtering options are allowed. E.g.,

    ```text
    find.sh -f Shawn -l Scott
    Shawn   Scott   samanthalove@hotmail.com
    ```

5. Allow regular expression searches. I.e.,

    ```text
    find.sh -f "Sha.*" -l "Di.*n"
    Shawn   Dixon   karenward@hickman-merritt.com
    ```

6. Allow errors. E.g., the below error (**-ln Scott**) will be interpreted as specifying last name "n" (the **-ln** part), ignoring "Scott" and resulting in no hits.

    ```text
    find.sh -f Shawn -ln Scott
    ```

Aspect                        | Points
----------------------------- | :----:
Operation (100)               | 100
Application of concepts (100) | 90
Organization (100)            | 90
TOTAL                         | 280
