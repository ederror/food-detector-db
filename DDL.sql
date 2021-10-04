DROP TABLE likes;
DROP TABLE allergy_info;
DROP TABLE include;
DROP TABLE meal;
DROP TABLE user;
DROP TABLE food;

CREATE TABLE user(
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

CREATE TABLE allergy_info(
	id int not null,
    user_id varchar(30) not null,
    ingredient varchar(30) not null,
    primary key (id, user_id),
    foreign key (user_id) references user(id) on delete cascade on update cascade
);

CREATE TABLE meal(
	id int not null,
    user_id varchar(30) not null,
    calories_total decimal(8,2) not null,
    carbo_total decimal(5,2) not null,
    protein_total decimal(5,2) not null,
    fat_total decimal(5,2) not null,
    sugar_total decimal(5,2) not null,
    salt_total decimal(5,2) not null,
    saturated_fat_total decimal(5,2) not null,
	log_time datetime not null,
    image_name varchar(255) null,
    public_avail tinyint(1) not null default 1,
    primary key (id, user_id),
    foreign key (user_id) references user(id) on delete cascade on update cascade
);

CREATE TABLE food (
	id varchar(10) not null,
    food_name varchar(100) not null,
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

CREATE TABLE likes (
	id varchar(30) not null,
    meal_id int not null,
    meal_user_id varchar(30) not null,
    log_time datetime not null,
    primary key (id, meal_id, meal_user_id),
    foreign key (id) references user(id) on delete cascade on update cascade,
    foreign key (meal_id, meal_user_id) references meal(id, user_id) on delete cascade on update cascade
);

CREATE TABLE include (
	meal_id int not null,
    meal_user_id varchar(30) not null,
    food_id varchar(10) not null,
    amount int not null,
    amount_unit varchar(5) not null,
    x decimal(10,2) not null,
    y decimal(10,2) not null,
    primary key (meal_id, meal_user_id, food_id),
    foreign key (meal_id, meal_user_id) references meal(id, user_id) on delete cascade on update cascade,
    foreign key (food_id) references food(id) on delete cascade on update cascade
);

