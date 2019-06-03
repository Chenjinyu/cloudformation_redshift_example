select count(*) from cjy.title;
select count(*) from cjy.title_basics;
select distinct language from cjy.title order by language;
select max(runtimeminutes), min(runtimeminutes), avg(runtimeminutes), count(*) from cjy.title_basics;
select count(*) from cjy.title_basics where isadult = true;


select
       title.title,
       title.language,
       title_basics.primarytitle,
       title_basics.startyear,
       title_basics.genres
from cjy.title
  join cjy.title_basics on title.titleid = title_basics.tconst
where title.language = 'en' limit 100;
