variable "name" {
}
variable "asg_max" {
}
variable "asg_min" {
}
variable "health_check_type" {
}
variable "desired_capacity" {
}
variable "force_delete" {
}
variable "instance_types" {
}
variable "asg_sg" { 
}

variable "vpc_zone_id" {
    default = []
}
