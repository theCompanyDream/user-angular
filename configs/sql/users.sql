
CREATE TABLE admin.USERS (
    ID UUID NOT NULL DEFAULT,
    HASH varchar(50) NOT NULL,
    USER_NAME varchar(50) NOT NULL,
    FIRST_NAME varchar(40) NOT NULL,
    LAST_NAME varchar(40) NOT NULL,
    EMAIL varchar(40) NOT NULL,
    USER_STATUS varchar(1) NOT NULL,
    DEPARTMENT varchar(255),
    PRIMARY KEY(ID)
);

-- Insert into admin.Users(HASH, USER_NAME, FNAME, LNAME, USER_STATUS, EMAIL, USER_STATUS, DEPARTMENT)
-- VALUES ()