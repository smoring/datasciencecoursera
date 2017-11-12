corr <- function(directory, threshold = 0) {
    files_list <- list.files(directory, full.names=TRUE)
    vec <- vector(mode="numeric")
    #puts complete cases from files with threshold of complete cases into new data frame
    for(file in files_list) {
        readfile <- read.csv(file)
        if (nrow(readfile[complete.cases(readfile), ]) > threshold) {
            complete <- readfile[complete.cases(readfile), ]
            vec <- c(vec, cor(complete[['sulfate']], complete[['nitrate']]))
        }
    }
    vec
}