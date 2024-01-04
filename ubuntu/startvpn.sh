#!/bin/bash

openvpn --config /root/.ssh/xernosch.ovpn --cert /root/.ssh/home.xernosch.com.crt --key /root/.ssh/home.xernosch.com.key >> /root/.ssh/openvpn.log 2>&1 &


