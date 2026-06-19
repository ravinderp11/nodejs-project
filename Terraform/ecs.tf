resource "aws_ecs_cluster" "cluster" {

  name = "node-cluster"

}

resource "aws_ecs_task_definition" "task" {

  family = "node-app"

  requires_compatibilities = ["FARGATE"]

  network_mode = "awsvpc"

  cpu = "256"

  memory = "512"

  execution_role_arn = "arn:aws:iam::496097747127:role/ecsTaskExecutionRole"

  container_definitions = jsonencode([
    {
      name = "node-app"

      image = "${aws_ecr_repository.repo.repository_url}:latest"

      essential = true

      portMappings = [
        {
          containerPort = 3000
        }
      ]
    }
  ])

}

resource "aws_ecs_service" "service" {

  name = "node-service"

  cluster = aws_ecs_cluster.cluster.id

  task_definition = aws_ecs_task_definition.task.arn

  desired_count = 1

  launch_type = "FARGATE"

  network_configuration {

    subnets = [
      var.subnet1,
      var.subnet2
    ]

    security_groups = [
      var.sg
    ]

    assign_public_ip = true

  }

}