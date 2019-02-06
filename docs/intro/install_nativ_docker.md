## Docker Native: 3-Step Installation Guide
### 1. Clone repository
After cloning the repository, for example, change the branch to the one you require:
```
git clone https://github.com/DCSO/MISP-dockerized.git
```

### 2. Start Docker environment
To start the deployment, build the configuration files, and configure the whole environment, simply enter:
```
make install
```


### 3. Log in to your new MISP environment

**`Congratulations! Your MISP environment is deployed!`**

Now you can setup and configure your MISP environment as normal.
If you need help look [here](https://www.circl.lu/doc/misp/).

Special for Quick Start in MISP: https://www.circl.lu/doc/misp/quick-start/.



### Further Configuration
#### Configure TLS Certificates and Diffie-Hellmann File (optional)
If you want to include your own TLS webserver certificate (**we recommend this**), you need to store the certificate and the private key file in the Git repository the folder and the name is:
* `<PATH to MISP-dockerized>/config/ssl/cert.pem` for the **certificate chain** file
* `<PATH to MISP-dockerized>/config/ssl/key.pem` for the certificate **key** file

 Please make sure that the **certificate chain** and **key** are in PEM format - recognizable in the first line:
> "-----BEGIN CERTIFICATE-----"  
or  
"-----BEGIN RSA PRIVATE KEY-----"  

* (**OPTIONAL**) During installation, Diffie-Hellman params will be freshly generated, but if you still want to create them by yourself, copy your existing one to: 
* `<PATH to MISP-dockerized>/config/ssl/dhparams.pem`



### Manual Configuration (Optional)
The following sections describe additional options that **MISP-dockerized** provides during the start of the Docker environment (step 3). These features are optional, and we recommend them to experienced users only.

#### 3.1. [Optional] Look at whether all required components are installed
**MISP dockerized** provides a script that checks whether all requirements are met and all components are installed. For example, is the user part of the Docker group and does he or she have the appropriate permission for the Git repository folder? To run the script, simply start it with:  
```
make requirements
```

#### 3.2 [Optional] Manual build configuration files
If you want to create all configuration files manually, **MISP dockerized** provides a build script that creates all necessary files for you. Just start it with:   
```
make build-config
```

The build script downloads our misp-robot and starts it with the build script. Therefore you cannot find the script directly in the Git repository.

#### 3.3 [Optional] Manual pull environment
To start the image pull process, simply enter:
```
make pull
```

#### 3.4 [Optional] Manual deploy environment
To start the deployment process, simply enter:
```
make deploy
```

After these steps, you now should have a configured running MISP instance!


