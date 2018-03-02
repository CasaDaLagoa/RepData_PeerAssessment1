# Check if the data are available or the run_all flag exists.
# If not, prepare the tidy data
if ( !exists("activity") || exists("run_all") ) {
        destfile <- "./activity.zip" 
        # Check if the raw data file are there, otherwise download from te source
        if (!file.exists(destfile) || exists("run_all")) {
                fileURL  <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2Factivity.zip"   
                download.file(fileURL ,destfile,method="auto") 
                rm("fileURL")
        }
        # Create a dataset with raw data
        activity <- read.table(unz(destfile, "activity.csv"), sep = ",", header = TRUE, na.strings = "NA")
        rm("destfile")
}



