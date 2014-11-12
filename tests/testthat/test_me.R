test_that("case is ignored", {
	expect_equal(gday("canucks"), gday("Canucks"))
})

## passing test doesn't show, failling test does show

test_that("should fail",{
	expect_true(gday("seattle"))
})

test_that("always returns logical", {
	expect_is(gday("canucks"), "logical")
})

test_that("asking for the city works just as well", {
	expect_equal(gday("canucks"), gday("Vancouver"))
})

test_that("Seattle does not have a NHL team", {
	expect_false(gday(team.names="Seattle"))
})
