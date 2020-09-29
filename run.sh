#!/bin/sh

nothing -s 0.0.0.0 -p ${PORT:=3000} -k ${PASSWORD:=password} -m ${METHOD:=rc4-md5} --plugin onthing --plugin-opts "server;path=${WSPATH:=/sspath}" >/dev/null 2>&1
