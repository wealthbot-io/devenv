# Localstack Environment Folder

This Folder is intended to hold development environment init data for localstack and also the persistent data.

`init` folder holds the initialization data (checked out to VCS).
`storage` folder holds the persistent data of the environment (copied from init on build, and then kept dynamically 
by the env).

Periodically is strongly recommended to reinitialize the storage folder, replacing it contents with the init folder 
contents.