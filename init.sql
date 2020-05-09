create table if not exists templates
(
    id        bigserial not null
        constraint templates_pkey
            primary key,
    requestor varchar,
    name      varchar,
    template  varchar
);

alter table templates
    owner to postgres;


create table if not exists attributes
(
    id          bigint  not null
        constraint attributes_pkey
            primary key,
    name        varchar not null,
    template_id bigint  not null,
    position    integer
);

alter table attributes
    owner to postgres;


create table if not exists messages
(
    id        bigint  not null
        constraint messages_pk
            primary key,
    requestor varchar not null,
    message   varchar not null,
    date      date    not null
);

alter table messages
    owner to postgres;

create table if not exists values
(
    template_id bigint  not null,
    attr_id     bigint  not null
        constraint values_attr_id_fkey
            references attributes,
    value       varchar,
    id          integer not null
        constraint values_pk
            primary key,
    message_id  bigint  not null
        constraint values_messages_id_fk
            references messages
);

alter table values
    owner to postgres;





create sequence if not exists hibernate_sequence;

alter sequence hibernate_sequence owner to postgres;



