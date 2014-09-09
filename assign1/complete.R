complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  files_dir <- paste("~/Desktop/assign1/", directory, "/", sep = "")
  merged_data <- data.frame(id = 0, nobs = 0)
  for (current_id in id)
  {
    for (file in list.files(files_dir))
    {
      file_number <- as.integer(strsplit(file, ".csv"))
      if (file_number == current_id)
      {
        current_file <- read.csv(paste(files_dir, file, sep = ""))
        id_subset <- subset(current_file, ID == current_id)
        nobs <- nrow(id_subset[complete.cases(id_subset),])
        if (nobs != 0)
        {
          merged_data <- rbind(merged_data, c(file_number, nobs))
        }
      }
    }
  }
  merged_data[-1, ]
}