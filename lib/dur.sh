# durdn/cfg related commands {{{
function dur {
  case $1 in
  list|li)
    curl --user $2:$3 https://api.bitbucket.org/1.0/user/repositories 2> /dev/null | grep "name" | sed -e 's/\"//g' | col 2 | sort | uniq | column
    ;;
  clone|cl)
    git clone git@bitbucket.org:durdn/$2.git
    ;;
  install|i)
    $HOME/.cfg/install.sh
    ;;
  reinstall|re)
    curl -Ls https://raw.github.com/griff/cfg/master/install.sh | bash
    ;;
  status|s)
    if [ $(whoami) = "root" ];
      then
        home="/root";
      else
        home="$HOME";
    fi
    if git --git-dir="$home/.cfg/.git" check -q; then
      branch_orig_hash="$(git show-ref -s --verify refs/heads/master 2> /dev/null)"
      git --git-dir="$home/.cfg/.git" fetch -q origin master
      branch_remote_hash="$(git show-ref -s --verify refs/remotes/origin/master 2> /dev/null)"
      if [ "$branch_orig_hash" != "$branch_remote_hash" ]; then
        if ! git --git-dir="$home/.cfg/.git" pull --ff-only -q origin master 2> /dev/null; then
          echo ".cfg could not be fast-forwarded"
        fi
      fi
      branch_hash="$(git show-ref -s --verify refs/heads/master 2> /dev/null)"
      if [ "$branch_orig_hash" != "$branch_hash" ]; then
        echo ".cfg has been updated. Reinstalling..."
        $home/.cfg/install.sh
      fi
    else
      echo ".cfg has uncommitted changes"
    fi
    ;;
  move|mv)
    git remote add bitbucket git@bitbucket.org:durdn/$(basename $(pwd)).git
    git push --all bitbucket
    ;;
  trackall|tr)
    #track all remote branches of a project
    for remote in $(git branch -r | grep -v master ); do git checkout --track $remote ; done
    ;;
  key|k)
    #track all remote branches of a project
    ssh $2 'mkdir -p .ssh && cat >> .ssh/authorized_keys' < ~/.ssh/id_rsa.pub
    ;;
  fun|f)
    #list all custom bash functions defined
    typeset -F | col 3 | grep -v _ | xargs | fold -sw 60
    ;;
  def|d)
    #show definition of function $1
    typeset -f $2
    ;;
  help|h|*)
    echo "[dur]dn shell automation tools - (c) 2011 Nicola Paolucci nick@durdn.com"
    echo "commands available:"
    echo " [cr]eate, [li]st, [cl]one"
    echo " [i]nstall,[m]o[v]e, [re]install"
    echo " [f]fun lists all bash functions defined in .bashrc"
    echo " [def] <fun> lists definition of function defined in .bashrc"
    echo " [k]ey <host> copies ssh key to target host"
    echo " [tr]ackall], [h]elp"
    ;;
  esac
}