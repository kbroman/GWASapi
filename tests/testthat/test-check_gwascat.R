context("check_gwascat")

test_that("check_gwascat works", {

    expect_equal(check_gwascat(), "The GWAS Catalog says hello.")

})
