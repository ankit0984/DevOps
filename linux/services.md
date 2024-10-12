Basic commands for linux:-
========================
```bash
ls # list all directories or files
ls -ltr # list all directories and files with permission, extension, user, etc
cp # copy file one directory to another
mkdir  # make directories or folder in linux
touch # create a file
vim # editor like note pad in linux, it creates and open file for ading content
nano # also a editor like notepad
mv # move files or directories one directory to another
chmod # helps to change permissions of file and flder
su # helps to switch user
man # it helps to describe the commands, adding suffix like man ls it will showw metadata of ls command
rm -r # removve any files or folder
cat # it uses for display the content of file
cat > file.txt # it will also create and allow to add content
pwd # it helps to explain the present directory
echo # it will print the content

```
## Bash Scripting command
```bash
ps -ef | grep amazon |awk -F" " '{print $2}'
set -x # debug mode
set -e # exii the script when there is an error
set -o pipefail # check the authenticity of next command, if it not use then set -e will not figure out if any isseue in pipe
curl
find
find / -name "filename" # use of find
sudo su -

ps -ef # display all processes in full format
ps -ef | grep "process name" # search for a specific process
awk
```

Services in linux
====================

```bash
> service httpd start # start HTTPD service
> systemctl start httpd # start HTTPD service
> systemctl stop httpd #stop HTTPD service
> systemctl status httptd # check HTTPD service status
> systemctl enable httpd # configure HTTPD to start at startup
> systemctl disable httpd # configure HTTPD to not start at startup

```

Permissions in linux
====================
In Linux, file permissions are divided into three categories: read (`r`), write (`w`), and execute (`x`). These permissions can be set for three different types of users: the owner, the group, and others. Here is a breakdown of the different file permissions:

1. **Read (`r`)**: Allows a user to read the contents of the file.
2. **Write (`w`)**: Allows a user to modify or delete the file.
3. **Execute (`x`)**: Allows a user to execute the file, if it is a script or a binary.

Permissions are represented in a string of 10 characters, for example: `-rwxr-xr--`. The first character indicates the file type (`-` for a regular file, `d` for a directory, etc.), and the next nine characters are divided into three sets of three, representing the permissions for the owner, group, and others, respectively.

Here is a detailed example:

- `rwxr-xr--`
  - `rwx`: The owner has read, write, and execute permissions.
  - `r-x`: The group has read and execute permissions.
  - `r--`: Others have read permissions.

Permissions can also be represented numerically using octal notation:

- `rwx` = 7 (4 for read + 2 for write + 1 for execute)
- `rw-` = 6 (4 for read + 2 for write)
- `r-x` = 5 (4 for read + 1 for execute)
- `r--` = 4 (4 for read)
- `-wx` = 3 (2 for write + 1 for execute)
- `-w-` = 2 (2 for write)
- `--x` = 1 (1 for execute)
- `---` = 0 (no permissions)

```bash
chmod 777 # All users can read, write, and execute.
chmod 644 # The owner can read and write, while the group and others can only read.
chmod 600 # Only the owner can read and write.

```
