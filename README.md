## gameday

`gameday` package provides  an easy way to check whether your favorite NHL team has a game today (or any other days) or not, and also can offer you the score information for all the games on a certain day.

### Installation

The packages can be installed from `github`.

```r
# install from github
library("devtools")
install_github("JiyingWen/gameday")
```

### Usage
There are two main functions in current version: `gday(team, date)` and `scores(date)`.

For example, we want to know whether Montreal Canadiens has a game on "2014-11-25", we can call `gday(team, date)`:

```r
# load package
library(gameday)

gday("canadiens", "2014-11-25")
```

```
## [1] FALSE
```

We also want to know the scores of all the games played on "2014-11-20", we can call `scores(date)`:

```r
scores("2014-11-20")
```



home                  away                   home_score   away_score   game_status   home_shots   away_shots
--------------------  --------------------  -----------  -----------  ------------  -----------  -----------
PHILADELPHIA FLYERS   MINNESOTA WILD                  2            3             5           39           29
TORONTO MAPLE LEAFS   TAMPA BAY LIGHTNING             5            2             5           21           28
MONTREAL CANADIENS    ST LOUIS BLUES                  4            1             5           30           32
OTTAWA SENATORS       NASHVILLE PREDATORS             3            2             5           19           35
WINNIPEG JETS         DETROIT RED WINGS               3            4             5           31           27
DALLAS STARS          ARIZONA COYOTES                 3            1             5           27           27
COLORADO AVALANCHE    WASHINGTON CAPITALS             2            3             5           29           23
CALGARY FLAMES        CHICAGO BLACKHAWKS              3            4             5           27           22
VANCOUVER CANUCKS     ANAHEIM DUCKS                   3            4             5           28           26
LOS ANGELES KINGS     CAROLINA HURRICANES             3            2             5           39           27
SAN JOSE SHARKS       FLORIDA PANTHERS                2            3             5           30           28

### Vignette
A more detailed description of `gameday` package can be found in the vignette. To view it, run the following `R` code in the console.

```r
browseVignettes("gameday")
```

