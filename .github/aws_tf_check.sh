#!/bin/bash

#block of variable settings according source "variables.tf"

ec2amisrc="ami-05d34d340fb1d89e5"
publicsubnetAZsrc="eu-central-1a"
ec2typesrc="t2.micro"


#cutting off not needed "spaces" in file with terramorm outputs data
tr -d ' ' < result > result1

#dos2unix (preventing errors if windows file format used) 
tr -d '\r' < result1 > result


# using set of variables in "result" file (terramorm outputs data) using "source" construction
. ./result


exit_code=1

if [ "$ec2_ami" = "$ec2amisrc" ] && \
   [ "$public_subnet_AZ" = "$publicsubnetAZsrc" ] && \
   [ "$ec2_type" = "$ec2typesrc" ] && \
   [ -n "$ec2_public_ip" ] && \
   [ -n "$public_vpc_id" ] && \
   [ -n "$ec2_subnet_id" ]; then
    exit_code=0
fi

if [[ $exit_code  == 0 ]]; then
   echo "Passed"
else
   echo "Failed"
   exit 1
fi
