module "vpc" {
  source = "../../modules/vpc"

  environment     = local.environment
  name            = local.main_vpc.name
  vpc_cidr_block  = local.main_vpc.vpc_cidr_block
  public_subnet   = local.main_vpc.public_subnet
  private_subnet  = local.main_vpc.private_subnet
  restrict_subnet = local.main_vpc.restrict_subnet
}

# module "redis_cluster" {
#   source = "../../modules/elasticache"

#   environment        = local.environment
#   name               = "${local.app_name}-${local.environment}-redis"
#   subnet_group_name  = module.vpc.elasticache_subnet_group
#   security_group_ids = [aws_security_group.redis_cluster.id]
#   # num_cache_nodes    = 2
# }

module "ecr" {
  source = "../../modules/ecr"

  environment = local.environment
  name        = "${local.app_name}-${local.environment}"
}

module "ecs_cluster" {
  source = "../../modules/ecs_cluster"

  environment = local.environment
  name        = "${local.app_name}-${local.environment}"
}

# module "application_demo_app" {
#   source = "../../modules/application/demo_app"

#   environment = local.environment
#   basename    = "demo_app"
#   # alb_log_bucket     = module.log.alb_log_bucket
#   vpc_id             = module.vpc.vpc_id
#   public_subnet_ids  = module.vpc.public_subnet_ids
#   private_subnet_ids = module.vpc.private_subnet_ids
#   # app_domain         = local.bm_app.app_domain
#   # ecs_cluster_arn = module.ecs_cluster.arn
#   # alb_allow_ips      = local.bm_app.alb_allow_ips
#   # zone_id            = module.route53_zone.zone_id

#   # cloudmap_namespace_id = module.cloudmap.namespace_id

#   # alb_dns_routing_weight = 100

#   # task_execution_role_arn = module.iam_role_bm_app.task_execution_role_arn
#   # task_role_arn           = "arn:aws:iam::${local.current_aws_account_id}:role/ecsTaskExecutionRole" # TODO
# }

