corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  files_dir <- paste("~/R-Programming/assign1/", directory, "/", sep = "")
  observed_cases <- complete(directory)
  threshold_filter <- observed_cases[observed_cases$nobs > threshold, ]
  ids <- threshold_filter$id

  results <- numeric(0)
  
  for (id in ids)
  {
    for (file in list.files(files_dir))
    {
      file_number <- as.integer(strsplit(file, ".csv"))
      if (file_number == id)
      {
        current_file <- read.csv(paste(files_dir, file, sep = ""))
        correlation <- cor(current_file$sulfate, current_file$nitrate, use = "complete.obs")
        results <- c(results, correlation)
      }
    }
  }
  
  return (results)
}