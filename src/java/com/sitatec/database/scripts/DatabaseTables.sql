CREATE TABLE "registered_user" (
    id            integer PRIMARY KEY,
    username      varchar(50) NOT NULL,
    password      varchar(50) NOT NULL,
    first_name    varchar(100),
    last_name     varchar(100),
    mobile_phone  varchar(20),
    phone         varchar(20),
    address       varchar(100)
);