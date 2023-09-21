#' Generate Vecindad Plot
#'
#' This function generates a bar plot with error bars that visualizes the abundance
#' of neighboring species.
#'
#' @param x A data frame containing data for plotting.
#'   - `especie_vecina`: The neighboring species.
#'   - `ab_mean`: The mean abundance of the neighboring species.
#'   - `ab_se`: The standard error of the mean abundance.
#'
#' @return A bar plot with error bars.
#'
#' @importFrom ggplot2 ggplot geom_bar geom_errorbar labs theme_minimal theme coord_flip element_text
#'
#' @export
vecindadPlot <- function(x, ...){
 g <- ggplot(x, aes(x = especie_vecina, y = ab_mean)) +
    geom_bar(stat = "identity", fill = "blue") +
    geom_errorbar(aes(ymin = ab_mean - ab_se, 
                      ymax = ab_mean + ab_se),
                  width = 0.25, 
                  position = position_dodge(width = 0.9), 
                  colour = "blue") +
    labs(x = "Especie Vecina",
         y = "Abundancia (n. ind)") +
    theme_minimal() + 
    theme(axis.text.y = element_text(face = "italic")) + 
    coord_flip() +
    theme(
      axis.text = element_text(size = 16), 
      axis.title = element_text(size = 17)
    ) 
  
 return(g)
  
}