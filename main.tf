module "network" {
  source               = "./modules/network"
}
module "ecs" {
  source               = "./modules/ecs"
  name                 = "demo1"
  instance_types        = "t2.micro"
  vpc_id               = module.network.vpcid

  on_demand_percentage = 0
  asg_min              = 1
  asg_max              = 10
  asg_target_capacity  = 50
}
