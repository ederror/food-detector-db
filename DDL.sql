DROP TABLE Likes;
DROP TABLE User_allergy_info;
DROP TABLE Meal;
DROP TABLE User;
DROP TABLE Food;

CREATE TABLE User(
	id varchar(30) not null,
    passwd varchar(30) not null,
    gender int not null default 0,
    age int not null default 20,
    height int not null default 170,
    weight int not null default 60,
    reg_datetime datetime not null,
    gcode varchar(10) not null,
    calorie decimal(8,2) not null,
    carbohydrate decimal(5,2) not null default -1,
	protein decimal(5,2) not null default -1,
    fat decimal(5,2) not null default -1,
    sugar decimal(5,2) not null default -1,
    salt decimal(5,2) not null default -1,
    saturated_fat decimal(5,2) not null default -1,
    intf_type tinyint not null,
    primary key (id)
);

CREATE TABLE User_allergy_info(
	id int not null,
    uid varchar(30) not null,
    ingredient varchar(30) not null,
    primary key (id, uid),
    foreign key (uid) references User(id)
);

CREATE TABLE Meal(
	id int not null,
    uid varchar(30) not null,
    total_calories decimal(8,2) not null,
    total_carbo decimal(5,2) not null,
    total_protein decimal(5,2) not null,
    total_fat decimal(5,2) not null,
    total_sugar decimal(5,2) not null,
    total_salt decimal(5,2) not null,
    total_saturated_fat decimal(5,2) not null,
    log_time datetime not null,
    image_name varchar(255) null,
    public_avail tinyint(1) not null default 1,
    primary key (id, uid),
    foreign key (uid) references User(id)
);

CREATE TABLE Food (
	id varchar(10) not null,
    name varchar(100) not null,
    serving_size decimal(5,2) not null,
    serving_size_unit varchar(5) not null,
    calorie decimal(8,2) not null,
    carbohydrate decimal(5,2) not null,
    protein decimal(5,2) not null,
    fat decimal(5,2) not null default 0,
    sugar decimal(5,2) not null default 0,
    salt decimal(5,2) not null default 0,
    saturated_fat decimal(5,2) not null default 0,
    primary key (id)
);

CREATE TABLE Likes (
	id varchar(30) not null,
    mid int not null,
    muid varchar(30) not null,
    log_time datetime not null,
    primary key (id, mid, muid),
    foreign key (id) references User(id),
    foreign key (mid, muid) references Meal(id, uid)
);

CREATE TABLE Include (
	mid int not null,
    uid varchar(30) not null,
    fid varchar(10) not null,
    amount int not null,
    amount_unit varchar(5) not null,
    x decimal(10,2) not null,
    y decimal(10,2) not null,
    primary key (mid, uid, fid),
    foreign key (mid, uid) references Meal(id, uid),
    foreign key (fid) references Food(id)
);

