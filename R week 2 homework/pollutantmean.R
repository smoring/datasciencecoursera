pollutantmean <- function(directory, pollutant, id=1:332) {
    files_list <- list.files(directory, full.names=TRUE)
    dat <- data.frame()
    for(i in id) {
        dat <- rbind(dat, read.csv(files_list[i]))
    }
    mean(dat[, pollutant], na.rm=TRUE)
}

complete<- function(directory, id=1:332) {
    files_list <- list.files(directory, full.names=TRUE)
    dat <- data.frame()
    for(i in id) {
        dat <- rbind(dat, read.csv(files_list[i]))
    }
    dat_subset <- dat[complete.cases(dat), ]
    count <- which(dat_subset[, "ID"] %in% id)
    nobs=length(count)
    df = data.frame(id, nobs)
    df
}

