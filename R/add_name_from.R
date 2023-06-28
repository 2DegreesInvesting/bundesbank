#' Extract a pattern from a string in a data frame column
#'
#' @param data A data frame.
#' @param col The name of a column, e.g. "company_name".
#' @param pattern A pattern to extract from `col`.
#'
#' @return A data frame with a new column containing the extracted text.
#' @export
#'
#' @examples
#' library(tibble)
#'
#' data <- tibble(company_name = "Peter GmbH & Co. KG, Berlin")
#' data %>%
#'   add_name_from("company_name") %>%
#'   add_city_from("company_name")
#'
#' # Assumes that 'name' is after the last comma. If not the output is wrong.
#' data <- tibble(company_name = "bad, name")
#' data %>%
#'   add_name_from("company_name")
#'
#' # Assumes that 'city' is after the last comma. If not the output is wrong.
#' data <- tibble(company_name = "city, bad")
#' data %>%
#'   add_city_from("company_name")
add_name_from <- function(data, col, pattern = "^[^,]+") {
  add_pattern_from(data, col, pattern, "name")
}

#' @rdname add_name_from
#' @export
add_city_from <- function(data, col, pattern = "[^,]+$") {
  add_pattern_from(data, col, pattern, "city")
}

add_pattern_from <- function(data, col, pattern, new_name) {
  mutate(data, "{ new_name }" := trimws(str_extract(.data[[col]], pattern)))
}
