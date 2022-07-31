#!/bin/bash

file=main.tf.bak
python_script=accept_ram.py

./init.sh && \
terraform init && \
terraform apply --auto-approve && \
python3 ./$python_script && \
sed -i.tmp 's/#//g' main.tf &&\
terraform init && \
terraform apply --auto-approve; 

cat << FIN > $file   
module "tgw" {
  source = "./tgw"
}

module "shared_vpc" {
  source = "./shared_vpc"
  tgw_id = module.tgw.tgw_id
  tgw_arn = module.tgw.tgw_arn
}

module "ram" {
  source = "./ram"
  tgw_id = module.tgw.tgw_id
  tgw_arn = module.tgw.tgw_arn

}

#   module "dev_vpc" {
#     source = "./dev_vpc"
#     tgw_id = module.tgw.tgw_id
#     tgw_arn = module.tgw.tgw_arn
#   } 
FIN

sed -i.tmp 's/FIN//g' $file 