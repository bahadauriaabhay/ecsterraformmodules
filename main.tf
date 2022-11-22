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
  asg_max              = 3
  desired_capacity     = 1
  asg_target_capacity  = 80

  container_cpu        = 100
  container_memory     = 512
  containerPort        = 80
  hostPort             = 80
}
