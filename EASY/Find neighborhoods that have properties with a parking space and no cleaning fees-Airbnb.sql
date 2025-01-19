select distinct neighbourhood from airbnb_search_details
where amenities like '%Free Parking%' and cleaning_fee = 0 or cleaning_fee is null;