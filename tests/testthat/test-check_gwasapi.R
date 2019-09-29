context("check_gwasapi")

test_that("check_gwasapi works", {

    expect_equal(check_gwasapi(), "Successfully connected to the NHGRI-EBI GWAS Catalog.")

})
