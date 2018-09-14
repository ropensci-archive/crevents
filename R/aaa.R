fxn_factory <- function(endpoint) {

  crev_query <- function(rows = 1000L, cursor = NULL, source = NULL,
    from_updated_date = NULL, until_updated_date = NULL, 
    from_collected_date = NULL, until_collected_date = NULL, 
    from_occurred_date = NULL, until_occurred_date = NULL, obj_id = NULL, 
    obj_id_prefix = NULL, subj_id = NULL, subj_id_prefix = NULL, 
    subj_id_domain = NULL, obj_id_domain = NULL, subj_url = NULL, 
    obj_url = NULL, subj_url_domain = NULL, obj_url_domain = NULL, 
    subj_alternative_id = NULL, obj_alternative_id = NULL, 
    relation = NULL, facet = NULL, ...) {
    
    args <- cmp(list(rows = rows, cursor = cursor, source = source, 
      `from-updated-date` = from_updated_date, 
      `from-collected-date` = from_collected_date,
      `from-occurred-date` = from_occurred_date, 
      `until-updated-date` = until_updated_date, 
      `until-collected-date` = until_collected_date,
      `until-occurred-date` = until_occurred_date, 
      `obj-id` = obj_id, `obj-id.prefix` = obj_id_prefix,
      `subj-id` = subj_id, `subj-id.prefix` = subj_id_prefix, 
      `subj-id.domain` = subj_id_domain, `obj-id.domain` = obj_id_domain, 
      `subj.url` = subj_url, `obj.url` = obj_url, 
      `subj.url.domain` = subj_url_domain, `obj.url.domain` = obj_url_domain, 
      `subj.alternative-id` = subj_alternative_id, 
      `obj.alternative-id` = obj_alternative_id, relation = relation,
      facet = facet, mailto = get_email()))
    set_df(
      crev_GET(endpoint = endpoint, args = args, ...)
    )
  }

}
