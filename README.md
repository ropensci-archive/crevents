crevents
========



<!-- README.md is generated from README.Rmd. Please edit that file -->

[![Build Status](https://travis-ci.org/ropensci/crevents.svg?branch=master)](https://travis-ci.org/ropensci/crevents)

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
install.packages("devtools")
devtools::install_github("ropensci/crevents")
```


```r
library('crevents')
```

## query


```r
crev_query(rows = 10)
#> $status
#> [1] "ok"
#> 
#> $`message-type`
#> [1] "event-list"
#> 
#> $message
#> $message$`next-cursor`
#> [1] "7956fb94-9edb-4106-9e57-ac15eec67b60"
#> 
#> $message$`total-results`
#> [1] 441533755
#> 
#> $message$`items-per-page`
#> [1] 10
#> 
#> $message$events
#> # A tibble: 10 x 24
#>    license terms updated_reason updated obj_id source_token occurred_at subj_id
#>    <chr>   <chr> <chr>          <chr>   <chr>  <chr>        <chr>       <chr>  
#>  1 https:… http… https://evide… edited  https… 45a1ef76-4f… 2017-02-17… http:/…
#>  2 https:… http… https://evide… edited  https… 45a1ef76-4f… 2017-02-17… http:/…
#>  3 https:… http… https://evide… edited  https… 45a1ef76-4f… 2017-02-17… http:/…
#>  4 https:… http… https://evide… edited  https… 45a1ef76-4f… 2017-02-17… http:/…
#>  5 https:… http… https://evide… edited  https… 45a1ef76-4f… 2017-02-17… http:/…
#>  6 https:… http… https://evide… edited  https… 45a1ef76-4f… 2017-02-17… http:/…
#>  7 https:… http… https://evide… edited  https… 45a1ef76-4f… 2017-02-17… http:/…
#>  8 https:… http… https://evide… edited  https… 45a1ef76-4f… 2017-02-17… http:/…
#>  9 https:… http… https://evide… edited  https… 45a1ef76-4f… 2017-02-17… http:/…
#> 10 https:… http… https://evide… edited  https… 45a1ef76-4f… 2017-02-17… http:/…
#> # … with 16 more variables: id <chr>, evidence_record <chr>, action <chr>,
#> #   source_id <chr>, timestamp <chr>, updated_date <chr>,
#> #   relation_type_id <chr>, subj.pid <chr>, subj.title <chr>,
#> #   subj.issued <chr>, `subj.original-tweet-url` <chr>,
#> #   `subj.original-tweet-author` <chr>, `subj.alternative-id` <chr>,
#> #   subj.author.url <chr>, obj.pid <chr>, obj.url <chr>
```

Limit to events from Reddit


```r
x <- crev_query(rows = 10, source = "reddit")
x$message$events
#> # A tibble: 10 x 18
#>    license obj_id source_token occurred_at subj_id id    evidence_record terms
#>    <chr>   <chr>  <chr>        <chr>       <chr>   <chr> <chr>           <chr>
#>  1 https:… https… a6c9d511-92… 2016-01-16… https:… e37e… https://eviden… http…
#>  2 https:… https… a6c9d511-92… 2016-09-13… https:… c831… https://eviden… http…
#>  3 https:… https… a6c9d511-92… 2016-01-14… https:… 783b… https://eviden… http…
#>  4 https:… https… a6c9d511-92… 2016-09-13… https:… 61ce… https://eviden… http…
#>  5 https:… https… a6c9d511-92… 2014-09-14… https:… f0aa… https://eviden… http…
#>  6 https:… https… a6c9d511-92… 2014-09-12… https:… ca49… https://eviden… http…
#>  7 https:… https… a6c9d511-92… 2014-11-26… https:… c809… https://eviden… http…
#>  8 https:… https… a6c9d511-92… 2014-09-11… https:… bdfe… https://eviden… http…
#>  9 https:… https… a6c9d511-92… 2014-09-14… https:… 8412… https://eviden… http…
#> 10 https:… https… a6c9d511-92… 2016-01-13… https:… 3c49… https://eviden… http…
#> # … with 10 more variables: action <chr>, source_id <chr>, timestamp <chr>,
#> #   relation_type_id <chr>, subj.pid <chr>, subj.type <chr>, subj.title <chr>,
#> #   subj.issued <chr>, obj.pid <chr>, obj.url <chr>
```

## Meta

* Please [report any issues or bugs](https://github.com/ropensci/crevents/issues).
* License: MIT
* Get citation information for `crevents` in R doing `citation(package = 'crevents')`
* Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.

[![ropensci_footer](https://ropensci.org/public_images/github_footer.png)](https://ropensci.org)
