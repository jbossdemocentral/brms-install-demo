# Use jbossdemocentral/developer as the base
FROM jbossdemocentral/developer

# Maintainer details
MAINTAINER Andrew Block <andy.block@gmail.com>

# Environment Variables 
ENV BRMS_HOME /opt/jboss/brms
ENV BRMS_VERSION_MAJOR 6
ENV BRMS_VERSION_MINOR 0
ENV BRMS_VERSION_MICRO 3

# ADD Installation Files
COPY support/installation-brms support/installation-brms.variables installs/jboss-brms-installer-$BRMS_VERSION_MAJOR.$BRMS_VERSION_MINOR.$BRMS_VERSION_MICRO.GA-redhat-1.jar  /opt/jboss/

# Prepare and run installer and cleanup installation components
RUN sed -i "s:<installpath>.*</installpath>:<installpath>$BRMS_HOME</installpath>:" /opt/jboss/installation-brms \
	&& java -jar /opt/jboss/jboss-brms-installer-$BRMS_VERSION_MAJOR.$BRMS_VERSION_MINOR.$BRMS_VERSION_MICRO.GA-redhat-1.jar  /opt/jboss/installation-brms -variablefile /opt/jboss/installation-brms.variables \
	&& rm -rf /opt/jboss/jboss-brms-installer-$BRMS_VERSION_MAJOR.$BRMS_VERSION_MINOR.$BRMS_VERSION_MICRO.GA-redhat-1.jar /opt/jboss/installation-brms /opt/jboss/installation-brms.variables $BRMS_HOME/jboss-eap-6.1/standalone/configuration/standalone_xml_history/

# Add support files
COPY support/application-roles.properties support/standalone.xml $BRMS_HOME/jboss-eap-6.1/standalone/configuration/

# Swtich back to root user to perform cleanup
USER root

# Fix permissions on support files
RUN chown -R jboss:jboss $BRMS_HOME/jboss-eap-6.1/standalone/configuration/standalone.xml

# Run as JBoss 
USER jboss

# Expose Ports
EXPOSE 9990 9999 8080

# Run BRMS
CMD ["/opt/jboss/brms/jboss-eap-6.1/bin/standalone.sh","-c","standalone.xml","-b", "0.0.0.0","-bmanagement","0.0.0.0"]
