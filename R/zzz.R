ctx <- NULL
.onLoad <- function(...){
  ctx <<- V8::v8()
  ctx$source(
    system.file(
      "p2r.js",
      package = "slighe"
    )
  )
}