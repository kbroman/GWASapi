context("check_gwascat")

test_that("check_gwascat works", {

    expect_equal(check_gwascat(), "Successfully connected to the NHGRI-EBI GWAS Catalog.")

})
