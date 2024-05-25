pom.xml and settings.xml 
In the pom.xml we define where to push the .jar file i.e in the nexus repository for versioning.
 -> we need to have a unique id and url of the nexus repository to enter in pom.xml file

In the settings.xml we define the authentication of the nexus repository
 -> we need to have id (same id we need to mentioned which we gave in pom.xml), username (nexus user-id of the user which we created inside nexus along with the role and the password of the nexus)
 ->This settings.xml should be created inside the user's .m2 folder of the jenkins - maven agent node. (ex. /home/ubuntu/.m2) 
