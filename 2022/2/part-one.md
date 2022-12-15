# Part One
Calculate the total sum of points that the given strategy will result in.

## File Grammer
    Strategy:
      Line
      [Line]*

    Line: PlayerSymbol OpponentSymbol

    PlayerSymbol: A | B | C

    OpponentSymbol: X | Y | Z

## Symbols
| You   | Them   | Throw     |
|:-----:|:------:|:---------:|
| A     | X      | Rock      |
| B     | Y      | Paper     |
| C     | Z      | Scissor   |

## Points
| Condition | Points |
|:---------:|:------:|
| Rock      | 1      |
| Paper     | 2      |
| Scissor   | 3      |
| Losing    | 0      |
| Draw      | 3      |
| Won       | 6      |

## Example
    A Y
That line is worth 8 points
