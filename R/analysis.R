# Daily work habit: Restart R very often and re-run your under-development script from the top.
# Restart R Ctrl+Shift+F10
# Re-run all code up to the current line with Ctrl+Alt+B

### LIBRARIES
{

## Aanroepen van libraries
library(tidyverse)
library(styler)
library(readxl)
  library(palmerpenguins)
?palmerpenguins  
## Citeren
  
# R 
  # citation()
  
# library's
  # citation("tidyverse")
  # citation("styler")
  # citation("readxl")

  citation("palmerpenguins")
}


### LOAD DATA
{
  data <- readRDS("C:/Users/wimva/OneDrive/Wim van Saase/Privé/Ontwikkeling Wim/R/productive-r-workflow/input/data_clean.rds")
}
 

### EXPLORE DATA
{
  # Samenvatting per kolom
    {
    summary(data)
    }
    
  # Unieke waarde van categoriale variabelen
    {
    unique(data$species)
    unique(data$island)
    unique(data$sex)
    unique(data$year)
    }
    
  # Aantallen diverse doorsnedes
    {
    data %>% count(island,sort=TRUE)
    data %>% count(species,sort=TRUE)
    data %>% count(year)
    data %>% count(species,year)
    data %>% count(island,species,sort=TRUE)
    data %>% count(species,island,sort=TRUE)
    data %>% count(island,year,species)
    
  # simpele visualisatie
      ggplot(data = data,
           aes(species,fill=species))+
      geom_bar() +
      facet_grid(vars(island), vars(year)) +
      theme(
        legend.position="none",
        panel.spacing = unit(0.1, "lines"),
        axis.ticks.x=element_blank()
      )
}
}


### Functies aanroepen vanuit andere file 
source("C:/Users/wimva/OneDrive/Wim van Saase/Privé/Ontwikkeling Wim/R/productive-r-workflow/input/Functies.R")
  
  
### Diverse functies gebruiken
{
  # gebruik functie 1 F1
  calc_mean_bill_species_Island("Adelie","Dream")
  
    # unique(data$species) "Adelie"    "Gentoo"    "Chinstrap"
    # unique(data$island) "Torgersen" "Biscoe"    "Dream" 
    # data %>% count(species,island,sort=TRUE) voor een tabel met combinaties van namen en aantallen.
     
      
  # Gebruik functie 2 F2
  create_scatterplot(data, "Adelie", "Torgersen")
   
     
  # Gebruik functie 3 F3 Call the function for each island
  calc_mean_bill_species_Island_and_Plot("Adelie","Biscoe")
  
  }
  

### PLOT DATA
{
# Plot
penguins_clean <- na.omit(data)
plot(penguins_clean$bill_length_mm, penguins_clean$bill_depth_mm, type = "n", xlab = "Bill Length (mm)", ylab = "Bill Depth (mm)", main = "Penguin Bill Dimensions")
points(
  penguins_clean$bill_length_mm[penguins_clean$species == "Adelie"], penguins_clean$bill_depth_mm[penguins_clean$species == "Adelie"],
  col = "red", pch = 16
)
points(penguins_clean$bill_length_mm[penguins_clean$species == "Chinstrap"], penguins_clean$bill_depth_mm[penguins_clean$species == "Chinstrap"], col = "green", pch = 17)
points(penguins_clean$bill_length_mm[penguins_clean$species == "Gentoo"],
  penguins_clean$bill_depth_mm[penguins_clean$species == "Gentoo"],
  col = "blue", pch = 18
)
legend("topright",
  legend = unique(penguins_clean$species),
  col = c(
    "red",
    "green",
    "blue"
  ), pch = c(16, 17, 18)
)
}
  


