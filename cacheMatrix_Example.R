## Program     : Coursera - R Programming Peer Assessment - Matrix Inversion Caching Example
## Written By  : Gabriel Mohanna
## Date Created: Apr 25, 2014
## Narrative   : This is a demonestration of the makeCacheMatrix & cacheSolve.
##
## TBD         : None.
## 
## \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
## <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Code is Poetry >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
## ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
##
## ***********************************************************************************************************************
setwd("D:/Users/gmohanna/SkyDrive/Documents/HW/Coursera/R Programming/Programming Assignments/Peer Assessment")
source("cacheMatrix.R")

# Create matrix of 1,500 x 1,500
mtr.count <- 1500
iniMatrix <- matrix(runif(n=mtr.count**2, min=1, max=100), nrow=mtr.count, ncol=mtr.count)

# Calcuate time to solve inverse
print("Time to Calculate Inverse:")
system.time(solve(iniMatrix))

# Create matrix using makeCacheMatrix
print("Creating Cached Matrix:")
cchMatrix <- makeCacheMatrix(iniMatrix)

# Calcuate time to solve inverse: This should take about 3-4 seconds
print("Calculate Time to Invert Cached Matrix for 1st Time:")
system.time(cacheSolve(x=cchMatrix))

# Calcuate time to solve inverse: This should be instatancous
print("Calculate Time to Invert Cached Matrix for 2nd Time:")
system.time(cacheSolve(x=cchMatrix))

# Change matrix and calculate time to invert: This should take another 3-4 seconds
print("Changing Matrix Values:")
cchMatrix$set(matrix(runif(n=mtr.count**2, min=1, max=100), nrow=mtr.count, ncol=mtr.count))
system.time(cacheSolve(x=cchMatrix))
