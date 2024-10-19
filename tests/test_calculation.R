# Load required library
library(testthat)

# Source the script with the functions to test
# Adjust the path as necessary depending on your project structure
source("D:/Project/RandomnessTestPi/R/randomness_test.R")


# Define the tests
test_that("calculate tallest middle triplets correctly", {
  digits <- c(1, 3, 2, 5, 7, 1)
  # Ensure the expected outcome matches the function logic
  expect_equal(calculate_tallest_middle_triplets(digits), 2)
})

test_that("calculate Zobs correctly", {
  Tobs <- 15
  n_triplets <- 40
  p <- 0.285
  expected_T <- n_triplets * p
  variance_T <- n_triplets * p * (1 - p)
  Zobs_expected <- (Tobs - expected_T) / sqrt(variance_T)
  # Directly compare the output of calculate_zobs with the computed Zobs_expected
  expect_equal(calculate_zobs(Tobs, n_triplets, p), Zobs_expected, tolerance = 1e-4)
})

# Manually check outputs (used for debugging purposes, not typically included in production tests)
digits <- c(1, 3, 2, 5, 7, 1)
cat("Manual check - Tallest Middle Triplets:", calculate_tallest_middle_triplets(digits), "\n")

Tobs <- 15
n_triplets <- 40
p <- 0.285
expected_T <- n_triplets * p
variance_T <- n_triplets * p * (1 - p)
Zobs_calculated <- (Tobs - expected_T) / sqrt(variance_T)
cat("Manual check - Zobs Calculated:", Zobs_calculated, "\n")

# Execute all tests in the specified directory (ensure the path is correct)
# This is typically used if you're executing from a separate runner script or for integration in CI/CD pipelines
# test_dir("tests/") # Uncomment and use the correct path to your test directory
