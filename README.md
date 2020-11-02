# NIC_Project
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
Steps To Configure:
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

**1. Download and install Node Js**
-------------------------------------------------------------------------------------

Binaries, installers, and source tarballs are available at https://nodejs.org/en/download/.

Install Node.js and NPM from Browser

-------------------------------------------------------------------------------------

###### 1. Once the installer finishes downloading, launch it. Open the downloads link in your browser and click the file. Or, browse to the location where you have saved the file and double-click it to launch.

###### 2. The system will ask if you want to run the software – click Run.

###### 3. You will be welcomed to the Node.js Setup Wizard – click Next.

###### 4. On the next screen, review the license agreement. Click Next if you agree to the terms and install the software.

###### 5. The installer will prompt you for the installation location. Leave the default location, unless you have a specific need to install it somewhere else – then click Next.

###### 6. The wizard will let you select components to include or remove from the installation. Again, unless you have a specific need, accept the defaults by clicking Next.

###### 7. Finally, click the Install button to run the installer. When it finishes, click Finish.

###### Verify Installation

Open a command prompt (or PowerShell), and enter the following:

     node –v

The system should display the Node.js version installed on your system. You can do the same for NPM:

     npm –v



-------------------------------------------------------------------------------------
**2. Download and Setup Mysql Server locally.**
-------------------------------------------------------------------------------------

https://dev.mysql.com/downloads/mysql/


-------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------


**3. After Setting Up Node js and Mysql. Open Mysql Workbench and login to local instance.**
-------------------------------------------------------------------------------------
###### Then Navigate to Server->Data Import -> Self-Contained file -> Select File with name(https://github.com/ritvij05/NIC_Project/blob/master/NIC_PROJECT_sqlFile.sql) ->Create New Schema (with name 'pds-nic')-> Click on import.
-------------------------------------------------------------------------------------
**Step1:** 
   ![alt text](https://github.com/ritvij05/NIC_Project/blob/master/Screen%20Shots/Capture1.PNG)
   
**Step2:**
   ![alt text](https://github.com/ritvij05/NIC_Project/blob/master/Screen%20Shots/Capture21.PNG)
   
**Step3:**
   ![alt text](https://github.com/ritvij05/NIC_Project/blob/master/Screen%20Shots/Capture2.PNG)
   
**Step4:**
   ![alt text](https://github.com/ritvij05/NIC_Project/blob/master/Screen%20Shots/Capture4.PNG)
   
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

**4. Once node js and mysql has been setup,Download Zip from github (https://github.com/ritvij05/NIC_Project) and extract it.**
-------------------------------------------------------------------------------------

**5. Open File With Name .env from the downloaded folder and Make The Following Chnages:**
-------------------------------------------------------------------------------------
  
###### - db_local_name = pds-nic
###### - db_local_username = YourUsername
###### - db_local_pass = YourPassword
###### - db_local_server = YourServername
   
   - Above Parameters Can be Found Under 
   -> MysqlWork Bench -> login to local instance (Username and PassWord) -> Server Status
   
   - HostName = YourServername.
   - YourUsername = Username with which you login
   - Yourpassword = Password with which you login
-------------------------------------------------------------------------------------

**6. After Extraction, navigate to that folder and open terminal in Same location**
 -------------------------------------------------------------------------------------
   
    -Enter Following Command To Install Dependencies.
         
         npm install
-------------------------------------------------------------------------------------
**7. After Running Above Command. Run The Following Command**
-------------------------------------------------------------------------------------

         node server.js
-------------------------------------------------------------------------------------
**8. After Running the above command, Open any Browser and insert the following url:**
  http://localhost:3000/
-------------------------------------------------------------------------------------
