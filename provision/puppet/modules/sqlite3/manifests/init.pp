class sqlite3 (
  $sqlite_packages = ["sqlite3", "libsqlite3-dev"]
  ) {
    package { $sqlite_packages:
    ensure => "latest"
  }

}
