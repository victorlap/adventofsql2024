-- with a as (select chr(value) as value from letters_a where (value = 32 or value >= 65 and value <= 122))
--    , b as (select chr(value) as value from letters_b where (value = 32 or value >= 65 and value <= 122))

select concat(
   (select string_agg(chr(value), '')
    from letters_a
    where (value in (32, 33, 44) or (value >= 65 and value <= 90) or (value >= 97 and value <= 122))),
   '',
   (select string_agg(chr(value), '')
    from letters_b
    where (value in (32, 33, 44) or (value >= 65 and value <= 90) or (value >= 97 and value <= 122)))
) as decoded_message
;
