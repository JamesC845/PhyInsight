#' Create a Phylogenetic Tree Object
#'
#' Create a phylo tree object using a manipulated DNA string set object.
#'
#' @import ape
#'
#' @param manipulated_stringset A manipulated string set object.
#'
#' @return A phylogenetic tree object
#' @export
#'
#' @examples # create and plot a phylo tree
#'
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
#' Phytree_Anth$edge.length <- Phytree_Anth$edge.length + (mean(Phytree_Anth$edge.length) * 0.1)
#'
#' plot(Phytree_Anth)
genPhytree <- function(manipulated_stringset){

  njTree <- ape::njs(
    ape::dist.dna(
      ape::as.DNAbin(manipulated_stringset)
    )
  )

  return(njTree)

}
