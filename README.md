lunh-swift
==========


An implementation of the Luhn mod X algroithm in swift.


Usage
-----

Define the code points for the alphabet in the constant `codePoints`.

```
  let codePoints = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];
```

Will give Lunh mod 10. The code points can be any sequence of unique characters.

The code as commited will create and validate for the character sequence 23456789BCDFGHJKLPRQTVXNZ, defined as:

```
  let codePoints = ["2", "3", "4", "5", "6", "7", "8", "9", "B", "C", "D", "F", "G", "H", "J", "K", "L", "P", "R", "Q", "T", "V", "X", "N", "Z"];
```

To generate a checksum for a string call `GenerateCheckDigit.swift`

```
  # ./GenerateCheckDigit.swift QX7LCPKCTN
  QX7LCPKCTN6
```

To validate teh check digit call `ValidateCode.swift`

```
  # ./ValidateCode.swift QX7LCPKCTN6
  QX7LCPKCTN6: OK
```

The code is an implementation in Swift of the example Java code posted in the [Luhn Algorithm Wikipedia Entry](https://en.wikipedia.org/wiki/Luhn_algorithm)
