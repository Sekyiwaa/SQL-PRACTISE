SELECT 
    DISTINCT home_library_code
FROM 
    library_usage
WHERE 
    circulation_active_year = 2016 AND
    notice_preference_definition = 'email' AND
    provided_email_address = FALSE
