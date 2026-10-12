| Command | Function                                                                                                           |
|:-------:|--------------------------------------------------------------------------------------------------------------------|
|`0`        |Resets the currently selected cell to zero                                                                        |
|`+`        |Adds 1 to the currently selected cell                                                                             |
|`-`        |Subtracts 1 from the currently selected cell                                                                      |
|`*`        |Multiplies the currently selected cell by 2                                                                       |
|`/`        |Divides the currently selected cell by 2                                                                          |
|`>`        |Moves the cell pointer right                                                                                      |
|`<`        |Moves the cell pointer left                                                                                       |
|`.`        |Prints the value of the currently selected cell as an ASCII character                                             |
|`#`        |Prints the value of the currently selected cell as a number                                                       |
|`C`        |Copies the value of the currently selected cell into the program's clipboard                                      |
|`V`        |Pastes the value of the program's clipboard into the currently selected cell                                      |
|`X`        |Resets the clipboard to zero                                                                                      |
|`"str"`    |Writes the ASCII values of `str` into the currently selected cell and beyond (does not account for nested strings)|
|`[`        |If the value of the currently selected cell is 0, then jump forward to the command after the matching `]`         |
|`]`        |If the value of the currently selected cell is *not* 0, then jump back to the command after the matching `[`      |
|`(`        |If the value of the currently selected cell is 0, then jump forward to the command after the matching `)`         |
|`)`        |Unlike `]`, does not jump back to the matching `)`. Closes the matching `(`                                       |
|`@`        |Jump forward to the matching `;` unconditionally                                                                  |
