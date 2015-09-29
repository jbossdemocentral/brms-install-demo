JBoss BRMS 6 Install Demo 
=========================
Project to automate the installation of this product without preconfiguration beyond a single admin user.

There are three options available to you for using this demo; local, OpenShift and containerized.


Option 1 - Install on your machine
----------------------------------
1. [Download and unzip.](https://github.com/jbossdemocentral/brms-install-demo/archive/master.zip)

2. Add product installer to installs directory.

3. Run 'init.sh' or 'init.bat' file. 'init.bat' must be run with Administrative privileges

4. Login to http://localhost:8080/business-central  (u:erics / p:jbossbrms1!)

5. Enjoy installed and configured JBoss BRMS 6.


Option 2 - Install with one click in xPaaS (brmsPaaS)
-----------------------------------------------------
After clicking button, ensure `Gear` size is set to `large`:

[![Click to install OpenShift](http://launch-shifter.rhcloud.com/launch/light/Install brmsPaaS.svg)](https://openshift.redhat.com/app/console/application_type/custom?&cartridges[]=https://raw.githubusercontent.com/jbossdemocentral/cartridge-brmsPaaS/master/metadata/manifest.yml&name=brmspaas&gear_profile=large&initial_git_url=)

Once installed you can use the JBoss BRMS logins: 

   * u:erics  p: jbossbrms  (admin)

   * u: alan  p: jbossbrms  (analyst)

Current hosting of bpmPaaS is on JBoss BRMS 6.0.2 in OpenShift Online.


Option 3 - Generate containerized install
-----------------------------------------
The following steps can be used to configure and run the demo in a container

1. [Download and unzip.](https://github.com/jbossdemocentral/bpms-install-demo/archive/master.zip)

2. Add product installer to installs directory.

3. Copy contents of support/docker directory to the project root.

4. Build demo image

	```
	docker build -t jbossdemocentral/brms-install-demo .
	```
5. Start demo container

	```
	docker run -it -p 8080:8080 -p 9990:9990 jbossdemocentral/brms-install-demo
	```
6. Login to http://&lt;DOCKER_HOST&gt;:8080/business-central  (u:erics / p:jbossbrms1!)

7. Enjoy installed and configured JBoss BRMS 6.

Additional information can be found in the jbossdemocentral container [developer repository](https://github.com/jbossdemocentral/docker-developer)


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
