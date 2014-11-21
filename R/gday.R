#' Is it Gameday?
#'
#' This function returns TRUE is your NHL teams plays today and FALSE otherwise
#'
#' You know then problem: You're in your office writing R code and
#' suddenly have the urge to check whether your NHL team has a game today.
#' Before you know it you just wasted 15 minutes browsing the lastest
#' news on your favorite hockey webpage.
#' Suffer no more! You can now ask R directly, without tempting yourself
#' by firing up your web browser.
#'
#'@importFrom RCurl getURL
#' @param team The name of your team; date
#' @return Logical \code{TRUE} if \code{name} has an NHL game today
#' \code{FALSE} otherwise
#' @note case in \code{team} is ignored
#' @export
#' @examples
#' gday(team = "Canucks", date = "2014-11-23")
#' gday("Canucks")
#' gday("Bruins")
#' gday("New York")
#' gday(date = "2014-11-20")

gday <- function(team = "canucks", date = Sys.Date()){
	if(internet_connection())
		url <- paste0("http://live.nhle.com/GameData/GCScoreboard/",
								date, ".jsonp")
	else
		stop("Oops! Looks like the internet is off, could you connect to the internet and try again?")

	assertthat::assert_that(check_date(date))

	if(check_team(team) == FALSE){
		stop("Oops! There must be a typo in the team name, or the city you enter doesn't have an
				 NHL team, could you please check and try again?")
	}



	grepl(team, getURL(url), ignore.case = TRUE)


}
