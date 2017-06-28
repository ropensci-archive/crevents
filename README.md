crevents
========



[![Build Status](https://travis-ci.org/ropenscilabs/crevents.svg?branch=master)](https://travis-ci.org/ropenscilabs/crevents)

`crevents`  Crossref events data client

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
#> [1] 14206534
#> 
#> $message$`items-per-page`
#> [1] 10
#> 
#> $message$events
#> # A tibble: 10 x 21
#>                                               license
#>  *                                              <chr>
#>  1 https://creativecommons.org/publicdomain/zero/1.0/
#>  2 https://creativecommons.org/publicdomain/zero/1.0/
#>  3 https://creativecommons.org/publicdomain/zero/1.0/
#>  4 https://creativecommons.org/publicdomain/zero/1.0/
#>  5 https://creativecommons.org/publicdomain/zero/1.0/
#>  6 https://creativecommons.org/publicdomain/zero/1.0/
#>  7 https://creativecommons.org/publicdomain/zero/1.0/
#>  8 https://creativecommons.org/publicdomain/zero/1.0/
#>  9 https://creativecommons.org/publicdomain/zero/1.0/
#> 10 https://creativecommons.org/publicdomain/zero/1.0/
#> # ... with 20 more variables: obj_id <chr>, source_token <chr>,
#> #   occurred_at <chr>, subj_id <chr>, id <chr>, evidence_record <chr>,
#> #   terms <chr>, action <chr>, source_id <chr>, timestamp <chr>,
#> #   relation_type_id <chr>, subj.pid <chr>, subj.title <chr>,
#> #   subj.issued <chr>, `subj.original-tweet-url` <chr>,
#> #   `subj.original-tweet-author` <chr>, `subj.alternative-id` <chr>,
#> #   subj.author.url <chr>, obj.pid <chr>, obj.url <chr>
```

Limit to events from Reddit


```r
x <- cred_query(rows = 10, filter = list(source = "reddit"))
x$message$events
#> # A tibble: 10 x 18
#>                                               license
#>  *                                              <chr>
#>  1 https://creativecommons.org/publicdomain/zero/1.0/
#>  2 https://creativecommons.org/publicdomain/zero/1.0/
#>  3 https://creativecommons.org/publicdomain/zero/1.0/
#>  4 https://creativecommons.org/publicdomain/zero/1.0/
#>  5 https://creativecommons.org/publicdomain/zero/1.0/
#>  6 https://creativecommons.org/publicdomain/zero/1.0/
#>  7 https://creativecommons.org/publicdomain/zero/1.0/
#>  8 https://creativecommons.org/publicdomain/zero/1.0/
#>  9 https://creativecommons.org/publicdomain/zero/1.0/
#> 10 https://creativecommons.org/publicdomain/zero/1.0/
#> # ... with 17 more variables: obj_id <chr>, source_token <chr>,
#> #   occurred_at <chr>, subj_id <chr>, id <chr>, evidence_record <chr>,
#> #   terms <chr>, action <chr>, source_id <chr>, timestamp <chr>,
#> #   relation_type_id <chr>, subj.pid <chr>, subj.type <chr>,
#> #   subj.title <chr>, subj.issued <chr>, obj.pid <chr>, obj.url <chr>
```

## Meta

* Please [report any issues or bugs](https://github.com/ropenscilabs/crevents/issues).
* License: MIT
* Get citation information for `crevents` in R doing `citation(package = 'crevents')`
* Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.

[![ropensci_footer](https://ropensci.org/public_images/github_footer.png)](https://ropensci.org)
