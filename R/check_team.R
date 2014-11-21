

check_team <- function(team){
	any(grepl(team, arena_team$team, ignore.case = TRUE))
}
