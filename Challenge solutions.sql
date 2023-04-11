
-- SOLUTION 1 fin the five oldest users
SELECT * FROM users ORDER BY created_at LIMIT 5;

-- SOLUTION 2 find most popular day to sign up
SELECT DAYNAME(created_at) AS day, COUNT(*) AS total FROM users GROUP BY day ORDER BY total DESC LIMIT 2;


-- SOLUTION 3 select inactive users
SELECT username FROM users LEFT JOIN photos ON users.id = photos.user_id WHERE photos.id IS NULL;

-- SOLUTION 4 select the most like photo
  SELECT username, photos.id, photos.image_url, COUNT(*) AS total FROM photos INNER JOIN likes ON likes.photo_id = photos.id JOIN users ON photos.user_id = users.id GROUP BY photos.id ORDER BY total DESC LIMIT 1;

-- SOLUTION 5 find average number of posts per user
SELECT (SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users) AS AVG;

-- SOLUTION 6 find the most liked post
 SELECT tag_name, COUNT(*) AS number_of_posts_with_tag FROM tags JOIN photo_tags ON tags.id = photo_tags.tag_id GROUP BY tags.id ORDER BY number_of_posts_with_tag DESC LIMIT 5;

-- SOLUTION 7
SELECT COUNT(*) AS total_likes, username FROM likes JOIN users ON likes.user_id = users.id GROUP BY likes.user_id HAVING total_likes = (SELECT COUNT(*) FROM photos);

