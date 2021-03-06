% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/postprocessing.R
\name{get_gridded_estimates}
\alias{get_gridded_estimates}
\title{Plot gridded posterior predictive means}
\usage{
get_gridded_estimates(obs_coord, dpc_grid, fit, fineness)
}
\arguments{
\item{obs_coord}{Coordinates of original observation locations}

\item{dpc_grid}{Discrete Process Convolution grid}

\item{fit}{Fitted model}

\item{fineness}{Resolution of gridded means (1 = coarse, 10 = fine)}
}
\value{
Gridded estimates within the domain defined by the observation locations (extapolation is dangerous)
}
\description{
Plot gridded posterior predictive means
}
\examples{
set.seed(5)
s = data.frame(lat = runif(3, min = 0, max = 1), lon = runif(3, -1, 1))
y = c(1,1,0)
dpc_grid = get_grid(c(-1,1), c(-1,1), spacing = 2)
priors = get_priors(dpc_grid)
iso_kernel_matrix = get_kernel_matrix(s, dpc_grid)
fit = get_mcmc(s, dpc_grid, y, 10, 1000, priors, 100, 1)
gr = get_gridded_estimates(obs_coord = s, dpc_grid = dpc_grid, fit = fit, fineness = 10)
plot(gr$lon, gr$lat, cex = 0.1 + 4 * gr$z, xlim = c(-1, 1), ylim = c(0, 1))
points(s$lon, s$lat, pch = 19, cex = 0.1 + 4 * y, col = 'red')

}
