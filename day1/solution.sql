select
    c.name
--     c.child_id
    , wl.wishes->>'first_choice' as primary_wish
    , wl.wishes->>'second_choice' as backup_wish
    , wl.wishes->'colors'->>0 as favorite_color
    , json_array_length(wl.wishes->'colors') as color_count
    , case when t.difficulty_to_make = 1 then 'Simple Gift' when t.difficulty_to_make = 2 then 'Moderate Gift' else 'Complex Gift' end as gift_complexity
    , case when t.category = 'outdoor' then 'Outside Workshop' when t.category = 'educational' then 'Learning Workshop' else 'General Workshop' end as workshop_assignment


from children c
-- left join (
--     select distinct on (child_id) *
--     from wish_lists
--     order by child_id, submitted_date DESC
-- ) wl on c.child_id = wl.child_id
left join wish_lists wl on wl.child_id = c.child_id
left join toy_catalogue t on wl.wishes->>'first_choice' = t.toy_name

order by c.name

limit 10
