select count(search_id) from fb_searches
where QUARTER(date)=2
and YEAR(date) = 2021;