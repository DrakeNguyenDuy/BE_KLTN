-- get all item with feature(location and skill)
select p.product_id, group_concat(distinct s.name) as skill, group_concat(distinct w.name) as ward,
group_concat(distinct d.name) as district, group_concat(distinct pd.name) as province
from product p join skill_product_entry spr on p.PRODUCT_ID=spr.PRODUCT_ID
join skill_description s on s.id_skill = spr.ID_SKILL join location_product_entry lpe on lpe.PRODUCT_ID=p.PRODUCT_ID
join location_description l on l.ID_LOCATION=lpe.ID_LOCATION join ward_description w on l.ID_WARD=w.ID_WARD
join district_description d on d.ID_DISTRICT=l.ID_DISTRICT join province_description pd on pd.id_province= l.id_province
group by p.PRODUCT_ID;
-- get all user with feature(location and skill)
select c.customer_id, group_concat(distinct s.name) as skill, group_concat(distinct dd.name) as district from customer c 
join profile p on c.customer_id=p.customer_id
join profile_skill_entry pse on pse.profile_id=p.id 
join skill_description s on s.id_skill=pse.skill_id
join profile_area_work_entry pawe on pawe.profiles_ID = p.id 
join district_description dd on pawe.districts_ID_DISTRICT=dd.ID_DISTRICT
group by c.customer_id
