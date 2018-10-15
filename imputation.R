rm(list=ls())
library(readr)
library(mice)

communities = read_csv('communities.data', na = '?')
mice_imputes = mice(communities, m=5, maxit = 100)
