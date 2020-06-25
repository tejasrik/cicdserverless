FROM tomcat:latest
# Take the war and copy to webapps of tomcat
#COPY target/*.war /usr/local/tomcat/webapps/myweb.war
RUN rm -rf /usr/local/tomcat/webapps/*
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
#ENTRYPOINT ["sh", "/usr/local/tomcat/bin/startup.sh"]
