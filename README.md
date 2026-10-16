---
# Spec

| Command | Function                                                                                                           |
|:-------:|--------------------------------------------------------------------------------------------------------------------|
|`,`        |Waits for 1 character of user input and sets `memory[1]` to the consumed input                                    |
|`0`        |Resets `memory[i]` to zero                                                                                        |
|`+`        |Adds 1 to `memory[i]`                                                                                             |
|`$+`       |Add `memory[i]` to the accumulator, store in the accumulator                                                      |
|`-`        |Subtracts 1 from `memory[i]`                                                                                      |
|`$-`       |Subtract `memory[i]` from the accumulator, store in the accumulator                                               |
|`*`        |Multiplies `memory[i]` by 2                                                                                       |
|`$*`       |Multiply the accumulator by `memory[i]`, store in the accumulator                                                 |
|`/`        |Divides `memory[i]` by 2                                                                                          |
|`$/`       |Divide the accumulator by `memory[i]`, store in the accumulator                                                   |
|`>`        |Moves the cell pointer (`i`) right                                                                                |
|`<`        |Moves the cell pointer (`i`) left                                                                                 |
|`.`        |Prints `memory[i]` as an ASCII character                                                                          |
|`#`        |Prints `memory[i]` as a number                                                                                    |
|`_`        |Print newline                                                                                                     |
|`$S`       |Swap `memory[i]` and the accumulator                                                                              |
|`$C`       |Copies `memory[i]` into the accumulator                                                                           |
|`$V`       |Pastes the value of the accumulator into `memory[i]`                                                              |
|`$X`       |Resets the accumulator to zero                                                                                    |
|`?-`       |Set loop condition to "if `memory[i]` is negative"                                                                |
|`?0`       |Set loop condition to "if `memory[i]` == 0" (default loop behavior)                                               |
|`?+`       |Set loop condition to "if `memory[i]` is positive"                                                                |
|`?E`       |Set loop condition to "if `memory[i]` is even"                                                                    |
|`?O`       |Set loop condition to "if `memory[i]` is odd"                                                                     |
|`?<`       |Set loop condition to "if `memory[i]` < accumulator"                                                              |
|`?=`       |Set loop condition to "if `memory[i]` == accumulator"                                                             |
|`?!`       |Set loop condition to "if `memory[i]` != accumulator"                                                             |
|`?>`       |Set loop condition to "if `memory[i]` > accumulator"                                                              |
|`:num:`    |Read `num` as a number into `memory[i]`                                                                           |
|`"str"`    |Writes the ASCII values of `str` into `memory[i]` and beyond (does not account for nested strings)                |
|`[`        |If the set condition is met (or `memory[i]` is 0), then jump forward to the command after the matching `]`        |
|`]`        |If the set condition is *not* met (or `memory[i]` is not 0), then jump back to the command after the matching `[` |
|`(`        |If the set condition is met (or `memory[i]` is 0), then jump forward to the command after the matching `)`        |
|`)`        |Unlike `]`, does not jump back to the matching `)`. Closes the matching `(`                                       |
|`@`        |Jump forward to the matching `;` unconditionally                                                                  |
|`%name{macro}%`|Define or replace a macro `name` with the code `macro`                                                        |
|`%name%`   |Execute the macro `name`                                                                                          |
