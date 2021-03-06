% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/DataPreparation.R
\name{Param_corr}
\alias{Param_corr}
\title{Function to identify covariates that are correlated in terms of Spearman's rank}
\usage{
Param_corr(x, rm = NULL, visual = FALSE, thd = 0.7, plot = TRUE,
  saveWD = NULL, figname = "Covariate_correlation", img.size = 12)
}
\arguments{
\item{x}{dataframe of covariates only, on which to test correlation of covariates.
This can also be dataset as issued from \code{\link{Prepare_dataset}}.}

\item{rm}{vector of column numbers to be removed from the analysis. Default to NULL.
If you specify your complete dataset as \code{x}, you may define \code{rm=1} to
remove your observations from the columns.}

\item{visual}{logical. Whether to define visually if data are considered
correlated or not. See details. Be careful, all previous figures are
closed with graphics.off() before running visual analysis.}

\item{thd}{numeric. Correlation (absolute) value above which to consider that covariates
are correlated and should not remain in the same model. This value is necessary
when visual = FALSE. See details.}

\item{plot}{logical. Whether to plot the figure of correlation values between
covariates. Set to FALSE if using a MPI cluster.}

\item{saveWD}{path to directory where to save a jpg figure file. If NULL and
plot = TRUE, then figure is shown on screen.}

\item{figname}{character. The name (w/o extension) of the figure to be saved in saveWD.}

\item{img.size}{size in cm of the output (square) image. May increase labels size as well.}
}
\description{
Correlation engender problems of identifiability.
Correlated parameters in the dataset will be separated in tested models.
Test for the Spearman factor for non linear correlation between covariates
of all the stations.
Complete the test with a visual test if needed.
}
\details{
\itemize{
\item Correlation of covariates is to be tested in the dataset itself. It is not
important if covariates are correlated in real life. What affect model fits
is the correlation within the dataset. Therefore is this function...
\item Spearman's rank correlation coefficient has been chosen as it allows to
test for correlation between categorical and continuous variables. This may
look as a non-sense to test for correlation with categorical covariates.
In some cases, the order of classes inside a category may have a sense, e.g.
continuous variable that has been categorised for any reason. In this function
classes are temporary turned into numbers to calculate correlation.
This implies that the alphanumeric order of classes has a sense.
The Spearman test is also less sensitive to non-gaussian distributions of data
\item In some cases, correlation value is high because of one extreme rank value.
Visual verification allows to define for each couple of covariates if the user
may consider correlation or not. Figures are grouped by correlation values
which accelerates the visual verification.
\item It is suggested to do a visual verification the first time data are
processed or to do a complete real exploration of your dataset before
running any model. This exploration may suggest to remove or combine
covariates before starting the modelling procedure. After that, you may be
able to define a thd value for covariate correlation limit.
\item Defining a high thd value may let some correlated covariates to appear in
the same model in the following of the procedure. Nevertheless, because the
procedure of this package is based on cross-validation, if two variables are
correlated they may likely have a low score as they will be as efficient as
covariate alone. Thus, if you hesitate between two thd values, choose the
higher one, as it will allow more models to pass through the selection procedure.
}
}
