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

   module "dev_vpc" {
     source = "./dev_vpc"
     tgw_id = module.tgw.tgw_id
     tgw_arn = module.tgw.tgw_arn
   } 
