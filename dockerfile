FROM ruby:2.4
#установка redmine
WORKDIR /usr/src/redmine
ADD redmine-master /usr/src/redmine
ADD script.sh /usr/src/redmine
ADD database.yml /usr/src/redmine/config/
RUN chmod 777 script.sh 
RUN BUNDLE_PATH="/usr/src/redmine/redmine-master/gems" 
RUN bundle update --all
ENTRYPOINT ./script.sh ;
CMD ["-c"]
EXPOSE 3000