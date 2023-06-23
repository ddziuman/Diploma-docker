FROM jenkins/jenkins:latest
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV CASC_JENKINS_CONFIG /var/jenkins_home/casc.yaml
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
WORKDIR /usr/share/jenkins/ref
RUN java -jar /opt/jenkins-plugin-manager.jar -f  /usr/share/jenkins/ref/plugins.txt --verbose
RUN chmod 755 /var/jenkins_home/
COPY casc.yaml /var/jenkins_home/casc.yaml
