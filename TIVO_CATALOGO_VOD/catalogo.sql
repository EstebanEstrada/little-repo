SELECT DISTINCT pr.id as vod_id,
         pr.name as VOD_Name,
         pr.runtime as Minutes_duration,
         pr.director as Director,
         pr.cast as Cast_group,
         pr.description as Description,
         pr.year as Produced_year,
         -- pr.type AS TYPE,
         -- g.name AS Genre,
         o.price as Price,
         pr.created_at as Created_date,
         pr.updated_at as Last_modified_date,
         pr.external_id AS External_ID,
         o.id as Offer_id,
         -- o.is_archived AS is_archived,
         o.name as Offer_name,
         DATE_FORMAT(o.available_from,"%Y-%m-%dT%TZ") as Available_from_TVOD_FVOD,
         DATE_FORMAT(o.available_till,"%Y-%m-%dT%TZ") as Available_till_TVOD_FVOD,
         DATE_FORMAT(opa.available_from,"%Y-%m-%dT%TZ") as Available_from_SVOD,
         DATE_FORMAT(opa.available_till,"%Y-%m-%dT%TZ") as Available_till_SVOD,
         pr.is_adult as Adult,
         mpaa.name as MPAA_rating,
         vchip.name as VCHIP_rating,
         c.name as Category_name,
         c.category_path as Category_path,
         cv.category_id AS category_id,
         cv.vod_id AS vod_id
  FROM products pr
  INNER JOIN offers_products op on pr.id = op.product_id
  INNER JOIN offers o on o.id = op.offer_id
  LEFT OUTER JOIN offers_products_availabilities opa on pr.id = opa.product_id
  INNER JOIN categories_vods cv on pr.id = cv.vod_id
  INNER JOIN categories c on cv.category_id = c.id
  -- INNER JOIN genres_products gp on gp.product_id = pr.id
  -- INNER JOIN genres g ON g.id = gp.genre_id
  left outer join rating_systems mpaa on pr.mpaa_rating_id = mpaa.id
  left outer join rating_systems vchip on vchip.id = pr.vchip_rating_id
         WHERE pr.type = 'Vod'
     and pr.is_archived = 0
     -- AND cv.vod_id = '1511'
     -- and pr.id = '4'
     -- and pr.name = 'Miss Moon T01 EP20'
     and o.is_archived = 0
     -- group by pr.id;
ORDER BY c.position DESC
 -- ORDER BY pr.id ASC
