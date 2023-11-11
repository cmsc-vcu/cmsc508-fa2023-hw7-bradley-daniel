## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS peopleroles;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS roles;

# ... 
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

CREATE TABLE skills (
    id int NOT NULL,
    name varchar(256) NOT NULL,
    description varchar(255) NOT NULL DEFAULT '(default description)',
    tag varchar(256) NOT NULL,
    required_time time not NUll DEFAULT '000:00:00',
    PRIMARY KEY (id)
);


# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

insert into skills (id, name, tag, required_time) VALUES
    (1, 'rock climbing', 'Skill_1', '1:00:50'),
    (2, 'shooting nerf guns', 'Skill_2', '1:00:50'),
    (3, 'gamming', 'Skill_3', '1:00:50'),
    (4, 'walking', 'Skill_4', '1:00:50'),
    (5, 'drinking water', 'Skill_5', '1:00:50'),
    (6, 'eating dirt', 'Skill_6', '1:00:50'),
    (7, 'tree cutting', 'Skill_7', '1:00:50'),
    (8, 'job hunting', 'Skill_8', '1:00:50');


# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE people (
    id int NOT NULL,
    first_name varchar(256) NOT NULL,
    last_name varchar(256) NOT NULL,
    email varchar(256) NOT NULL,
    linkedin_url varchar(256) NOT NULL,
    headshot_url varchar(256) NOT NULL,
    discord_handle varchar(256) NOT NULL,
    brief_bio varchar(256) NOT NULL,
    date_joined date NOT NULL,
    PRIMARY KEY (id)
);

# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

INSERT INTO people (id, first_name, last_name, date_joined, email, linkedin_url, headshot_url, discord_handle, brief_bio)
VALUES
  (1, 'John',    'Person 1', '2023-01-01', 'john.doe@example.com', 'https://www.linkedin.com/in/johndoe', 'https://example.com/johndoe.jpg', 'johndoe#1234', 'Passionate developer with a love for technology.'),
  (2, 'Jane',    'Person 2', '2023-02-15', 'jane.smith@example.com', 'https://www.linkedin.com/in/janesmith', 'https://example.com/janesmith.jpg', 'janesmith#5678', 'Experienced marketer with a creative mindset.'),
  (3, 'Bob',     'Person 3', '2023-03-20', 'bob.johnson@example.com', 'https://www.linkedin.com/in/bobjohnson', 'https://example.com/bobjohnson.jpg', 'bobjohnson#9101', 'Adventurous traveler and outdoor enthusiast.'),
  (4, 'Emily',   'Person 4', '2023-04-10', 'emily.davis@example.com', 'https://www.linkedin.com/in/emilydavis', 'https://example.com/emilydavis.jpg', 'emilydavis#1213', 'Aspiring artist with a passion for visual storytelling.'),
  (5, 'Michael', 'Person 5', '2023-05-05', 'michael.williams@example.com', 'https://www.linkedin.com/in/michaelwilliams', 'https://example.com/michaelwilliams.jpg', 'michaelwilliams#1415', 'Tech entrepreneur building innovative solutions.'),
  (6, 'Sarah',   'Person 6', '2023-06-08', 'sarah.taylor@example.com', 'https://www.linkedin.com/in/sarahtaylor', 'https://example.com/sarahtaylor.jpg', 'sarahtaylor#1617', 'Passionate advocate for environmental sustainability.'),
  (7, 'Alex',    'Person 7', '2023-07-15', 'alex.miller@example.com', 'https://www.linkedin.com/in/alexmiller', 'https://example.com/alexmiller.jpg', 'alexmiller#1819', 'Data scientist passionate about machine learning and analytics.'),
  (8, 'Ella',    'Person 8', '2023-08-22', 'ella.anderson@example.com', 'https://www.linkedin.com/in/ellaanderson', 'https://example.com/ellaanderson.jpg', 'ellaanderson#2021', 'Graphic designer with a flair for creative and modern designs.'),
  (9, 'Chris',   'Person 9', '2023-09-30', 'chris.brown@example.com', 'https://www.linkedin.com/in/chrisbrown', 'https://example.com/chrisbrown.jpg', 'chrisbrown#2223', 'Passionate sports enthusiast and fitness trainer.'),
  (10, 'Megan',  'Person 10', '2023-10-12', 'megan.carter@example.com', 'https://www.linkedin.com/in/megancarter', 'https://example.com/megancarter.jpg', 'megancarter#2425', 'Journalist with a keen interest in investigative reporting and storytelling.');

# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

create table peopleskills (
    id int auto_increment,
    skills_id int NOT NULL,
    people_id int NOT NULL,
    date_acquired date DEFAULT (CURRENT_DATE),
    primary key (id),
    foreign key (skills_id) REFERENCES skills (id),
    foreign key (people_id) REFERENCES people (id)
);


# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.

INSERT INTO peopleskills (people_id, skills_id) VALUES
    (1, 1),
    (1, 3),
    (1, 6),
    (2, 3),
    (2, 4),
    (2, 5),
    (3, 1),
    (3, 5),
    (5, 3),
    (5, 6),
    (6, 2),
    (6, 3),
    (6, 4),
    (7, 3),
    (7, 5),
    (7, 6),
    (8, 1),
    (8, 3),
    (8, 5),
    (8, 6),
    (9, 2),
    (9, 5),
    (9, 6),
    (10, 1),
    (10, 4),
    (10, 5)
;

# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

create table roles (
    id int NOT NULL,
    name varchar(256),
    sort_priority int NOT NULL,
    PRIMARY KEY (id)
);



# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

INSERT INTO roles (id, name, sort_priority)
VALUES
  (1, 'Designer', 10),
  (2, 'Developer', 20),
  (3, 'Recruit', 30),
  (4, 'Team Lead', 40),
  (5, 'Boss', 50),
  (6, 'Mentor', 60),
  (7, 'Intern', 70);



# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

create table peopleroles (
    id INT auto_increment,
    people_id INT NOT NULL,
    role_id INT NOT NULL,
    date_assigned DATE default (CURRENT_DATE),
    PRIMARY KEY (id),
    FOREIGN KEY (people_id) REFERENCES people (id),
    FOREIGN KEY (role_id) REFERENCES roles (id)
);


# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer


INSERT INTO peopleroles (people_id, role_id) VALUES
  (1, 3),   
  (2, 5),   
  (2, 6),   
  (3, 2),   
  (3, 4),   
  (4, 3),   
  (5, 3),   
  (6, 2),   
  (6, 1),   
  (7, 1),   
  (8, 1),   
  (8, 4),   
  (9, 2),   
  (10, 2),  
  (10, 1)
;


select * from peopleroles;



select 
    *
from 
    roles
    left join peopleroles on (roles.id=peopleroles.role_id)
where 
    peopleroles.people_id is NUll;
