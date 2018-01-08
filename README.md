crevents
========



[![Build Status](https://travis-ci.org/ropenscilabs/crevents.svg?branch=master)](https://travis-ci.org/ropenscilabs/crevents)

`crevents`  Crossref events data R client

Crossref Events Data docs - <https://www.eventdata.crossref.org/guide/index.html>

## Installation


```r
install.packages("devtools")
devtools::install_github("ropenscilabs/crevents")
```


```r
library('crevents')
```

## query


```r
cred_query(rows = 10)
#> $status
#> [1] "ok"
#> 
#> $`message-type`
#> [1] "event-list"
#> 
#> $message
#> $message$`next-cursor`
#> [1] "355eb688-f526-46a6-9396-993c12cc313c"
#> 
#> $message$`total-results`
#> [1] 69116172
#> 
#> $message$`items-per-page`
#> [1] 10
#> 
#> $message$events
#> # A tibble: 10 x 21
#>    lice… obj_… sour… occu… subj… id    evid… terms acti… sour… time… rela…
#>  * <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr>
#>  1 http… http… 45a1… 2017… http… 90dd… /evi… http… add   twit… 2017… disc…
#>  2 http… http… 45a1… 2017… http… 68fb… /evi… http… add   twit… 2017… disc…
#>  3 http… http… 45a1… 2017… http… 6273… /evi… http… add   twit… 2017… disc…
#>  4 http… http… 45a1… 2017… http… 4a41… /evi… http… add   twit… 2017… disc…
#>  5 http… http… 45a1… 2017… http… 3bb6… /evi… http… add   twit… 2017… disc…
#>  6 http… http… 45a1… 2017… http… 1156… /evi… http… add   twit… 2017… disc…
#>  7 http… http… 45a1… 2017… http… d5a8… /evi… http… add   twit… 2017… disc…
#>  8 http… http… 45a1… 2017… http… 48a5… /evi… http… add   twit… 2017… disc…
#>  9 http… http… 45a1… 2017… http… 49a6… /evi… http… add   twit… 2017… disc…
#> 10 http… http… 45a1… 2017… http… 355e… /evi… http… add   twit… 2017… disc…
#> # ... with 9 more variables: subj.pid <chr>, subj.title <chr>, subj.issued
#> #   <chr>, `subj.original-tweet-url` <chr>, `subj.original-tweet-author`
#> #   <chr>, `subj.alternative-id` <chr>, subj.author.url <chr>, obj.pid
#> #   <chr>, obj.url <chr>
```

Limit to events from Reddit


```r
x <- cred_query(rows = 10, filter = list(source = "reddit"))
x$message$events
#> # A tibble: 10 x 18
#>    lice… obj_… sour… occu… subj… id    evid… terms acti… sour… time… rela…
#>  * <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr>
#>  1 http… http… a6c9… 2016… http… e37e… http… http… add   redd… 2017… disc…
#>  2 http… http… a6c9… 2016… http… c831… http… http… add   redd… 2017… disc…
#>  3 http… http… a6c9… 2016… http… 783b… http… http… add   redd… 2017… disc…
#>  4 http… http… a6c9… 2016… http… 61ce… http… http… add   redd… 2017… disc…
#>  5 http… http… a6c9… 2014… http… f0aa… http… http… add   redd… 2017… disc…
#>  6 http… http… a6c9… 2014… http… ca49… http… http… add   redd… 2017… disc…
#>  7 http… http… a6c9… 2014… http… c809… http… http… add   redd… 2017… disc…
#>  8 http… http… a6c9… 2014… http… bdfe… http… http… add   redd… 2017… disc…
#>  9 http… http… a6c9… 2014… http… 8412… http… http… add   redd… 2017… disc…
#> 10 http… http… a6c9… 2016… http… 3c49… http… http… add   redd… 2017… disc…
#> # ... with 6 more variables: subj.pid <chr>, subj.type <chr>, subj.title
#> #   <chr>, subj.issued <chr>, obj.pid <chr>, obj.url <chr>
```

## Meta

* Please [report any issues or bugs](https://github.com/ropenscilabs/crevents/issues).
* License: MIT
* Get citation information for `crevents` in R doing `citation(package = 'crevents')`
* Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.

[![ropensci_footer](https://ropensci.org/public_images/github_footer.png)](https://ropensci.org)
