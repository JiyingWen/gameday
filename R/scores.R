#' NHL scores for a particular date
#'
#' This function returns a data.frame with information about the games on a particular
#' data you want to know.
#'
#' @param date the date you want to know the scores, format as "YYYY-MM-DD"
#' @return a data.frame with variables: \code{home}, \code{away}, \code{home_score},
#' \code{away_score}.
#' @export
#' @examples
#' scores("2014-11-19")
#' scores("2012-12-12")

scores <- function(date = Sys.Date()){
	if(internet_connection())
		url <- paste0("http://live.nhle.com/GameData/GCScoreboard/",
									date, ".jsonp")
	else
		stop("Oops! Looks like the internet is off, could you connect to the internet and try again?")

	assertthat::assert_that(check_date(date))

	url  <- paste0('http://live.nhle.com/GameData/GCScoreboard/',
								 date, '.jsonp')
	raw <- RCurl::getURL(url)
	json <- gsub('([a-zA-Z_0-9\\.]*\\()|(\\);?$)', "", raw, perl = TRUE)
	data <- jsonlite::fromJSON(json)$games
	with(data,
			 data.frame(home = paste(htn, htcommon),
			 					 away = paste(atn, atcommon),
			 					 home_score = hts,
			 					 away_score = ats,
			 					 game_status = gs,
			 					 home_shots = htsog,
			 					 away_shots = atsog))
}
