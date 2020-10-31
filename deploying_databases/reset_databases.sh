#!/bin/bash

# Setup sysadmin database activity
#cd /home/sysadmin/Cybersecurity-Lesson-Plans/14-Web_Dev/deploying_databases/
# Bringing down any previous activity docker-compose sessions
docker-compose down > /dev/null 2>&1
# Remove containers and volumes in /home/sysadmin/Cybersecurity-Lesson-Plans/14-Web_Dev/deploying_databases/
docker-compose rm -v -f > /dev/null 2>&1
docker volume rm deploying_databases_db > /dev/null 2>&1
# Bring up the container set to populate SQL server
docker-compose up -d
# Populating databases using db mounted volume
echo "Populating Databases"
docker exec -it activitydb bash -c "chmod +x /home/entries.sh; /home/entries.sh" #> /dev/null 2>&1
# Bring down container set but keep the volumes
docker-compose down