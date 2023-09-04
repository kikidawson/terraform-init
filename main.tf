resource "aws_s3_bucket" "state" {
  bucket = "${var.project_name}-state-bucket"

  tags = {
    Name = "${var.project_name}-state-bucket"
  }
}

resource "aws_s3_bucket_policy" "state" {
  bucket = aws_s3_bucket.state.id
  policy = data.aws_iam_policy_document.state.json
}

resource "aws_s3_bucket_versioning" "state" {
  bucket = aws_s3_bucket.state.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "lock" {
  name           = "${var.project_name}-lock"
  hash_key       = "LockID"
  read_capacity  = 1
  write_capacity = 1

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "${var.project_name}-lock"
  }
}

resource "aws_iam_role" "deployment" {
  name               = "${var.project_name}-deployment"
  assume_role_policy = data.aws_iam_policy_document.trust_policy.json

  tags = {
    Name = "${var.project_name}-deployment"
  }
}

resource "aws_iam_role_policy_attachment" "deployment" {
  role        = aws_iam_role.deployment.name
  policy_arn  = "arn:aws:iam::aws:policy/AdministratorAccess"
}
