### Bookmark Challenge

### How to setup the database from scratch
1. Connet to psql
2. Create the database using the psql command CREATE DATABASE bookmark_manager;
3. Connect to the database using the pqsl command \c bookmark_manager;
4. Run the query we have saved in the file 01_create_bookmarks_table.sql

### How to setup the manager_test from scratch
1. connect to psql
2. Create the database using the psql command CREATE DATABASE "bookmark_manager_test";
3. Run the query we have saved in the file 01_create_bookmarks_table.sql

#### User story 1
as a user
so that i can select my bookmarks
I would like to see a list of bookmarks.

Domain model: 
|Bookmark|
|--------|
|@bookmark|
|list(bookmark)|

Or a far better domain model can be found ![](https://raw.githubusercontent.com/makersacademy/course/master/bookmark_manager/images/bookmark_manager_1.png?token=AOJN3ONUCUQMNCDQMRSAULS6N5TOO)

### User story 2
As a time-pressed user
So that I can save a website
I would like to add the site's address and title to bookmark manager

### User story 3
As a user
So I can store bookmark data for later retrieval
I want to add a bookmark to Bookmark Manager