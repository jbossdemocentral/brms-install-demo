JBoss BRMS 6 Install Demo
=========================
Project to automate the installation of this product without preconfiguration beyond a single admin user.

There are four options available to you for using this demo; local, Docker, Openshift Online and Red Hat CDK OpenShift Enterprise.

Software
--------
The following software is required to run this demo:
- JBoss EAP 7.0 installer: https://developers.redhat.com/download-manager/file/jboss-eap-7.0.0-installer.jar
- JBoss BRMS 6.4.0.GA deployable for EAP 7:
- 7-Zip (Windows only): to overcome the Windows 260 character path length limit, we need 7-Zip to unzip the BPM Suite deployable: http://www.7-zip.org/download.html

Option 1 - Install on your machine
----------------------------------
1. [Download and unzip.](https://github.com/jbossdemocentral/brms-install-demo/archive/master.zip)

2. Add the EAP installer and BPM Suite deployable to installs directory.

3. Run 'init.sh' or 'init.ps1' file.

4. Start the runtime: `./target/jboss-eap-7.0/bin/standalone.sh'` or `.\target\jboss-eap-7.0\bin\standalone.ps1`

5. Login to http://localhost:8080/business-central  (u:brmsAdmin / p:jbossbrms1!)

6. Enjoy installed and configured JBoss BRMS 6.


Option 2 - Run in Docker
-----------------------------------------
The following steps can be used to configure and run the demo in a container

1. [Download and unzip.](https://github.com/jbossdemocentral/bpms-install-demo/archive/master.zip)

2. Add the EAP installer and BRMS deployable to installs directory.

3. Run the 'init-docker.sh' or 'init-docker.ps1' file.

4. Start the container: `docker run -it -p 8080:8080 -p 9990:9990 jbossdemocentral/brms-install-demo`

5. Login to http://&lt;DOCKER_HOST&gt;:8080/business-central  (u:brmsAdmin / p:jbossbrms1!)

7. Enjoy installed and configured JBoss BRMS 6.

Additional information can be found in the jbossdemocentral container [developer repository](https://github.com/jbossdemocentral/docker-developer)


Option 3 - Install with one click in xPaaS (brmsPaaS)
-----------------------------------------------------
After clicking button, ensure `Gear` size is set to `large`:

[![Click to install OpenShift](http://launch-shifter.rhcloud.com/launch/light/Install brmsPaaS.svg)](https://openshift.redhat.com/app/console/application_type/custom?&cartridges[]=https://raw.githubusercontent.com/jbossdemocentral/cartridge-brmsPaaS/master/metadata/manifest.yml&name=brmspaas&gear_profile=large&initial_git_url=)

Once installed you can use the JBoss BRMS logins:

   * u:erics  p: jbossbrms  (admin)

   * u: alan  p: jbossbrms  (analyst)

Current hosting of bpmPaaS is on JBoss BRMS 6.0.2 in OpenShift Online.


Option 4 - Install on Red Hat CDK OpenShift Enterprise image
------------------------------------------------------------
The following steps can be used to install this demo on OpenShift Enterprise using the
Red Hat Container Development Kit (CDK)

1. [App Dev Cloud with JBoss BRMS Install Demo](https://github.com/redhatdemocentral/rhcs-brms-install-demo)


Supporting Articles
-------------------
- [7 Steps to Your First Rules with JBoss BRMS Starter Kit](http://www.schabell.org/2015/08/7-steps-first-rules-jboss-brms-starter-kit.html)

- [3 shockingly easy ways into JBoss rules, events, planning & BPM](http://www.schabell.org/2015/01/3-shockingly-easy-ways-into-jboss-brms-bpmsuite.html)

- [Jump Start Your Rules, Events, Planning and BPM Today](http://www.schabell.org/2014/12/jump-start-rules-events-planning-bpm-today.html)

- [4 Foolproof Tips Get You Started With JBoss BRMS 6.0.3](http://www.schabell.org/2014/10/4-foolproof-tips-get-started-jboss-brms-603.html)

- [Red Hat JBoss BRMS - all product demos updated for version 6.0.2.GA release](http://www.schabell.org/2014/07/redhat-jboss-brms-product-demos-6.0.2-updated.html)


Released versions
-----------------
See the tagged releases for the following versions of the product:

- v2.3 - JBoss BRMS 6.4.0.GA on JBoss EAP 7.0.0.GA and running on Red Hat CDK using OpenShift Enterprise image.

- v2.2 - JBoss BRMS 6.3.0 on JBoss EAP 6.4.7 and running on Red Hat CDK using OpenShift Enterprise image.

- v2.1 - JBoss BRMS 6.2.0-BZ-1299002 on JBoss EAP 6.4.4 and running on Red Hat CDK using OpenShift Enterprise image.

- v2.0 - JBoss BRMS 6.2.0-BZ-1299002 on JBoss EAP 6.4.4.

- v1.9 - JBoss BRMS 6.2.0, JBoss EAP 6.4.4 and OSE aligned containerization.

- v1.8 - JBoss BRMS 6.2.0 and JBoss EAP 6.4.4 installation.

- v1.7 - JBoss BRMS 6.1 installer on JBoss EAP 6.4.

- v1.6 - JBoss BRMS 6.0.3 installer with optional docker installation.

- v1.5 - moved to JBoss Dem Central organization, updated windows init.bat support and one click install button.

- v1.4 - JBoss BRMS 6.0.3 installer on JBoss EAP 6.1.1.

- v1.3 - JBoss BRMS 6.0.2 installer used to setup basic product installation on JBoss EAP 6.1.1.

- v1.2 - JBoss BRMS 6.0.2, installed on JBoss EAP 6.1.1.

- v1.1 - JBoss BRMS 6.0.1, installed on JBoss EAP 6.1.1.

- v1.0 - JBoss BRMS 6.0.0, installed on JBoss EAP 6.1.1.

- v0.3 - JBoss BRMS 6.0.0.CR2, installed on JBoss EAP 6.1.1.

- v0.2 - JBoss BRMS 6.0.0.CR1, installed on JBoss EAP 6.1.1.

- v0.1 - JBoss BRMS 6.0.0.Beta, installed on JBoss EAP 6.1.1.


![JBoss BRMS](https://github.com/jbossdemocentral/brms-install-demo/blob/master/support/jboss-brms.png?raw=true)
