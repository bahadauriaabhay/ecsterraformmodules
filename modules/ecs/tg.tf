resource "aws_lb" "test" {
  name               = "awslb-${var.name}"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_public.id]
  subnets            = [module.network.public_subnet_ids1,module.network.public_subnet_ids2]
}

resource "aws_lb_target_group" "test" {
  name     = "aws-lb-target-group-${var.name}"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.network.vpcid
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.test.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.test.arn
  }
}