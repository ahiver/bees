#!/bin/bash

ip a

echo Make sure that wifi link is wlp2s0

# This is need for Ubuntu on Macbook 
sudo iwconfig wlp2s0 txpower 10dBm