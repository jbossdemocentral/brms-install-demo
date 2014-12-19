JBoss BRMS 6 Install Demo 
=========================
Project to automate the installation of this product without preconfiguration beyond a single admin user.


Install with one click in xPaaS (brmsPaaS)
-----------------------------------------
After clicking button, ensure `Gear` size is set to `large`:

[![Click to install OpenShift](http://launch-shifter.rhcloud.com/launch/light/Install brmsPaaS.svg)](https://openshift.redhat.com/app/console/application_type/custom?&cartridges[]=https://raw.githubusercontent.com/jbossdemocentral/cartridge-brmsPaaS/master/metadata/manifest.yml&name=brmspaas&gear_profile=large&initial_git_url=)

Once installed you can use the JBoss BRMS logins: 

   * u:erics  p: jbossbrms  (admin)

   * u: alan  p: jbossbrms  (analyst)


Manual setup on OpenShift
-------------------------
1. [Download and unzip.](https://github.com/jbossdemocentral/brms-install-demo/archive/master.zip)

2. Add product installer to installs directory.

3. Run 'init.sh' or 'init.bat' file. 'init.bat' must be run with Administrative privileges

4. Login to http://localhost:8080/business-central  (u:erics / p:jbossbrms1!)

5. Enjoy installed and configured JBoss BRMS 6.


Supporting Articles
-------------------

[Red Hat JBoss BRMS - all product demos updated for version 6.0.2.GA release](http://www.schabell.org/2014/07/redhat-jboss-brms-product-demos-6.0.2-updated.html)


Released versions
-----------------

See the tagged releases for the following versions of the product:

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
