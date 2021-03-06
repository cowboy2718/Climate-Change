% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ClimateChange.R
\name{import_gisstemp_streamgraph}
\alias{import_gisstemp_streamgraph}
\title{Import GISSTEMP data for Streamgraphs}
\usage{
import_gisstemp_streamgraph(filename)
}
\arguments{
\item{filename}{Filename in xlsx format to be read. The file must be located in the working directory.}
}
\value{
Returns a data frame from an Excel file into a data frame.
}
\description{
This function imports a specific Excel file formated file for building an interactive streamgraph.
}
\details{
Current data sets for modeling climate change can be found at the following address in csv formats:
\url{https://data.giss.nasa.gov/gistemp/}
}
\examples{
# Download region2.xlsx file to your working directory to play with the data.
# Returns a dataframe with the default name "region2" which can be used for an interactive streamgraph.
\dontrun{

library(readxl)
df<-import_gisstemp_streamgraph("region2.xlsx")

}
}
