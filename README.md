| Command | Function                                                                                                           |
|:-------:|--------------------------------------------------------------------------------------------------------------------|
|`0`        |Resets `memory[i]` to zero                                                                                        |
|`+`        |Adds 1 to `memory[i]`                                                                                             |
|`$+`       |Add `memory[i]` to the clipboard, store in the clipboard                                                          |
|`-`        |Subtracts 1 from `memory[i]`                                                                                      |
|`$-`       |Subtract `memory[i]` from the clipboard, store in the clipboard                                                   |
|`*`        |Multiplies `memory[i]` by 2                                                                                       |
|`$*`       |Multiply the clipboard by `memory[i]`, store in the clipboard                                                     |
|`/`        |Divides `memory[i]` by 2                                                                                          |
|`$/`       |Divide the clipboard by `memory[i]`, store in the clipboard                                                       |
|`>`        |Moves the cell pointer (`i`) right                                                                                |
|`<`        |Moves the cell pointer (`i`) left                                                                                 |
|`.`        |Prints `memory[i]` as an ASCII character                                                                          |
|`#`        |Prints `memory[i]` as a number                                                                                    |
|`_`        |Print newline                                                                                                     |
|`$C`       |Copies `memory[i]` into the clipboard                                                                             |
|`$V`       |Pastes the value of the clipboard into `memory[i]`                                                                |
|`$X`       |Resets the clipboard to zero                                                                                      |
|`"str"`    |Writes the ASCII values of `str` into `memory[i]` and beyond (does not account for nested strings)                |
|`[`        |If `memory[i]` is 0, then jump forward to the command after the matching `]`                                      |
|`]`        |If `memory[i]` is *not* 0, then jump back to the command after the matching `[`                                   |
|`(`        |If `memory[i]` is 0, then jump forward to the command after the matching `)`                                      |
|`)`        |Unlike `]`, does not jump back to the matching `)`. Closes the matching `(`                                       |
|`@`        |Jump forward to the matching `;` unconditionally                                                                  |
|`%name{macro}`|Define or replace a macro named `name` with the code `macro`                                                   |
|`%name`    |Execute the macro named `name`                                                                                    |
