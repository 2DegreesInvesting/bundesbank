
<!-- README.md is generated from README.Rmd. Please edit that file -->

# bundesbank

<!-- badges: start -->

[![Codecov test
coverage](https://codecov.io/gh/2DegreesInvesting/bundesbank/branch/main/graph/badge.svg)](https://app.codecov.io/gh/2DegreesInvesting/bundesbank?branch=main)
[![R-CMD-check](https://github.com/2DegreesInvesting/bundesbank/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/2DegreesInvesting/bundesbank/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of bundesbank is to provide helpers for Bundesbank.

## Installation

You can install the development version of bundesbank with:

``` r
install.packages("devtools")
devtools::install_github("2degreesinvesting/bundesbank")
```

## Example

``` r
library(bundesbank)
library(tibble)

data <- tibble(company_name = "Peter GmbH & Co. KG, Berlin")
data %>%
  add_name_from("company_name") %>%
  add_city_from("company_name")
#> # A tibble: 1 × 3
#>   company_name                name                city  
#>   <chr>                       <chr>               <chr> 
#> 1 Peter GmbH & Co. KG, Berlin Peter GmbH & Co. KG Berlin

# Assumes that 'name' is after the last comma. If not the output is wrong.
data <- tibble(company_name = "bad, name")
data %>%
  add_name_from("company_name")
#> # A tibble: 1 × 2
#>   company_name name 
#>   <chr>        <chr>
#> 1 bad, name    bad

# Assumes that 'city' is after the last comma. If not the output is wrong.
data <- tibble(company_name = "city, bad")
data %>%
  add_city_from("company_name")
#> # A tibble: 1 × 2
#>   company_name city 
#>   <chr>        <chr>
#> 1 city, bad    bad
```
