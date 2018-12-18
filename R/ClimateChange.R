# Climate-Change
# R package to explore climate change related to global temperature changes over time.
# Data Visualization| University of Illinois at Urbana Champaign | Fall 2017
# Created by Tony Gojanovic

#' Import GISSTEMP data
#' 
#' @description This function imports a file formatted CSV file.
#' @details Current data sets for modeling climate change can be found at the following address in csv formats:
#' \url{https://data.giss.nasa.gov/gistemp/}
#' @param filename Filename in csv format to be read. The file must be located in the working directory.
#' @import readr
#' @return Returns a data frame from an Excel file into a data frame.
#' @examples 
#' # Download ExcelFormattedGISTEMPData2CSV.csv file to your working directory to play with the data.
#' # Returns a dataframe with the default name "gisstemp" which can be used for line or bar plots.
#' \dontrun{
#' 
#' library(readr)
#' df<-import_gisstemp("ExcelFormattedGISTEMPData2CSV.csv")
#' 
#' }

import_gisstemp<-function(filename){
  gisstemp <- read_csv(filename)
}

#' Simple Line Chart with Loess Smoother Global Temperature Anomalies
#' 
#' @description
#' This function creates a simple line chart with a loess smoother of global temperature anomalies.
#' @return An line plot with a loess smoother.
#' @import ggplot2 
#' @note The plot is formatted for data sets found in Inst > Data > Extdata > ExcelFormattedGISTEMPData2CSV.csv
#' @references  Current data sets can be found at \url{https://data.giss.nasa.gov/gistemp/}
#' @examples 
#' \dontrun{
#' 
#' # Use the dataframe name from the import routine.
#' 
#' library(readr)
#' df<-import_gisstemp("ExcelFormattedGISTEMPData2CSV.csv")
#' library(ggplot2)
#' climate_line_plot(df) 
#' 
#' }   
#' 

climate_line_plot<-function(filename){
  
  p1<-ggplot(filename,aes(Year,Glob))+
    geom_point(aes(color=Glob))+
    geom_smooth(method="loess")+
    ggtitle("Global Absolute Temperature Anomalies - Average Temp. Anomaly over Northern and Southern Hemispheres")+
    xlab("Measurement Year")+
    ylab("Average Temperature Anomaly degrees F")+
    scale_y_continuous(breaks = seq(-50, 100, by = 5))+
    scale_x_continuous(breaks = seq(1880, 2014, by = 10))+
    scale_color_gradient(low="blue", high="darkorange", name = "avg deg F")
    p1
}

#' Simple Bar Chart of Global Temperature Anomalies
#' 
#' @description
#' This function creates a bar chart of global temperature anomalies.
#' @return A bar plot.
#' @import ggplot2 
#' @note The plot is formatted for data sets found in Inst > Data > Extdata > ExcelFormattedGISTEMPData2CSV.csv
#' @references  Current data sets can be found at \url{https://data.giss.nasa.gov/gistemp/}
#' @examples 
#' \dontrun{
#' 
#' # Use the dataframe name from the import routine.
#' 
#' library(readr)
#' df<-import_gisstemp("ExcelFormattedGISTEMPData2CSV.csv")
#' library(ggplot2)
#' climate_bar_plot(df) 
#' 
#' }   
#'

climate_bar_plot<-function(filename){
    p1<- ggplot(filename,aes(Year,Glob))+
      geom_bar(stat="identity",aes(fill=Glob))+
      ggtitle("Global Absolute Temperature Anomalies - Average Temp.Anomaly over Northern and Southern Hemispheres")+
      xlab("Measurement Year")+ 
      ylab("Average Temperature Anomaly degrees F")+
      scale_y_continuous(breaks = seq(-50, 80, by = 5))+
      scale_x_continuous(breaks = seq(1880, 2014, by = 10))+
      scale_fill_gradient(low="darkcyan", high="darkorange", name = "avg deg F")
      p1
}    

#' Import GISSTEMP data for Streamgraphs
#' 
#' @description This function imports a specific Excel file formated file for building an interactive streamgraph.
#' @details Current data sets for modeling climate change can be found at the following address in csv formats:
#' \url{https://data.giss.nasa.gov/gistemp/}
#' @param filename Filename in xlsx format to be read. The file must be located in the working directory.
#' @import readxl
#' @return Returns a data frame from an Excel file into a data frame.
#' @examples 
#' # Download region2.xlsx file to your working directory to play with the data.
#' # Returns a dataframe with the default name "region2" which can be used for an interactive streamgraph.
#' \dontrun{
#' 
#' library(readxl)
#' df<-import_gisstemp_streamgraph("region2.xlsx")
#' 
#' }

import_gisstemp_streamgraph<-function(filename){
region2 <- read_excel(filename)
}

#' Stream graph with zero offset
#' 
#' @description This function creates an interactive streamgraph with zero offset (e.g. a bar plot)
#' @details This function uses library(streamgraph).
#' @param filename Filename is a dataframe that was imported for region2.xlsx
#' @import streamgraph
#' @return Returns a streamgraph interpretation of a bar plot.
#' @examples 
#' # Download region2.xlsx file to your working directory to play with the data.
#' # Returns a dataframe with the default name "region2" which can be used for an interactive streamgraph.
#' \dontrun{
#' 
#' library(streamgraph)
#' library(readxl)
#' df<-import_gisstemp_streamgraph("region2.xlsx")
#' stream_graph_bar(df)
#' 
#' }

stream_graph_bar<-function(filename){
  region2 %>%
    streamgraph("region", "temp", "year", offset="zero", interpolate="cardinal") %>%
    sg_axis_x(1, "year", "%Y")%>%
    sg_fill_brewer("Spectral")%>% 
    sg_legend(TRUE, "Zonal Region: ")
}

#' Stream graph with a non zero offset
#' 
#' @description This function creates an interactive streamgraph with a non zero offset.
#' @details This function uses library(streamgraph).
#' @param filename Filename is a dataframe that was imported for region2.xlsx
#' @import streamgraph
#' @return Returns a streamgraph interpretation of a bar plot.
#' @examples 
#' # Download region2.xlsx file to your working directory to play with the data.
#' # Returns a dataframe with the default name "region2" which can be used for an interactive streamgraph.
#' \dontrun{
#' 
#' library(streamgraph)
#' library(readxl)
#' df<-import_gisstemp_streamgraph("region2.xlsx")
#' stream_graph_non_zero(df)
#' 
#' }

stream_graph_non_zero<-function(filename){
  region2 %>%
    streamgraph("region", "temp", "year", interpolate="cardinal") %>%
    sg_axis_x(1, "year", "%Y")%>%
    sg_fill_brewer("Spectral")%>% 
    sg_legend(TRUE, "Zonal Region: ")
}
