#!/bin/bash

awk '/kinetic-energy/{ecut=$4} /^!.*total/{print ecut, $5}' *out
