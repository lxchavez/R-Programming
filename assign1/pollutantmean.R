pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  files_dir <- paste("~/Desktop/assign1/", directory, "/", sep = "")
  merged_data <- data.frame()
  for (file in list.files(files_dir))
  {
    file_number <- as.integer(strsplit(file, ".csv"))
    for (current_id in id)
    {
      if (file_number == current_id)
      {
        current_file <- read.csv(paste(files_dir, file, sep = ""))
        selected_data <- subset(current_file, ID == current_id)
        merged_data <- rbind(merged_data, selected_data)
      }
    }
  }
  pollutant_values <- merged_data[[pollutant]]
  mean(pollutant_values, na.rm = TRUE)
}