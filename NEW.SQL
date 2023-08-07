CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE ingredients (
    ingredient_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL
);


CREATE TABLE nutrient (
    nutrient_id INT PRIMARY KEY,
    ingredient_id INT NOT NULL,
    nutrient_name VARCHAR(100) NOT NULL,
    nutrient_value FLOAT NOT NULL,
    unit VARCHAR(20) NOT NULL,
    FOREIGN KEY (ingredient_id) REFERENCES ingredients(ingredient_id)
);


CREATE TABLE recipes (
    recipe_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    ingredients TEXT NOT NULL,
    preparation_steps TEXT NOT NULL
);



















CREATE TABLE user_preferences (
    preference_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    recipe_id INT NOT NULL,
    preference_type VARCHAR(20) NOT NULL, -- "bookmark" or "favorite"
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (recipe_id) REFERENCES recipes(recipe_id)
);

CREATE TABLE fridge_inventory (
    inventory_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    ingredient_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (ingredient_id) REFERENCES ingredients(ingredient_id)
);

CREATE TABLE recipe_ingredients (
    recipe_id INT NOT NULL,
    ingredient_id INT NOT NULL,
    quantity FLOAT NOT NULL,
    unit VARCHAR(20) NOT NULL,
    PRIMARY KEY (recipe_id, ingredient_id),
    FOREIGN KEY (recipe_id) REFERENCES recipes(recipe_id),
    FOREIGN KEY (ingredient_id) REFERENCES ingredients(ingredient_id)
);

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE recipe_categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);
CREATE TABLE user_allergies (
    allergy_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    ingredient_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (ingredient_id) REFERENCES ingredients(ingredient_id)
);
CREATE TABLE recipe_reviews (
    review_id INT PRIMARY KEY,
    recipe_id INT NOT NULL,
    user_id INT NOT NULL,
    rating FLOAT NOT NULL,
    review_text TEXT,
    review_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (recipe_id) REFERENCES recipes(recipe_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
CREATE TABLE user_preferences_details (
    preference_detail_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    preference_id INT NOT NULL,
    recipe_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (preference_id) REFERENCES user_preferences_categories(preference_id),
    FOREIGN KEY (recipe_id) REFERENCES recipes(recipe_id)
);
