% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/summarizeSoil.R
\name{summarizeSoil}
\alias{summarizeSoil}
\title{Summarize Soil Data}
\usage{
summarizeSoil(x)
}
\arguments{
\item{x}{A tibble containing soil data.}
}
\value{
A tibble with summarized soil data.
}
\description{
This function takes a tibble containing soil data, performs data summarization,
and returns a formatted and summarized tibble.
}
\details{
This function performs the following steps:
\enumerate{
\item Removes rows with missing values.
\item Excludes certain columns from the analysis.
\item Calculates mean, standard deviation, and standard error for numeric columns.
\item Pivots the data into a long format.
\item Renames columns for clarity.
\item Pivots the data back to a wider format.
\item Rounds numeric columns to three decimal places.
}
}
