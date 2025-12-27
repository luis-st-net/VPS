CREATE DATABASE artifactory;
CREATE USER artifactory WITH PASSWORD '<to_set>';
GRANT ALL PRIVILEGES ON DATABASE artifactory TO artifactory;
ALTER USER artifactory CREATEDB;
# Artifactory user must be super user
ALTER USER artifactory WITH SUPERUSER;
