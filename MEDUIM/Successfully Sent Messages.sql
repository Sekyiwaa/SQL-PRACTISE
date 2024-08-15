select
(select cast(count(*) as decimal)
    from facebook_messages_received)
    /(select count(*) from facebook_messages_sent) as ratio;