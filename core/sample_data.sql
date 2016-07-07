/* Create a user account to test the login system */
/* The user password is BOTH-STUDENTS-DRIED-house */
INSERT INTO accounts
    (`username`, `password`, `full_name`, `email`, `department`, `permission_level`)
  VALUES
    ('alex_a', '$2y$10$KHNJ9mmiJKt8F8TPMCdmdexmP8.Ecr/cFVycJe3RwByxGXJ382mJK', 'Alexander Adell', 'alexander@earth.com', 'R&D', 1);