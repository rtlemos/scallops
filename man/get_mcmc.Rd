% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/algorithms.R
\name{get_mcmc}
\alias{get_mcmc}
\title{Markov chain Monte Carlo (Gibbs) method to sample from the conditional distributions of gamma and tau}
\usage{
get_mcmc(s, dpc_grid, y, nburn = 10, nsample = 10000, priors = NULL,
  printEvery = 1000, seed = NULL)
}
\arguments{
\item{s}{Observation locations}

\item{dpc_grid}{Discrete Process Convolution grid}

\item{y}{Observation values}

\item{nburn}{Number of EM iterations (burn-in) use dto estimate kernel parameters (rho)}

\item{nsample}{Number of MCMC iterations}

\item{priors}{Priors for gamma and tau}

\item{printEvery}{Console notifications every X iterations}

\item{seed}{Seed for reproducible chains}
}
\value{
List with sampled values of gamma and tau, as well as optimal estimates for rho
}
\description{
Markov chain Monte Carlo (Gibbs) method to sample from the conditional distributions of gamma and tau
}
\examples{
s = data.frame(lat = rep(0, 3), lon = c(-1:1))
y = c(1,1,0)
dpc_grid = get_grid(c(-1,1), c(0,0), spacing = 2)
priors = get_priors(dpc_grid)
iso_kernel_matrix = get_kernel_matrix(s, dpc_grid)
fit = get_mcmc(s, dpc_grid, y, 10, 1000, priors, 100, 1)
cbind(get_estimates(s, dpc_grid, fit), obs = y)
}
