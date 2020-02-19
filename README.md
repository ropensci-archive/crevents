crevents
========



<!-- README.md is generated from README.Rmd. Please edit that file -->

[![cran checks](https://cranchecks.info/badges/worst/crevents)](https://cranchecks.info/pkgs/crevents)
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Build Status](https://travis-ci.org/ropensci/crevents.svg?branch=master)](https://travis-ci.org/ropensci/crevents)
[![Build status](https://ci.appveyor.com/api/projects/status/1a17vr2045iygx8f?svg=true)](https://ci.appveyor.com/project/sckott/crevents)
[![rstudio mirror downloads](https://cranlogs.r-pkg.org/badges/crevents)](https://github.com/metacran/cranlogs.app)
[![cran version](https://www.r-pkg.org/badges/version/crevents)](https://cran.r-project.org/package=crevents)

`crevents`  Crossref events data R client

Crossref Events Data docs - <https://www.eventdata.crossref.org/guide/>

Package API:

- `crev_query()` - `/events` API route
- `crev_edited()` - `/events/edited` API route
- `crev_deleted()` - `/events/deleted` API route
- `crev_evrecs()` - helper to fetch evidence records JSON payloads

## Installation

stable version


```r
install.packages("crevents")
```

development version


```r
remotes::install_github("ropensci/crevents")
```


```r
library('crevents')
```

## query


```r
crev_query(rows = 3)
#> $status
#> [1] "ok"
#> 
#> $`message-type`
#> [1] "event-list"
#> 
#> $message
#> $message$`next-cursor`
#> [1] "68fb09a4-fb4b-492c-bce2-71f3e8880e4c"
#> 
#> $message$`total-results`
#> [1] 472054013
#> 
#> $message$`items-per-page`
#> [1] 3
#> 
#> $message$events
#> # A tibble: 3 x 24
#>   license terms updated_reason updated obj_id source_token occurred_at subj_id
#>   <chr>   <chr> <chr>          <chr>   <chr>  <chr>        <chr>       <chr>  
#> 1 https:… http… https://evide… edited  https… 45a1ef76-4f… 2017-02-17… http:/…
#> 2 https:… http… https://evide… edited  https… 45a1ef76-4f… 2017-02-17… http:/…
#> 3 https:… http… https://evide… edited  https… 45a1ef76-4f… 2017-02-17… http:/…
#> # … with 16 more variables: id <chr>, evidence_record <chr>, action <chr>,
#> #   source_id <chr>, timestamp <chr>, updated_date <chr>,
#> #   relation_type_id <chr>, subj.pid <chr>, subj.title <chr>,
#> #   subj.issued <chr>, `subj.original-tweet-url` <chr>,
#> #   `subj.original-tweet-author` <chr>, `subj.alternative-id` <chr>,
#> #   subj.author.url <chr>, obj.pid <chr>, obj.url <chr>
```

Limit to events from Reddit


```r
x <- crev_query(rows = 3, source = "reddit")
x$message$events
#> # A tibble: 3 x 18
#>   license obj_id source_token occurred_at subj_id id    evidence_record terms
#>   <chr>   <chr>  <chr>        <chr>       <chr>   <chr> <chr>           <chr>
#> 1 https:… https… a6c9d511-92… 2016-01-16… https:… e37e… https://eviden… http…
#> 2 https:… https… a6c9d511-92… 2016-09-13… https:… c831… https://eviden… http…
#> 3 https:… https… a6c9d511-92… 2016-01-14… https:… 783b… https://eviden… http…
#> # … with 10 more variables: action <chr>, source_id <chr>, timestamp <chr>,
#> #   relation_type_id <chr>, subj.pid <chr>, subj.type <chr>, subj.title <chr>,
#> #   subj.issued <chr>, obj.pid <chr>, obj.url <chr>
```

## Meta

* Please [report any issues or bugs](https://github.com/ropensci/crevents/issues).
* License: MIT
* Get citation information for `crevents` in R doing `citation(package = 'crevents')`
* Please note that this project is released with a [Contributor Code of Conduct][coc]. By participating in this project you agree to abide by its terms.

[![ropensci_footer](https://ropensci.org/public_images/github_footer.png)](https://ropensci.org)

[coc]: https://github.com/ropensci/crevents/blob/master/CODE_OF_CONDUCT.md
