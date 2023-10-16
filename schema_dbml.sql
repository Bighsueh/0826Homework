Table routines {
    routine_id serial [primary key]
    topic varchar(50)
    description text
    routine_uuid uuid
    created_at timestamp
    updated_at timestamp
}

Table routine_hierarchy {
    hierarchy_id serial [primary key]
    parent_routine_id int [ref: > routines.routine_id]
    child_routine_id int [ref: > routines.routine_id]
    hierarchy_uuid uuid
    created_at timestamp
    updated_at timestamp
}

Table users {
    user_id serial [primary key]
    user_name varchar(50)
    account varchar(50)
    password varchar(100)
    user_uuid uuid
    created_at timestamp
    updated_at timestamp
}

Table account_activities {
    activity_id serial [primary key]
    user_id int [ref: > users.user_id]
    activity_type varchar(100)
    created_at timestamp
    updated_at timestamp
}

Table user_permissions {
    permission_id serial [primary key]
    permission_name varchar(50)
    description text
}

Table permission_assignment {
    assignment_id serial [primary key]
    user_id int [ref: > users.user_id]
    routine_id int [ref: > routines.routine_id]
    permission_id int [ref: > user_permissions.permission_id]
    authorized_by int [ref: > users.user_id]
    assignment_uuid uuid
    created_at timestamp
    updated_at timestamp
}

Table groups {
    group_id serial [primary key]
    group_name varchar(255)
    group_description varchar(255)
    group_uuid uuid
    created_at timestamp
    updated_at timestamp
}

Table memberships {
    membership_id serial [primary key]
    user_id int [ref: > users.user_id]
    group_id int [ref: > groups.group_id]
    authorized_by int [ref: > users.user_id]
    created_at timestamp
    updated_at timestamp
}

Table group_hierarchy {
    hierarchy_id serial [primary key]
    parent_group_id int [ref: > groups.group_id]
    child_group_id int [ref: > groups.group_id]
    hierarchy_uuid uuid
    created_at timestamp
    updated_at timestamp
}
