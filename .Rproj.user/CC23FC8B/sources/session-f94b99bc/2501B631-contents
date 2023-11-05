#' Generate a DNA String Set
#'
#' Create a DNA string set object using a DNA bin object to write and read a FASTA file.
#'
#' @import ape
#'
#' @param DNABin A DNA bin oibject
#' @param fileName An optional file name that will be saved to the directory
#'
#' @return A DNA string set
#' @export
#'
#' @examples # generate a DNA string set object using the taxon 'Antheraea polyphemus'
#'
#' specdf_Anth <- querySpecData("Antheraea polyphemus")[1:10,]
#'
#' DNABin_Anth <- genDNABin(specdf_Anth)
#'
#' DNAStringset_Anth <- genDNAStringSet(DNABin_Anth)
genDNAStringSet <- function(DNABin, fileName = "new_DNAString_file"){

  FASTA_fileName <- fileName

  FASTA_fileName.ext <- gsub(" ", "", paste(as.character(FASTA_fileName), ".fasta"))
  FASTA_fileName.ext <- as.character(FASTA_fileName.ext)

  ape::write.FASTA(x = ape::del.gaps(DNABin),
                   file = FASTA_fileName.ext
  )

  FASTA_strings <- Biostrings::readDNAStringSet(

    filepath = gsub(" ", "", paste(getwd(), "/", FASTA_fileName.ext)),

    format = "fasta"
  )

  return(FASTA_strings)

}
