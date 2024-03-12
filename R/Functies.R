### SEPARAAT SCRIPT VOOR FUNCTIES

# Functie 1 gemiddelde berekenen

F1_calc_mean_bill_species_Island <- function(species_name, island_name) {
  filtered_data <- subset(na.omit(data), species == species_name & island == island_name)
  mean_bill_length <- mean(filtered_data$bill_length_mm)
  return(round(mean_bill_length, 2))
}

# Functie 2 plot function

F2_create_scatterplot <- function(data, selected_species, selected_island) {
  # Filter the data for the specified species and island
  filtered_data <- data %>%
    na.omit() %>%
    filter(species == selected_species, island == selected_island)
  
  # Create the scatterplot
  plot <- ggplot(
    filtered_data,
    aes(x = bill_length_mm, y = bill_depth_mm, color = species, shape = species)
  ) +
    geom_point() +
    labs(
      x = "Bill Length (mm)",
      y = "Bill Depth (mm)",
      title = paste("Penguin Bill Dimensions -", selected_species, "-", selected_island)
    )
  
  return(plot)
}


# Functie 3 COMBINEREN VAN FUNCTIES

  # Functie gemiddelde berekenen Gecombineerd met de PLOT, zie dat er voor de data gebruik kan worden gemaakt van 1) gefilterde data of 2) een subset!
  F3_calc_mean_bill_species_Island_and_Plot <- function(species_name, island_name) {
    
    #Data filteren  
    filtered_data <- subset(na.omit(data), 
                            species == species_name &
                              island == island_name)
    
    #Gemiddelde berekenen
    mean_bill_length <- mean(filtered_data$bill_length_mm)
    
    #Plot maken
    plot <- ggplot(filtered_data,
                   aes(x = bill_length_mm, 
                       y = bill_depth_mm, 
                       color = species, 
                       shape = species)
    ) +
      geom_point() +
      labs(
        x = "Bill Length (mm)",
        y = "Bill Depth (mm)",
        title = paste("Penguin Bill Dimensions -", 
                      species_name,
                      "-", 
                      island_name)
      )
    
    #Output van Gemiddelde en Plot combineren
    OUTPUT <- list(round(mean_bill_length,2),
                   plot)
    
    #Output via reurn
    return(OUTPUT)
  }
  
  # Call the function for each island
  # calc_mean_bill_species_Island_and_Plot("Adelie","Biscoe")
  
  # unique(data$species) "Adelie"    "Gentoo"    "Chinstrap"
  # unique(data$island) "Torgersen" "Biscoe"    "Dream" 

