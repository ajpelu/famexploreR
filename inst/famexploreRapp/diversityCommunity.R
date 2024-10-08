#' Diversity Indices for Plant Communities
#'
#' This function computes diversity indices for plant communities based on the 
#' specified method.
#'
#' @param x A list containing data frames
#'
#' @return A data frame with diversity indices for plant communities.
#'
#' @details The function first extracts the method used for data collection from 
#' the 'datos_generales' data frame. Based on the method, it selects the 
#' corresponding plant community data frame and calculates various diversity indices.
#'
#' @export

diversityCommunity <- function(x) {
  
  # Extract the method from general data 
  metodo <- x$datos_generales  |>
    dplyr::filter(campo == "comunidad_vegetal")  |>
    dplyr::pull(valor)
  
  # Select plan community dataset according to method 
  comunidad <- switch(
    metodo,
    "m\u00e9todo cobertura" = x$com_veg_cobertura,
    "m\u00e9todo contacto" = x$com_veg_contactos,
    "There is not data about plant community" = NULL
  )
  
  if (is.null(comunidad)) {
    cat("There is not data about plant community.\n")
    return(NULL)
  }
  
  # Prepare data 
  m <- comunidad |>
    stats::na.omit() |> 
    dplyr::select(referencia, especie_acomp, cobertura)  |>
    tidyr::pivot_wider(names_from = especie_acomp, values_from = cobertura)  
  
  # Caompute diversity indices 
  div_h <- vegan::diversity(m[-1], index = "shannon")
  richness <- vegan::specnumber(m[-1])
  div_simpson <- vegan::diversity(m[-1], index = "simpson")
  
  # Calcular la equidad de Pielou
  evenness <- div_h / log(richness)
  
  # Crear un data frame con los resultados
  out <- data.frame(
    referencia = unique(m$referencia),
    diversity_shannon = div_h,
    richness = richness,
    diversity_simpson = div_simpson,
    evenness_pielou = evenness
  )
  
  return(out)
}

