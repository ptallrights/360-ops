#!/usr/bin/env python

import os

key = []
value = []
ip_hash = {}
def ifconfig_reg(command):
        command_up = os.popen(command)
        lines = command_up.readlines()
        for line in lines:
                if line[0] != ' ' and line[0] != '\n':
                        keys = line.split()
                        key.append(keys[0])
                        keys= []

                if "inet addr" in line:
                        ip = line.split(":")
                        ip_address = ip[1].split()
                        value.append(ip_address[0])
                        ip = []

if __name__ == "__main__":
        ifcommand = ifconfig_reg("ifconfig")
        number = len(value)
        for j in range(number):
                ip_hash[key[j]] = value[j]
        print ip_hash
