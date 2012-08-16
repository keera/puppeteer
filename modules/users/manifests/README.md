### About
This module grants user access to individual servers using facter and regular expressions.
### Configuring the Module
#### 1. Set up the teams variables
Check out the teams.pp documentation for details on creating a new team. To read the docs of a specific file, type

    $ puppet doc <file_name>
#### 2. Set up the switch statement in the virtualusers class
This will map a specific value (ie: application_staging_server) to a client based on its hostname. And when puppet attempts to create a new user, it checks if the user has access to that value.
#### 3. Create the teams and users in the initialization file
Grant access to servers by specifying the value of that server to which the hostname is mapped to in virtualusers.

Sip back and enjoy.
