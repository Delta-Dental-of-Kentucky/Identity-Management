# Identity-Management
Local identity and identity administration services

## Dependencies
### Frontend
#### Node Modules
From a terminal window in the Identity.Management.STS.Identity folder, install the node modules:
`npm install`

#### Gulp
If gulp is not installed globally, then install it:
`npm install gulp --global`

Also install gulp locally:
`npm install gulp`

After gulp has been installed, run the gulp tasks to generate the css and js files:
`gulp build`

This task will generate the files and place them in the wwwroot\dist tree where they are reference by the Shared Layout Razor files.

The Dockerfile has been modified to execute these steps as part of the image build.  However, Visual Studio does not execute these steps when debugging the container so for local development `gulp build` still needs to be run manually.

### Backend
#### Database Login
The database backup/restore contains a user for the Identity database.  However, the backup/restore process does not create the login.  Prior to restoring the database, manually create the login associated with the app user.  If the database has already been restored, then attempts to add the login may fail.  In this case it may be necessary to add a different login and user and then adjust the configuration files accordingly.
