1. Install Debian; lxde is lightweightest, 'debian desktop environment' is unnecessary.
2. Install curl and git
# 3. Run install script
4. Link config in .config/i3 to .cfg/i3_config. Other choice would be to link whole .config directory, which takes up a *lot* of space.
5. Install preferred packages with genius method: bin/install-packages.sh as root.

# Command to locate all (probably) configuration files that have been linked to cfg repo directory
find -maxdepth 3 -type l -lname "*" | grep -v ".so" | xargs ls -l | awk '{print $9, $11}'
