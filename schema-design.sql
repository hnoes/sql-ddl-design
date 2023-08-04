-- Medical Center

-- doctors table
CREATE TABLE doctors (
    doctor_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    specialty VARCHAR(100) NOT NULL
); 
-- patients table
CREATE TABLE patients (
    patient_id SERIAL PRIMARY KEY,
    first_name VARCHAR(40) NOT NULL,
    date_of_birth DATE NOT NULL
);

-- appointments table
CREATE TABLE appointments (
    appointment_id SERIAL PRIMARY KEY,
    patient_id INTEGER REFERENCES patients(patient_id),
    doctor_id INTEGER REFERENCES doctors(doctor_id),
    appointment_date DATE NOT NULL
);

--diseases table
CREATE TABLE diseases (
    disease_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

--diagnosis table
CREATE TABLE diagnosis (
    diagnosis_id SERIAL PRIMARY KEY,
    appointment_id INTEGER REFERENCES appointments(appointment_id),
    disease_id INTEGER REFERENCES diseases(disease_id
);



-- Craigslist
--regions table
CREATE TABLE regions (
    region_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

--users table
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(20) NOT NULL UNIQUE,
    preferred_region_id INTEGER REFERENCES regions(region_id)
);

--posts table
CREATE TABLE posts (
    post_id SERIAL PRIMARY KEY,
    title VARCHAR(250) NOT NULL,
    description TEXT NOT NULL,
    user_id INTEGER REFERENCES users(user_id),
    location VARCHAR(100) NOT NULL,
    region_id INTEGER REFERENCES regions(region_id)
);

--categories table
CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(40) NOT NULL
);

--post categories table (many-to-many) 
CREATE TABLE post_category(
    post_category_id SERIAL PRIMARY KEY,
    post_id INTEGER REFERENCES posts(post_id),
    category_id INTEGER REFERENCES categories(category_id)
);




-- Soccer League 
--teams table
CREATE TABLE teams (
    team_id SERIAL PRIMARY KEY,
    team_name VARCHAR(30) NOT NULL,
);

--players table
CREATE TABLE players (
    player_id SERIAL PRIMARY KEY,
    player_name VARCHAR(60) NOT NULL,
    team_id INTEGER REFERENCES teams(team_id)
);

--goals table
CREATE TABLE goals (
    goal_id SERIAL PRIMARY KEY,
    match_id INTEGER REFERENCES matches(match_id),
    player_id INTEGER REFERENCES players(player_id,
    goal_time TIME NOT NULL
);

--referees table
CREATE TABLE referees (
    referee_id SERIAL PRIMARY KEY,
    referee_name VARCHAR(80) NOT NULL,
);

--matches table
CREATE TABLE matches (
    match_id SERIAL PRIMARY KEY,
    home_team_id INTEGER REFERENCES teams(team_id),
    away_team_id INTEGER REFERENCES teams(team_id),
    match_date DATE NOT NULL,
    referee_id INTEGER REFERENCES referees(referee_id)
); 

--seasons table
CREATE TABLE seasons (
    season_id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);