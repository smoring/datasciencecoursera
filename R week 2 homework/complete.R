complete<- function(directory, id=1:332) {
    #creates list of files
    files_list <- list.files(directory, full.names=TRUE)
    #creates new data frame for files to go into
    dat <- data.frame()
    #puts all files into one big data frame
    for(i in id) {
        dat <- rbind(dat, read.csv(files_list[i]))
    }
    #creates new data frame w/ only complete cases
    dat_subset <- dat[complete.cases(dat), ]
    nobs <- c()
    #create "nobs" vector with number of complete cases for each monitor
    for (i in id) {
        nobs <- c(nobs, length(which(dat_subset[, "ID"] == i)))
    }
    results = data.frame(id, nobs)
    results
}
