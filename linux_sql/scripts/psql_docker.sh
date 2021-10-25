#!/bin/bash
#Start docker
sudo systemctl status docker || systemctl start docker
#check container status. If container exists then $exit==2
exists=$( docker container ls -a -f name="$2" | wc -l )
if [[ $1 == "start" ]] | [[ $1 == "stop" ]] | [[ $1 == "create" ]]; then
  case $1 in

  start) #start the container and print error message if not created
    if [[ "$exists" == 2 ]]; then
      docker start "$2"
    else
      echo Cannot able to start the specified container as it is not created
    fi
    exit $?
  ;;

  stop) #stop the container and print error message if it is not created
    if [[ "$exists" == 2 ]]; then
      docker stop "$2"
    else
      echo Cannot able to stop the container as it is not created
    fi
    exit $?
  ;;

  create)
    if [[ "$exists" == 2 ]]; then #if the container already exists
      echo The container already exists!
      echo usage:
      docker stats "$2"
    else
      if [ "$2" != '' ] && [ "$3" != '' ]; then #creates psql container with the given username and password
        docker volume create pgdata
        docker run --name="$2" -e POSTGRES_PASSWORD="$3" -d -v pgdata:/var/lib/postgresql/data -p 5432:5432 postgres:9.6-alpine
      else #gives error message if username and password is missing
        echo please provide username and password
      fi
      exit $?
    fi
    exit 1
  ;;
  esac
else
  echo please enter valid options from start, stop or create with username nd password
fi
exit 0
