% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gammatau.R
\name{get_posterior_mean}
\alias{get_posterior_mean}
\title{Compute the full conditional (given tau, rho, and data) mean of gamma}
\usage{
get_posterior_mean(prior_mean, prior_precision, posterior_precision,
  kernel_matrix, tau, y)
}
\arguments{
\item{prior_mean}{Prior mean of gamma}

\item{prior_precision}{Prior precision of gamma}

\item{posterior_precision}{Full conditional precision of gamma}

\item{kernel_matrix}{DPC kernel matrix}

\item{tau}{Sampled value of tau}

\item{y}{Data}
}
\description{
Compute the full conditional (given tau, rho, and data) mean of gamma
}
\examples{
km = list(mat = Matrix::Diagonal(2, 1))
prior_pr = Matrix::Diagonal(2, 0.3)
tau = 5
post_pr = get_posterior_precision(prior_pr, km, tau)
get_posterior_mean(prior_mean = rep(0, 2), prior_precision = prior_pr, 
                   posterior_precision = post_pr, kernel_matrix = km, tau = tau, y = c(0.9, 0.7))
}
