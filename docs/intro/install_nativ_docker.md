## Docker nativ: 3 Step Installation Guide
### 1. Clone Repository
After cloning the repository, for example, change the branch to the one you require:
```
git clone https://github.com/DCSO/MISP-dockerized.git
```

### 2. Start Docker Environment
To start the deployment and build the configuration files and configure the whole environment, simply enter:
```
make install
```


### 3. Login in your new MISP Environment

**`Gratulation! Your MISP Environment is deployed!`**

Now you can setup and configure your MISP Environment as normal.
If you need Help look here: (https://www.circl.lu/doc/misp/)

Special for Quick Start in MISP: (https://www.circl.lu/doc/misp/quick-start/)



### Further Configuration
#### Configure TLS Certificates and Diffie-Hellmann File (optional)
If you want to include your own TLS webserver certificate (**we recommend this**). You need to store the certificate and the private key file into the github repository (the folder are below). Please make sure that the **certificates** and **keys** are in PEM format - recognizable in the first line:
> "-----BEGIN CERTIFICATE-----"  
or  
"-----BEGIN RSA PRIVATE KEY-----"  

If all prerequsites are fulfilled, you can deploy them as follows:
* Copy the Certificate **Key** File to `<PATH to MISP-dockerized>/config/ssl/key.pem` 
* Copy the Certificate **Chain** file to `<PATH to MISP-dockerized>/config/ssl/cert.pem`
* (**OPTIONAL**) During installation Diffie-Hellman Params will be freshly generated, but if you still want to create them by yourself, use the following command <sup>[1](#weakdh)</sup> or copy your existing one to `<PATH to MISP-dockerized>/config/ssl/dhparams.pem`



### Manual Configuration (ONLY OPTIONAL)
The following sections describe additional options that **MISP-dockerized** provides during the start of the Docker environment (Step 3). These features are optional and we recommend them only to experienced users.

#### 3.1. [OPTIONAL] look if all required components are installed
**MISP dockerized** provides a script that checks if all requirements are met and all components are installed. For example, is the user part of the docker group and has the appropriate permission for the github repository folder. To run the script, simply start it with:  
```
make requirements
```

#### 3.2 [OPTIONAL] Manual build Configuration Files
If you want to create all configuration files manually, **MISP dockerized** provides a build script that creates all necessary files for you. Just start it with:   
```
$> make build-config
```
The build script download our DCSO/misp-robot and start him with the build script. Therefore you can't find the script directly in the github repository.

#### 3.3 [OPTIONAL] Manual deploy Environment
To start the deployment process, simply enter:
```
$> make pull
```

#### 3.4 [OPTIONAL] Manual deploy Environment
To start the deployment process, simply enter:
```
$> make deploy
```

After these step, you now should have a configured running MISP Instance!


