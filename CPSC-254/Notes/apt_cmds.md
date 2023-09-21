# Package Management - APT Commands:
- `APT tool`  
    - Debian, Ubuntu, other derivatives use this Advanced Packaging Tool for package management.

### PACKAGE MANAGEMENT:
- `Package Manager`  
    - Collection of software tools to automate installing, upgrading, configuring, and removing programs in a consistent manner.
- `Packages`  
    - Distributions of software and data in archive files, containing metadata like name, purpose, version, vendor, and dependencies.
- `Local Package Database`  
    - Stores metadata upon installation, managed by the package manager.
- `Software Dependencies and Version Info`  
    - Managed by package manager to prevent mismatches and missing prerequisites.
- `Software Repositories, Binary Repository Managers, App Stores`  
    - External sources that package managers work closely with.
- `Eliminate Manual Installs and Updates`  
    - Key benefit, especially useful for large enterprises with Linux or Unix-like systems consisting of numerous software packages.


### APT-GET:
- `apt-get install <package-name(s)>`  
    - Installs the specified package(s), along with any dependencies.
- `apt-get remove <package-name(s)>`  
    - Removes the specified package(s), but does not remove dependencies.
- `apt-get autoremove`  
    - Removes any orphaned dependencies, those no longer required.
- `apt-get clean`  
    - Removes downloaded package files (.deb) for software that is already installed.
- `apt-get purge <package-name(s)>`  
    - Removes the package(s) and their configuration files.
- `apt-get update`  
    - Updates the system’s database of packages from `/etc/apt/sources.list`.
- `apt-get upgrade`  
    - Upgrades all packages if updates are available; run this after `apt-get update`.

### APT-CACHE
- `apt-cache`  
    - Provides additional package information, supplementing `apt-get`.
- `apt-cache search <package-name(s)>`  
    - Searches for alternative names if `apt-get install` fails or is incorrect.
- `apt-cache show <package-name(s)>`  
    - Shows dependency info, version numbers, and basic description of the package.
- `apt-cache depends <package-name(s)>`  
    - Lists packages that the specified package(s) depend upon in a tree format.
- `apt-cache rdepends <package-name(s)>`  
    - Lists packages that depend on the specified package; best used with `| less`.
- `apt-cache pkgnames`  
    - Generates a list of currently installed packages; long output best piped through `less` or directed to a text file.
