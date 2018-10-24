## Docker nativ: 4 Step Installation Guide
### 1. Clone Repository
After cloning the repository change the branch to the required, for example:
```
$> git clone https://github.com/DCSO/MISP-dockerized.git
```

### 2. Configure TLS Certificates and Diffie-Hellmann File (optional)
Before you start the container, you have to setup the TLS certificates and the Diffie-Hellman file.  
Please make sure that the **certificate** and **key** are in PEM-Format - recognizable in the first line:
> "-----BEGIN CERTIFICATE-----"  
or  
"-----BEGIN RSA PRIVATE KEY-----"  

when opening it in an editor like 'vim' or 'nano'  

If all prerequsites are fulfilled, you can deploy them as follows:
* Copy the Certificate **Key** File to `./config/ssl/key.pem` 
* Copy the Certificate **Chain** file to `./config/ssl/cert.pem`
* (**OPTIONAL**) During installation Diffie-Hellman Params will be freshly build, but if you still want to create them yourself, use the following command <sup>[1](#weakdh)</sup> or copy your existing one to `./config/ssl/dhparams.pem`

### 3. Start Docker Environment
To start the deployment and build the configuration files and configure the whole environment, simply enter:
```
$> make install
```
We decided, that build config and deploy environment can be done in one step.

#### 3.1. [OPTIONAL] look if all required components are installed
**MISP dockerized** comes with a requirements script that checks if all components are installed, is the user part of the docker group and has the user the right permission on the github repository folder. Simply start:   
```
$> make requirements
```

#### 3.2 [OPTIONAL] Manual build config 
If you want to do it manual: **MISP dockerized** comes with a build script that creates all required config files. Simply start:   
```
$> make build-config
```
The build script download our DCSO/misp-robot and start him with the build script. Therefore you can't find the script directly in the github repository.

#### 3.3 [OPTIONAL] Manual deploy environment
To start the deployment process, simply enter:
```
$> make deploy
```

#### 3.4 [OPTIONAL] Configure the Instance
After deployment, you now have a simple basic MISP installation without any further configuration. To configure the instance with all specified parameters, use the following command:
```
$> make configure
```
After these step, you now should have a configured running MISP Instance!

### 4. Login in your new MISP Environment

**`Gratulation! Your MISP Environment is deployed!`**

Now you can setup and configure your MISP Environment as normal.
If you need Help look here: `https://www.circl.lu/doc/misp/`
Special for Quick Start in MISP: `https://www.circl.lu/doc/misp/quick-start/`

