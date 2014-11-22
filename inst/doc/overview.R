## ------------------------------------------------------------------------
#devtools::install_github("JiyingWen/gameday")

## ------------------------------------------------------------------------
library(gameday)

## ------------------------------------------------------------------------
# check whether Canucks has a game today
gday()

## ------------------------------------------------------------------------
# check whether New York Rangers plays tomorrow
gday("rangers", Sys.Date() + 1)

## ------------------------------------------------------------------------
# check whether Boston Bruins plays on Nov. 25, 2014
gday("Bruins", "2014-11-25")

## ------------------------------------------------------------------------
# check the scores today
scores()

## ------------------------------------------------------------------------
# check the scores on Nov.18, 2014
scores("2014-11-18")

## ------------------------------------------------------------------------
# load dplyr package
suppressPackageStartupMessages(library(dplyr))
#filter out the games that have ended and calculate total shots
shots <- scores() %>%
	filter(game_status == 5) %>%
	mutate(total_shots = home_shots + away_shots) %>%
	select(home, away, home_score, away_score, total_shots)

## ----results='asis'------------------------------------------------------
library(knitr)
kable(shots, format = "html")

## ------------------------------------------------------------------------
(
	winning_teams <- scores() %>%
    mutate(winning_team = ifelse(home_score > away_score, 
    														 as.character(home), as.character(away))) %>%
    select(winning_team)
	)


