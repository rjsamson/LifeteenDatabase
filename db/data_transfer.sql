truncate contacts;
alter table contacts drop column if exists old_contact_id;
alter table contacts add column old_contact_id integer;
insert into contacts(
	first_name,
	last_name,
	created_at,
	updated_at,
	allergies,
	background_check,
	baptism,
	birthday,
	code_of_conduct,
	college,
	college_email,
	confirmation,
	diet_restrictions,
	email,
	email2,
	facebook_id,
	first_communion,
	first_reconciliation,
	gender,
	graduating_class,
	is_active,
	is_group_or_parish,
	life_experience,
	phone,
	cell,
	fax,
	work_phone,
	myspace_id,
	twitter_id,
	youth_group_leader,
	school,
	safe_child_video_letter_sent,
	watched_safe_child_video,
	medical,
	old_contact_id
) ( 
select
	first_name,
	last_name,
	c.created_date,
	c.modified_date,
	allergies,
	background_check,
	baptism,
	birthday,
	code_of_conduct,
	college,
	college_email,
	confirmation,
	diet_restrictions,
	email,
	email2,
	facebook_id,
	first_communion,
	first_reconciliation,
	gender,
	graduating_class,
	is_active,
	is_group_or_parish,
	life_experience,
	case when length(p.suffix) = 0 then null else p.area_code || '-' || p.prefix || '-' || p.suffix || case when length(p.extention) = 0 then '' else ' ext. ' || p.extention end end,
	case when length(pcell.suffix) = 0 then null else pcell.area_code || '-' || pcell.prefix || '-' || pcell.suffix || case when length(pcell.extention) = 0 then '' else ' ext. ' || pcell.extention end end,
	case when length(pfax.suffix) = 0 then null else pfax.area_code || '-' || pfax.prefix || '-' || pfax.suffix || case when length(pfax.extention) = 0 then '' else ' ext. ' || pfax.extention end end,
	case when length(pwork.suffix) = 0 then null else pwork.area_code || '-' || pwork.prefix || '-' || pwork.suffix || case when length(pwork.extention) = 0 then '' else ' ext. ' || pwork.extention end end,
	myspace_id,
	twitter_id,
	youth_group_leader,
	school,
	safe_child_video_letter_sent,
	case when watched_safe_child_video is null then 2
	when watched_safe_child_video then 1
	else 0 end,
	medical,
	c.id
	from old.contact c
	left join old.phone p on p.id = c.phone_id
	left join old.phone pcell on pcell.id = c.phone_cell_id
	left join old.phone pfax on pfax.id = c.phone_fax_id
	left join old.phone pwork on pwork.id = c.phone_work_id
);


truncate table addresses;
insert into addresses (
	city, 
	state,
	street,
	zipcode,
	created_at,
	updated_at,
	type,
	contact_id
) (
select 
	o.city,
	o.state,
	o.street,
	o.zip_code,
	o.created_date,
	o.modified_date,
	'Address1',
	(select cnew.id from contacts cnew where cnew.old_contact_id = c.id)
from old.address o inner join
old.contact c on c.address_id = o.id
and length(o.street) > 0);


insert into addresses (
	city, 
	state,
	street,
	zipcode,
	created_at,
	updated_at,
	type,
	contact_id
) (
select 
	o.city,
	o.state,
	o.street,
	o.zip_code,
	o.created_date,
	o.modified_date,
	'Address2',
	(select cnew.id from contacts cnew where cnew.old_contact_id = c.id)
from old.address o inner join
old.contact c on c.address2_id = o.id
and length(o.street) > 0);


insert into addresses (
	city, 
	state,
	street,
	zipcode,
	created_at,
	updated_at,
	type,
	contact_id
) (
select 
	o.city,
	o.state,
	o.street,
	o.zip_code,
	o.created_date,
	o.modified_date,
	'CollegeAddress',
	(select cnew.id from contacts cnew where cnew.old_contact_id = c.id)
from old.address o inner join
old.contact c on c.college_address_id = o.id
and length(o.street) > 0);

truncate table date_event_types;
alter table date_event_types add column old_date_event_type_id integer;
insert into date_event_types (old_date_event_type_id, value, created_at, updated_at)
(select old.date_event_type.id, old.date_event_type.value, old.date_event_type.created_date, old.date_event_type.modified_date
from old.date_event_type);

truncate table date_events;
alter table date_events add column old_date_event_id integer;

insert into date_events (old_date_event_id, event_date, date_event_type_id, created_at, updated_at)
(select old.date_event.id, old.date_event.event_date, det.id, old.date_event.created_date, old.date_event.modified_date
from old.date_event inner join date_event_types det on det.old_date_event_type_id = old.date_event.date_event_type_id);

alter table date_events drop column old_date_event_id;
alter table date_event_types drop column old_date_event_type_id;
alter table contacts drop column old_contact_id;