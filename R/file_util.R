#' Find newest file in a folder
#'
#' Returns the path of most recently modified file in given folder.
#' @param folderpath a character vector of folder names
#' @param ... Parameters passed to list.files
#' @return A character vector
newest_file <- function(folderpath, ...) {
    if (!dir.exists(folderpath)) {
        msg <- paste0("Folder ", folderpath, " does not exist")
        stop(msg)
    }
    if (!length(list.files(folderpath))) {
        msg <- paste0("Folder ", folderpath, " contains no files")
        stop(msg)
    }
    args <- c(folderpath, list(...))
    files <- do.call(list.files, args)
    files[ which.max(file.info(files)$mtime) ]
}
