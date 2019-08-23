#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
import time
# for external system calls:
import subprocess
# For Parameter Parsing
import argparse
# Add Set capability

def func_check_dependency(program):
    subprocess.run(["command -v", program], shell=True, check=True)

# def func_download_repo_to_tmp():
#     cloned_repo = repo.clone(os.path.join(rw_dir, '/tmp/'))
#     assert cloned_repo.__class__ is Repo     # clone an existing repository
#     assert Repo.init(os.path.join(rw_dir, 'path/for/new/repo')).__class__ is Repo

#def func_find_dockerfiles_in_repo():

def func_arg2markdown(FILE):
    ARG_SET = set()
    # Open a file
    with open(FILE) as file: 
        print ("Opened file: " + DOCKERFILE)
        line_count = 0
        for line in file: 
            line_count = line_count + 1
            line = line.strip().upper()
            if  line.find("ARG") >= 0 and line.find("#",0) != 0:
                tmp = line[4:]       # Remove leading 'ARG '
                tmp = tmp.strip().upper() # remove whitespaces and write it in uppercase
                if tmp.find("=") == -1:
                    tmp = tmp + "=NO DEFAULT"
                if tmp.find("=") == -1 and tmp.find(" ") != -1:
                    pos = tmp.find(" ")                 # search position
                    tmp_str_list = list(tmp)            # convert string in list
                    tmp_str_list[int(pos)] = '='        # Switch ' ' to = 
                    tmp = "".join(tmp_str_list)         # convert list to string
                tmp = tmp + '=' + str(line_count) # Add line number
                ARG_SET.add(tmp)   # store it in an set               
    return ARG_SET

def func_env2markdown(FILE):
    ENV_SET = set()
    FOUND_ENV = 0
    # Open a file
    with open(FILE) as file: 
        print ("Opened file: " + DOCKERFILE)
        line_count = 0
        for line in file: 
            line_count = line_count + 1
            line = line.strip().upper()
            if  ( line.find("ENV",0) == 0 or FOUND_ENV == 1) and line.find("#",0) == -1:
                tmp = line # remove whitespaces and write it in uppercase
                # Check if line has \
                if tmp.find('\\') >= 0:
                    FOUND_ENV = 1
                    tmp = tmp[:-2]       # Remove leading 'ENV '
                # Check if line has no \
                if tmp.find('\\') == -1:
                    FOUND_ENV = 0
                # Check if line has ENV
                if tmp.find("ENV") >= 0:
                    tmp = tmp[4:]       # Remove leading 'ENV '
                # Check if line has no = and a ' '
                if tmp.find("=") == -1 and tmp.find(" ") != -1:
                    pos = tmp.find(" ")                 # search position
                    tmp_str_list = list(tmp)            # convert string in list
                    tmp_str_list[int(pos)] = '='        # Switch ' ' to = 
                    tmp = "".join(tmp_str_list)         # convert list to string
                # Check if line has no = -> no default value
                if tmp.find("=") == -1:
                    tmp = tmp + "=No default"
                # add line number 
                tmp = tmp + '=' + str(line_count) # Add line number
                # store line
                ENV_SET.add(tmp)   # store it in an set  
    return ENV_SET

def func_writeReadmeContainerRepo(ARG,ENV,OUTPUT_FILE):
    # Extract Component from repo path
    COMPONENT = OUTPUT_FILE.split('/')[4][16:]
    
    with open(OUTPUT_FILE, "w") as f: 
        f.write("# Description\n\n")
        f.write("This container is part of the MISP-dockerized environment. The Project is hosted on github: https://github.com/DCSO/MISP-dockerized.\n\n")
        f.write("[![Build Status](https://travis-ci.org/DCSO/MISP-dockerized-"+COMPONENT+".svg?branch=master)](https://travis-ci.org/DCSO/MISP-dockerized-"+COMPONENT+")\n")
        f.write("\n# Documentation\n\n")
        f.write("For this Container please look at https://dcso.github.io/MISP-dockerized-docs/container-information/MISP-dockerized-"+COMPONENT+".html\n")
        f.write("See https://dcso.github.io/MISP-dockerized-docs/ for more documentation.\n")
        f.write("\n# License\n\n")
        f.write("View [license information](https://github.com/DCSO/MISP-dockerized-"+COMPONENT+"/blob/master/LICENSE) for the software contained in this image. As with all Docker images, these likely also contain other software which may be under other licenses (such as Bash, etc from the base distribution, along with any direct or indirect dependencies of the primary software being contained). As for any pre-built image usage, it is the image user's responsibility to ensure that any use of this image complies with any relevant licenses for all software contained within.\n")

def func_searchalldockerfiles(FILE_PATH):
    FILES = set()
    # This is to get the directory that the program  
    # is currently running in. 
    dir_path = FILE_PATH
    

    for root, dirs, files in os.walk(dir_path): 
        for file in files:  
            if file == 'Dockerfile':
                breakpoint()
                FILES.add(root+'/'+file)
    
    return FILES

def func_writeReadmeDocsRepo(ARG,ENV, DOCKERFILES,OUTPUT_FILE):
    breakpoint()
    # Extract Component from repo path
    COMPONENT = OUTPUT_FILE.split('/')[4][16:]
    GIT_REPO="https://github.com/DCSO/MISP-dockerized-"+COMPONENT+"/blob/master"

    # print ('Arg:')
    # for x in ARG:
    #     print (x)

    # print ('')
    # print ("Env:")
    # for x in ENV:
    #     print (x)

    with open(OUTPUT_FILE, "w") as f: 
        f.write("# # [MISP-dockerized-"+COMPONENT+"](https://github.com/DCSO/MISP-dockerized-"+COMPONENT+")\n\n")
        if COMPONENT == 'any':
            f.write("\n## Available MISP Versions (Supported Tags and Respective `Dockerfile` Links)")
            f.write("\n ### Supported Builds")
        else:
            f.write("\n## Supported Tags and Respective `Dockerfile` Links)\n")
            x = 0
            for DOCKERFILE in sorted(DOCKERFILES):
                f.write("["+x+"]: https://github.com/DCSO/MISP-dockerized-"+COMPONENT+"/blob/master/"+DOCKERFILE+"/Dockerfile\n")
                x = x + 1
            x = 0
            for DOCKERFILE in sorted(DOCKERFILES):
                tmp_version,tmp_base = DOCKERFILE.split("-")
                tmp_main,tmp_minor = tmp_version.split(".")
                if x == DOCKERFILES.count():
                    f.write("- [`"+tmp_version+"`, `"+DOCKERFILE+"`, `latest`]["+x+"]\n")    
                else:
                    f.write("- [`"+tmp_version+"`, `"+DOCKERFILE+"`]["+x+"]\n")
                x = x + 1
            
            

if __name__ == '__main__':
    # parser = argparse.ArgumentParser(description='Extract Dockerfile Data and write an awesome readme.')
    # parser.add_argument("-r","--repo", help="Git Repository to scan")
    # parser.add_argument("-f","--repo_folder", help="Local Repository Folder Default /tmp/tmp_$REPOSITORY")
    # parser.add_argument("-u","--repo_url", help="Git Repository URL to download Git Repository")
    # args = parser.parse_args()

    # if args.repo == None:
    #     print("[ERROR] The script require the Git Repository which should be scanned.")
    #     print("")
    #     parser.print_help()
    #     exit(1)
    # else:
    #     REPO = args.repo

    # if args.repo_url == None:
    #     if REPO != None:
    #         REPO_URL = "https://github.com/"+ REPO + ".git"
    # else:
    #     REPO_URL = args.repo_url

    # if args.repo_folder == None:
    #     REPO_FOLDER = "/tmp/tmp_" + REPO
    # else:
    #     REPO_FOlDER = args.repo_folder


    # Check Dependencies
    #func_check_dependency("git")

    ####

    DOCKERFILE = "/home/max/repos/MISP-dockerized-server/2.4.nightly-debian/Dockerfile"
    
    DOCKERFILES_set = func_searchalldockerfiles('/home/max/repos/MISP-dockerized-server')
    ARG_set = func_arg2markdown(DOCKERFILE)
    ENV_set = func_env2markdown(DOCKERFILE)
    

    #func_writeReadmeContainerRepo(ARG_set,ENV_set,'/home/max/repos/MISP-dockerized-server/test.md')
    func_writeReadmeDocsRepo(ARG_set,ENV_set, DOCKERFILES_set,'/home/max/repos/MISP-dockerized-docs_public/docs/container-information/test-server.md')