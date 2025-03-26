SELECT 
    content_text,
    TRIM(CONCAT(
        UPPER(SUBSTRING(SUBSTRING_INDEX(content_text, ' ', 1), 1, 1)), 
        LOWER(SUBSTRING(SUBSTRING_INDEX(content_text, ' ', 1), 2)),
        ' ',
        IF(LENGTH(SUBSTRING_INDEX(content_text, ' ', 2)) > LENGTH(SUBSTRING_INDEX(content_text, ' ', 1)),
            CONCAT(
                UPPER(SUBSTRING(SUBSTRING_INDEX(SUBSTRING_INDEX(content_text, ' ', 2), ' ', -1), 1, 1)),
                LOWER(SUBSTRING(SUBSTRING_INDEX(SUBSTRING_INDEX(content_text, ' ', 2), ' ', -1), 2)),
                ' '
            ), ''
        ),
        IF(LENGTH(SUBSTRING_INDEX(content_text, ' ', 3)) > LENGTH(SUBSTRING_INDEX(content_text, ' ', 2)),
            CONCAT(
                UPPER(SUBSTRING(SUBSTRING_INDEX(SUBSTRING_INDEX(content_text, ' ', 3), ' ', -1), 1, 1)),
                LOWER(SUBSTRING(SUBSTRING_INDEX(SUBSTRING_INDEX(content_text, ' ', 3), ' ', -1), 2)),
                ' '
            ), ''
        ),
        IF(LENGTH(SUBSTRING_INDEX(content_text, ' ', 4)) > LENGTH(SUBSTRING_INDEX(content_text, ' ', 3)),
            CONCAT(
                UPPER(SUBSTRING(SUBSTRING_INDEX(SUBSTRING_INDEX(content_text, ' ', 4), ' ', -1), 1, 1)),
                LOWER(SUBSTRING(SUBSTRING_INDEX(SUBSTRING_INDEX(content_text, ' ', 4), ' ', -1), 2)),
                ' '
            ), ''
        ),
        IF(LENGTH(SUBSTRING_INDEX(content_text, ' ', 5)) > LENGTH(SUBSTRING_INDEX(content_text, ' ', 4)),
            CONCAT(
                UPPER(SUBSTRING(SUBSTRING_INDEX(SUBSTRING_INDEX(content_text, ' ', 5), ' ', -1), 1, 1)),
                LOWER(SUBSTRING(SUBSTRING_INDEX(SUBSTRING_INDEX(content_text, ' ', 5), ' ', -1), 2)),
                ' '
            ), ''
        ),
        IF(LENGTH(SUBSTRING_INDEX(content_text, ' ', 6)) > LENGTH(SUBSTRING_INDEX(content_text, ' ', 5)),
            CONCAT(
                UPPER(SUBSTRING(SUBSTRING_INDEX(SUBSTRING_INDEX(content_text, ' ', 6), ' ', -1), 1, 1)),
                LOWER(SUBSTRING(SUBSTRING_INDEX(SUBSTRING_INDEX(content_text, ' ', 6), ' ', -1), 2)),
                ' '
            ), ''
        ),
        IF(LENGTH(SUBSTRING_INDEX(content_text, ' ', 7)) > LENGTH(SUBSTRING_INDEX(content_text, ' ', 6)),
            CONCAT(
                UPPER(SUBSTRING(SUBSTRING_INDEX(SUBSTRING_INDEX(content_text, ' ', 7), ' ', -1), 1, 1)),
                LOWER(SUBSTRING(SUBSTRING_INDEX(SUBSTRING_INDEX(content_text, ' ', 7), ' ', -1), 2)),
                ' '
            ), ''
        )
    )) AS modified_text
FROM user_content;