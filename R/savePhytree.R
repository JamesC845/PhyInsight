#' Save a Phylogenetic Tree Object
#'
#' Create a phylogenetic tree PDF using a phylo tree object and a specimen dataframe.
#'
#' @param phyloTree A phylo tree object
#' @param specimen_dataframe A specimen dataframe.
#' @param tree_file_name An optional character string to name the PDF file.
#' @param open_PDF A logical value to state whether to open the PDF file.
#' @param label_offset A numerical value to set the label offset distance.
#' @param label_size A numerical value to set the label size
#'
#' @return A PDF file.
#' @export
#'
#' @examples # create and plot a phylo tree
#' specdf_Anth <- querySpecData("Antheraea polyphemus")[1:10,]
#'
#' DNABin_Anth <- genDNABin(specdf_Anth)
#'
#' DNAStringset_Anth <- genDNAStringSet(DNABin_Anth)
#'
#' DNAStringSet_Anth_manipulated <- ManipStringSet(DNAStringset_Anth)
#'
#' Phytree_Anth <- genPhytree(DNAStringSet_Anth_manipulated)
#'
#' savePhytree(Phytree_Anth, specdf_Anth, "Anth_phylo_tree", 0.000055)
savePhytree <- function(phyloTree, specimen_dataframe, tree_file_name = "Phylogenetic Tree.pdf", open_PDF = T, label_offset = 0.000055, label_size = 0.3){


  ###
  phyloTree$edge.length <- phyloTree$edge.length + (mean(phyloTree$edge.length) * 0.1)


  ###
  phyloTree$tip.label <- paste(
    row.names(specimen_dataframe), "|",
    c(specimen_dataframe$species_name), "|",
    c(specimen_dataframe$country)
  )


  ###
  grDevices::pdf(tree_file_name, width = 12, height = 8)
  graphics::par(mar=c(0, 0, 0, 0))
  plot(
    phyloTree,
    cex = label_size,
    label.offset = label_offset
    #  label.offset = 0.000055
  )


  ###
  grDevices::dev.off()


  ### R command to open the file
  if(open_PDF == T){
    system(paste("open", shQuote(tree_file_name)))
  }


}
