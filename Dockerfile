FROM tomcat:11.0.9-jre21-temurin-noble
COPY **/*.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"] 
