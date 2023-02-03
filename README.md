# dotnet-git-hooks
Git hooks built for dotnet core projects

### Resources

- You need to have git installed on your machine.
- Basic knowledge of shell script (at least to execute it!)

### Default explanation of this repository git hooks

- Clone this repository in the same directory level where you have your dotnet core projects, it must be in the same parent directory to work.
- By default these git hooks work to protect 3 remote branches: 
    - development
    - staging
    - master
- By default, these git hooks automatically run unit tests on push action if the dotnet project has a unit test project folder called with ending "-test"

### Steps to install the repositories hooks

- Edit the manage-hooks.bash file by replacing the placeholder "<list of repositories split by space>" with your list of repositories of the parent directory.
- Save and Execute the script
- Choose the option and be happy!