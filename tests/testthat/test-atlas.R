library(ggseg)
library(ggseg3d)
library(ggplot2)

# ggseg ----
context("test-palettes")
test_that("check new palettes work", {
  expect_equal(length(brain_pal("economo", package = "ggsegEconomo")), 15)

  expect_error(brain_pal("economo"), "not a valid")

  expect_true(all(brain_regions(economo) %in% names(brain_pal("economo", package = "ggsegEconomo"))))
})

context("test-ggseg-atlas")
test_that("atlases are true ggseg atlases", {

  expect_true(is_brain_atlas(economo))

})

context("test-ggseg")
test_that("Check that polygon atlases are working", {
  expect_is(ggseg(atlas = economo),c("gg","ggplot"))

  expect_is(ggseg(atlas = economo, mapping = aes(fill = region)),
            c("gg","ggplot"))

  expect_is(ggseg(atlas = economo, mapping = aes(fill = region)) +
              scale_fill_brain("economo", package = "ggsegEconomo"),
            c("gg","ggplot"))

  expect_is(ggseg(atlas = economo, mapping = aes(fill = region)) +
              scale_fill_brain("economo", package = "ggsegEconomo"),
            c("gg","ggplot"))

  expect_is(ggseg(atlas = economo, mapping=aes(fill=region), adapt_scales = FALSE ),c("gg","ggplot"))

})


# ggseg3d ----
context("test-ggseg3d")
test_that("Check that mesh atlases are working", {
  expect_is(
    ggseg3d(atlas=economo_3d),
    c("plotly", "htmlwidget")
  )
})



context("test-ggseg3d-atlas")
test_that("atlases are true ggseg3d atlases", {

  expect_true(is_ggseg3d_atlas(economo_3d))

})
