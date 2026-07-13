

/*
===============================================================================
Email Validation Regex
===============================================================================

Regex:

^[A-Za-z0-9]+([._%+-][A-Za-z0-9]+)*@[A-Za-z0-9]+([.-][A-Za-z0-9]+)*\.[A-Za-z]{2,}$

SQL Example:

SELECT *
FROM organization
WHERE code ~* '^[A-Za-z0-9]+([._%+-][A-Za-z0-9]+)*@[A-Za-z0-9]+([.-][A-Za-z0-9]+)*\.[A-Za-z]{2,}$';


===============================================================================
PART 1 : Local Part (Username)
===============================================================================

Regex:

^[A-Za-z0-9]+([._%+-][A-Za-z0-9]+)*


^
-------
Start of the string.


[A-Za-z0-9]+
-------------
Username must begin with one or more letters or numbers.

Examples:

Valid:
    john
    john123
    abc

Invalid:
    .john
    _john
    +john


([._%+-][A-Za-z0-9]+)*
----------------------

This group consists of:

Step 1:
    One special character

        .
        _
        %
        +
        -

Step 2:
    It MUST be immediately followed by
    one or more letters or numbers.

Step 3:
    The whole group may repeat
    zero or more times.

Valid:

    john.doe
    john_doe
    john+work
    john-doe
    john%test
    john.doe123.work

Invalid:

    john..
    john.
    .john
    john__doe
    john++work

Reason:

After every special character,
the regex expects at least one
letter or digit.

Therefore consecutive special characters
are not allowed.


===============================================================================
PART 2 : @ Symbol
===============================================================================

@

Exactly one '@' separates

    Username

and

    Domain


===============================================================================
PART 3 : Domain + Top Level Domain
===============================================================================

Regex:

[A-Za-z0-9]+([.-][A-Za-z0-9]+)*\.[A-Za-z]{2,}$


[A-Za-z0-9]+
-------------

Domain must begin with one or more
letters or numbers.

Valid:

    gmail
    google
    company123

Invalid:

    .gmail


([.-][A-Za-z0-9]+)*
-------------------

Allows only

    .
    -

Each one MUST be followed by
letters or numbers.

Valid:

    google.co
    mail-server
    abc-company

Invalid:

    gmail..
    .gmail
    gmail.


\.
--

Matches the literal dot before
the Top Level Domain.

Examples:

    gmail.com
         ^


[A-Za-z]{2,}
------------

Top Level Domain (TLD)

Only alphabetic characters.

Minimum length = 2

Valid:

    com
    org
    net
    edu
    in

Invalid:

    c
    1
    a1


$
-

End of the string.

Nothing is allowed after the TLD.


===============================================================================
Overall Flow
===============================================================================

^

↓

Username starts with letters/numbers

↓

Optional groups:

    (. _ % + -)

followed by

    letters/numbers

↓

@

↓

Domain starts with letters/numbers

↓

Optional groups:

    (. -)

followed by

    letters/numbers

↓

.

↓

Top Level Domain
(Minimum 2 letters)

↓

$


===============================================================================
Valid Examples
===============================================================================

john@gmail.com
john.doe@gmail.com
john_doe@gmail.com
john+office@gmail.com
john-doe@gmail.com
john123@test.co.in


===============================================================================
Invalid Examples
===============================================================================

.john@gmail.com
john.@gmail.com
john..doe@gmail.com
john@gmail
john@g..mail.com
john@.gmail.com
john@gmail.c

===============================================================================
*/