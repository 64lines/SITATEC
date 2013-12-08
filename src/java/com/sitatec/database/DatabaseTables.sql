CREATE TABLE "person" (
    id            integer PRIMARY KEY,
    username      varchar(50) NOT NULL,
    password      varchar(50) NOT NULL,
    first_name    varchar(100) NOT NULL,
    last_name     varchar(100) NOT NULL,
    mobile_phone  varchar(20) NOT NULL,
    phone         varchar(20) NOT NULL,
    address       varchar(100) NOT NULL,
    is_superuser  integer NOT NULL
);

CREATE TABLE "phone_call" (
    id                  integer PRIMARY KEY,
    origin_number       varchar(15) NOT NULL,
    destination_number  varchar(15) NOT NULL,
    start_time          varchar(20) NOT NULL,
    end_time            varchar(20) NOT NULL
);

CREATE TABLE "operator" (
    id                  integer PRIMARY KEY,
    operator_name       varchar(25) NOT NULL,
    initial_range       integer NOT NULL,
    final_range         integer NOT NULL
);

CREATE TABLE "tariff" (
   id                      integer PRIMARY KEY,
   origin_operator         integer NOT NULL,
   destination_operator    integer NOT NULL,
   value_fee               decimal NOT NULL
);

CREATE TABLE "discount_holy_date" (
    id              integer PRIMARY KEY,
    description     varchar(15) NOT NULL,
    discount_cost   decimal NOT NULL,
    discount_date   varchar(20) NOT NULL
);


CREATE TABLE "discount_week_day" (
    id              integer PRIMARY KEY,
    description     varchar(15) NOT NULL,
    discount_cost   decimal NOT NULL,
    week_day        integer NOT NULL
);