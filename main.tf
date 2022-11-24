module "network" {
  source               = "./modules/network"
}
module "ecs" {
  source               = "./modules/ecs"
  asg_arn              = module.asg.asg_arn
  name                 = "demo1"
  vpc_id               = module.network.vpcid
  public_sg            = [module.sgALB.sgALB]  
  public_sub           = [module.network.public_subnet_ids1,module.network.public_subnet_ids2]   
  on_demand_percentage = 0
  asg_min              = var.asg_min
  asg_max              = var.asg_max
  desired_capacity     = var.desired_capacity
  asg_target_capacity  = var.asg_target_capacity

  container_cpu        = var.container_cpu
  container_memory     = var.container_memory
  containerPort        = var.containerPort
  hostPort             = var.hostPort
   
}
module "sg" {
  source              = "./modules/sg"
  name                = "ecs" 
  sg_cidr             = [module.network.cidr_block]
  sg_vpc_id           = module.network.vpcid
  port                = 80

}

  module "sgALB" {
  source              = "./modules/sg"
  name                = "ecs2" 
  sg_cidr             = ["0.0.0.0/0"]
  sg_vpc_id           = module.network.vpcid
  port                = 80

}
module "asg" {
  source              = "./modules/asg"
  name                = "demo1"
  asg_max             = 1
  asg_min             = 1
  health_check_type   = "ELB"
  desired_capacity    = 1
  force_delete        = "true"
  instance_types      = "t2.micro"
  asg_sg              = [module.sg.sgALB] 
  vpc_zone_id         = [module.network.private_subnet_ids1,module.network.private_subnet_ids2]

}     