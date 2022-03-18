#' Slighe
#' 
#' Uses [path-to-regexp](https://www.npmjs.com/package/path-to-regexp).
#' 
#' @importFrom ambiorix as_path_to_pattern
#' 
#' @export
slighe <- function() {
  ambiorix::as_path_to_pattern(path_to_regex)
}

#' Path to Regex
#' 
#' @param path Path to convert.
#' 
#' @keywords internal
path_to_regex <- function(path){
  expr <- sprintf(
    "lib.pathToRegexp('%s', []);",
    path
  )
  regex <- ctx$eval(expr)
  gsub("^/|\\/i$", "", regex)
}
