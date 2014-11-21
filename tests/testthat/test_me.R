context("Test team name")

test_that("Team name is not case sensitive", {
	expect_equal(gday("canucks"), gday("Canucks"))
})


test_that("Asking for the city works just as well", {
	expect_equal(gday("canucks"), gday("Vancouver"))
})


test_that("always returns logical", {
	expect_is(gday("canucks"), "logical")
})


test_that("Seattle does not have a NHL team", {
	expect_false(gday(team ="Seattle"))
})


test_that("Vancouver Canucks had a game against Edmonton Oilers on 2014-11-02", {
	expect_true(gday(team = "canucks", date = "2014-11-19"))
	expect_true(gday(team = "oilers", date = "2014-11-19"))
})


test_that("Boston Bruins did not have a game on 2014-11-19", {
	expect_false(gday(team = "bruins", date = "2014-11-19"))
})

test_that("The default team is Vancouver Canucks and the default date is Sys.Date in gday()", {
	expect_equal(gday(), gday("canucks", Sys.Date()))
})

context("Test date format")

test_that("invalid date input triggers the error", {
	expect_error(gday(team = "canucks", date = "201340-1-20"), "Error")
	expect_error(scores(date = "201340-1-20"), "Error")
})

context("Test scores()")
test_that("Always return a data.frame", {
	expect_is(scores(), "data.frame")
})

test_that("The default date is Sys.Date", {
	expect_equal(scores(), scores(Sys.Date()))
})




