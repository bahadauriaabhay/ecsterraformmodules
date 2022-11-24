variable "asg_min" {
    default = 1
}
variable "asg_max" {
    default = 3
}
variable "desired_capacity" {
    default = 1
}
variable "asg_target_capacity" {
    default = 80
}
variable "container_cpu" {
    default = 100
}
variable "container_memory" {
    default = 512
}
variable "containerPort" {
    default = 80
}
variable "hostPort" {
    default = 80
}

variable "port" {
    default = 80
}
variable "force_delete" {
    default = "true"
}