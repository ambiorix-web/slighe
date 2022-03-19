<!-- badges: start -->
<!-- badges: end -->

# slighe

Improved path matching for [ambiorix](https://ambiorix.dev) with
[path-to-regexp](https://www.npmjs.com/package/path-to-regexp)

:traffic_light: __Lengthy Explanation__

Internally ambiorix must match paths with patterns.
That is, if the user wants to handle `app$get("/:path")`
(see parameters) then regular expressions must be used.
The current implementation works for probably 99% of cases
but in rare places you may encounter some issues.

This is because the job of converting paths to patterns
is complicated. 
The Django framework does not do that for instance and require
the user to enter a valid regular expression as path.
Express.js uses
[path-to-regexp](https://www.npmjs.com/package/path-to-regexp)
which is very robust but also complex; it's a lexer, parser,
and compiler.

Therefore it may take some time before ambiorix sees such
a robust implementation: {slighe} is here to fill the gap
in the meantime.
It's not part of the main package since it requires an 
installation of the V8 engine.

## Installation

You can install the development version of slighe like so:

``` r
# install.packages("remotes")
remotes::install_github("devOpifex/slighe")
```

## Example

Simply pass it to the `use` method.

``` r
library(slighe)
library(ambiorix)

app <- Ambiorix$new()

# use slighe
app$use(slighe())

app$get("/", \(req, res) {
  res$send("Hello")
})

app$get("/:hash", \(req, res) {
  res$send("world")
})

app$start()
```

