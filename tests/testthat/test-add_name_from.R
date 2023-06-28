test_that("adds the 'name' burried in a column", {
  data <- tibble(x = "name a, city a")
  out <- add_name_from(data, "x")
  expect_equal(out$name, "name a")
})

test_that("adds the 'city' burried in a column", {
  data <- tibble(x = "name a, city a")
  out <- add_city_from(data, "x")
  expect_equal(out$city, "city a")
})

test_that("is sensitive to pattern", {
  data <- tibble(x = "name a, city a")
  out <- add_city_from(data, "x", pattern = ".*")
  expect_equal(out$city, data$x)
})

test_that("without `data` errors gracefully", {
  expect_error(add_city_from(col = "x"), "data.*missing")
})

test_that("without `col` errors gracefully", {
  data <- tibble(x = "name a, city a")
  expect_error(add_city_from(data = data), "col.*missing")
})

test_that("with inexistent `col` errors gracefully", {
  data <- tibble(x = "name a, city a")
  expect_error(add_city_from(data, "bad"), "not found")
})
