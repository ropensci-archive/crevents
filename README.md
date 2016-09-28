

`crevents`  Crossref events data client

Crossref Events Data docs - <http://eventdata.crossref.org/guide/#the-service>

## Installation


```r
install.packages("devtools")
devtools::install_github("ropenscilabs/crevents")
```


```r
library('crevents')
```

## examples


```r
res <- cred_occurred(date = '2016-08-27', source = 'twitter')
tibble::as_data_frame(res$events)
#> # A tibble: 7,511 × 15
#>                                       obj_id          occurred_at
#> *                                      <chr>                <chr>
#> 1  https://doi.org/10.1107/S2053229616013280 2016-08-27T00:00:05Z
#> 2  https://doi.org/10.1107/S2056989016013359 2016-08-27T00:00:05Z
#> 3  https://doi.org/10.1107/S2053229616012973 2016-08-27T00:00:05Z
#> 4  https://doi.org/10.1107/S2414314616013389 2016-08-27T00:00:05Z
#> 5  https://doi.org/10.1107/S241431461601316X 2016-08-27T00:00:05Z
#> 6  https://doi.org/10.1107/S2414314616012992 2016-08-27T00:00:06Z
#> 7  https://doi.org/10.1107/S205322961601281X 2016-08-27T00:00:06Z
#> 8  https://doi.org/10.1107/S2056989016013190 2016-08-27T00:00:05Z
#> 9  https://doi.org/10.1107/S2056989016013256 2016-08-27T00:00:06Z
#> 10 https://doi.org/10.1107/S2053229616013565 2016-08-27T00:00:06Z
#> # ... with 7,501 more rows, and 13 more variables: subj_id <chr>,
#> #   total <int>, id <chr>, message_action <chr>, source_id <chr>,
#> #   timestamp <chr>, relation_type_id <chr>, subj.pid <chr>,
#> #   subj.title <chr>, subj.issued <chr>, subj.URL <chr>, subj.type <chr>,
#> #   subj.author.literal <chr>
```


```r
res <- cred_collected(date = '2016-08-27', source = 'twitter')
tibble::as_data_frame(res$events)
#> # A tibble: 7,511 × 15
#>                                       obj_id          occurred_at
#> *                                      <chr>                <chr>
#> 1  https://doi.org/10.1107/S2053229616013280 2016-08-27T00:00:05Z
#> 2  https://doi.org/10.1107/S2056989016013359 2016-08-27T00:00:05Z
#> 3  https://doi.org/10.1107/S2053229616012973 2016-08-27T00:00:05Z
#> 4  https://doi.org/10.1107/S2414314616013389 2016-08-27T00:00:05Z
#> 5  https://doi.org/10.1107/S241431461601316X 2016-08-27T00:00:05Z
#> 6  https://doi.org/10.1107/S2414314616012992 2016-08-27T00:00:06Z
#> 7  https://doi.org/10.1107/S205322961601281X 2016-08-27T00:00:06Z
#> 8  https://doi.org/10.1107/S2056989016013190 2016-08-27T00:00:05Z
#> 9  https://doi.org/10.1107/S2056989016013256 2016-08-27T00:00:06Z
#> 10 https://doi.org/10.1107/S2053229616013565 2016-08-27T00:00:06Z
#> # ... with 7,501 more rows, and 13 more variables: subj_id <chr>,
#> #   total <int>, id <chr>, message_action <chr>, source_id <chr>,
#> #   timestamp <chr>, relation_type_id <chr>, subj.pid <chr>,
#> #   subj.title <chr>, subj.issued <chr>, subj.URL <chr>, subj.type <chr>,
#> #   subj.author.literal <chr>
```

## Meta

* Please [report any issues or bugs](https://github.com/ropenscilabs/crevents/issues).
* License: MIT
* Get citation information for `crevents` in R doing `citation(package = 'crevents')`
* Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.

[![ropensci_footer](http://ropensci.org/public_images/github_footer.png)](http://ropensci.org)
