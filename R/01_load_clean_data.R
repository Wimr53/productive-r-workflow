### LOAD DATA, LET OP col_types nav samenvatting

### LIBRARIES
{
# Via CSV
# data <- read.csv("C:/Users/wimva/OneDrive/Wim van Saase/Privé/Ontwikkeling Wim/R/productive-r-workflow/input/data.csv",header = TRUE)
# Write the data frame to a CSV file using a different delimiter (semicolon)
# Deze kwam eerst van het web maar zit nu in de folders voor een SELF CONTAINED PROJECT
# write.csv(data, file = "C:/Users/wimva/OneDrive/Wim van Saase/Privé/Ontwikkeling Wim/R/productive-r-workflow/input/data.csv", row.names = FALSE)
# writexl(data, file = "C:/Users/wimva/OneDrive/Wim van Saase/Privé/Ontwikkeling Wim/R/productive-r-workflow/input/data.csv", row.names = FALSE)
# Via XLSX, "library(readxl)"
# citation("readxl")
# Eventueel onbekende waarde wissen uit de set: "clean <- na.omit(data)"
  }

library(readxl)

### DATA LADEN

    data <- read_excel("C:/Users/wimva/OneDrive/Wim van Saase/Privé/Ontwikkeling Wim/R/productive-r-workflow/input/data.xlsx",
                     sheet = 1,
                     col_types = c(
                       "text",
                       "text",
                       "numeric",
                       "numeric",
                       "numeric",
                       "numeric",
                       "text",
                       "text"
                     ),
                     na = "NA",
  )

### EVENTUEEL VERDER OPSCHONEN...

### OPSLAAN NAAR EFFICIENT BESTANDSTYPE
{
  # R provides the efficient .rds format for storing R objects. 
  # This format can be conveniently used to save and subsequently load data using the saveRDS() and readRDS() functions. 
  # 17kb for the penguin .xlsx file. 
  # 3kb for the .rds equivalent! 
  # The .rds format is lightweight and fast, offering a more efficient alternative to traditional CSV files.
}

saveRDS(data, file = "C:/Users/wimva/OneDrive/Wim van Saase/Privé/Ontwikkeling Wim/R/productive-r-workflow/input/data_clean.rds" )
