function java_home {
  export JAVA_HOME="$(/usr/libexec/java_home "$@")"
}
