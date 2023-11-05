#' Generate Diversity Index Statistics
#'
#' Calculates diversity index values for each site in a clusterised object.
#'
#' @import dplyr
#' @import vegan
#' @import geosphere
#'
#' @param clusterised_object An object created by the clusterise_sites function.
#'
#' @return A dataframe where each row pertains to a site and each column has higher taxa labels, time & location data, as well as diversity index values.
#' @export
#'
#' @examples # generate species count tables with a minimum of 30 individuals from 5 species
#'Colombia_Caquetá_dataframe <- subset(Colombia, stateProvince == "Caquetá")
#'
#'clusterised_Caquetá <- clusterise_sites(dataframe = Colombia_Caquetá_dataframe,
#'                                        cluster_min_length = 30,
#'                                        group_radius = 20000
#')
#'
#'stats_Caquetá <- generate_stats(clusterised_Caquetá)
#'
#'head(stats_Caquetá)
generate_stats <- function(clusterised_object){


  suppressWarnings({

    stats_dataframe <- clusterised_object[[2]]

    for(i in 1:length(clusterised_object[[1]])){
      stats_dataframe$date[i] <- clusterised_object[[1]][[i]]$date %>% unique
    }
    for(i in 1:length(clusterised_object[[1]])){
      stats_dataframe$year[i] <- clusterised_object[[1]][[i]]$year %>% unique
    }
    for(i in 1:length(clusterised_object[[1]])){
      stats_dataframe$month[i] <- clusterised_object[[1]][[i]]$month %>% unique
    }
    for(i in 1:length(clusterised_object[[1]])){
      stats_dataframe$day[i] <- clusterised_object[[1]][[i]]$day %>% unique
    }

    for(i in 1:length(clusterised_object[[1]])){
      stats_dataframe$site_group[i] <- clusterised_object[[1]][[i]]$site_group %>% unique
    }

    for(i in 1:length(clusterised_object[[1]])){
      stats_dataframe$country[i] <- clusterised_object[[1]][[i]]$country %>% unique
    }

    for(i in 1:length(clusterised_object[[1]])){
      stats_dataframe$stateProvince[i] <- clusterised_object[[1]][[i]]$stateProvince %>% unique
    }

    for(i in 1:length(clusterised_object[[1]])){
      stats_dataframe$kingdom[i] <- clusterised_object[[1]][[i]]$kingdom %>% unique
    }

    for(i in 1:length(clusterised_object[[1]])){
      stats_dataframe$phylum[i] <- clusterised_object[[1]][[i]]$phylum %>% unique
    }

    for(i in 1:length(clusterised_object[[1]])){
      stats_dataframe$class[i] <- clusterised_object[[1]][[i]]$class %>% unique
    }

    pielou <- function(shannon_index, composition_matrix){
      S <- specnumber(composition_matrix)
      J <- shannon_index/log(S)
      return(J)
    }

    margalef <- function(S, N){
      d = (S - 1) / log(N)
      return(d)

    }

    for (i in 1:length(clusterised_object[[1]])) {
      stats_dataframe$N[i] <- length(clusterised_object[[1]][[i]][[1]])
    }

    for(i in 1:length(clusterised_object[[1]])){
      stats_dataframe$S[i] <- clusterised_object[[1]][[i]]$scientificName %>% unique %>% length
    }

    for(i in 1:length(clusterised_object[[1]])){
      stats_dataframe$H[i] <- clusterised_object[[1]][[i]]$scientificName %>% table %>% diversity(index = "shannon")
    }

    for(i in 1:length(clusterised_object[[1]])){
      stats_dataframe$D[i] <- clusterised_object[[1]][[i]]$scientificName %>% table %>% diversity(index = "simpson")
    }

    for(i in 1:length(clusterised_object[[1]])){
      stats_dataframe$Dinv[i] <- clusterised_object[[1]][[i]]$scientificName %>% table %>% diversity(index = "invsimpson")
    }

    for(i in 1:length(clusterised_object[[1]])){
      stats_dataframe$d[i] <- margalef(
        S = clusterised_object[[1]][[i]]$scientificName %>% table %>% specnumber,
        N = clusterised_object[[1]][[i]]$scientificName %>% table %>% sum
      )
    }

    for(i in 1:length(clusterised_object[[1]])){
      stats_dataframe$J[i] <- pielou(
        clusterised_object[[1]][[i]]$scientificName %>% table %>% diversity(index = "shannon"),
        clusterised_object[[1]][[i]]$scientificName %>% table
      )
    }

    for(i in 1:length(clusterised_object[[2]][,1])){

      stats_dataframe$day_length[i] <- geosphere::daylength(lat = clusterised_object[[2]][i,]$latitude,
                                                            doy = clusterised_object[[1]][[i]]$date %>% unique)

    }

    return(stats_dataframe)

  })

}
