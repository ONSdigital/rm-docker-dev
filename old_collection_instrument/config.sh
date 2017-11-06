#! /bin/bash

sed -ie 's/\(db_name \= \).*$/\1postgres/' 'config.ini'
sed -ie 's/\(db_host \= \).*$/\1postgres/' 'config.ini'
sed -ie 's/\(authentication \= \).*$/\1false/' 'config.ini'
