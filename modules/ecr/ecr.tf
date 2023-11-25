resource "aws_ecr_repository" "web" {
  name = "${var.name}-web"

  tags = {
    Name   = "${var.name}-web"
    Module = local.module
  }
}


resource "aws_ecr_lifecycle_policy" "default" {
  repository = aws_ecr_repository.web.name

  policy = jsonencode(
    {
      rules = [
        {
          action        = { type = "expire" }
          description   = "keep last 30 images"
          rulePriority = 1
          selection = {
            countNumber = 30
            countType   = "imageCountMoreThan"
            tagStatus   = "any"
          }
        },
      ]
    }
  )
}