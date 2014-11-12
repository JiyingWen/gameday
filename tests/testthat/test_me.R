test_that("case is ignored", {
	expect_equal(gday("canucks"), gday("Canucks"))
})

## passing test doesn't show, failling test does show

test_that("should fail",{
	expect_true(gday("seattle"))
})
