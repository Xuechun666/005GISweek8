 
library(tidyverse)
library(tmap)
library(plotly)
library(broom)
install.packages("broom")
library(mapview)
library(sf)
library(sp)
library(spdep)
library(car)
library(fs)
library(janitor)
library(usethis)
use_github()

download.file("https://data.london.gov.uk/download/statistical-gis-boundary-files-london/9ba8c833-6370-4b11-abdc-314aa020d5e0/statistical-gis-boundaries-london.zip", 
              destfile="prac7_data/statistical-gis-boundaries-london.zip")

Hidelibrary(fs)
listfiles<-dir_info(here::here("prac7_data")) %>%
  dplyr::filter(str_detect(path, ".zip")) %>%
  dplyr::select(path)%>%
  pull()%>%
  #print out the .gz file
  print()%>%
  as.character()%>%
  utils::unzip(exdir=here::here("prac7_data"))

Hide#look what is inside the zip

Londonwards<-fs::dir_info(here::here("prac7_data", 
                                     "statistical-gis-boundaries-london", 
                                     "ESRI"))%>%
  #$ means exact match
  dplyr::filter(str_detect(path, 
                           "London_Ward_CityMerged.shp$"))%>%
  dplyr::select(path)%>%
  dplyr::pull()%>%
  #read in the file in
  sf::st_read()

