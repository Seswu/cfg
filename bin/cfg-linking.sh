#!/bin/bash -v
trap read debug

# Command to locate all (probably) configuration files that have been linked to cfg repo directory
# find -maxdepth 3 -type l -lname "*" | grep -v ".so" | xargs ls -l | awk '{print $11, $9}'

ln -rs  solo/repositories/setup/cfg/.bash_profile      .bash_profile
ln -rs  solo/repositories/setup/cfg/.bashrc            .bashrc
ln -rs  solo/repositories/setup/cfg/.profile           .profile
ln -rs  solo/repositories/setup/cfg/.gitconfig         .gitconfig
ln -rs  solo/repositories/setup/cfg/.gitmessage.txt    .gitmessage.txt
mkdir .config
mkdir .config/i3
ln -rs  solo/repositories/setup/cfg/i3_config          .config/i3/config
ln -rs  solo/repositories/setup/cfg/memo.md            memo.md
ln -rs  solo/repositories/setup/cfg/.screenrc          .screenrc
ln -rs  solo/repositories/setup/cfg/.tmux.conf         .tmux.conf

# Current loc: /home/seswu/data/to-sort/lenovo-t520-laptop/fluxus/.timewarrior ./.timewarrior
mkdir .timewarrior
ln -rs  solo/repositories/setup/cfg/timewarrior.cfg     .timewarrior/timewarrior.cfg
ln -rs  solo/data/state/.timewarrior/data               .timewarrior/data
ln -rs  solo/data/state/.timewarrior/extensions         .timewarrior/extensions
