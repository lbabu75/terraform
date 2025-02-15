module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "terraform-eks"
  cluster_version = "1.31"
  subnet_ids      = ["subnet-0d2fbaf0ca7b5e65c", "subnet-03fd34fbc1a0bd877"]
  vpc_id          = "vpc-042fbd075506ff6f3"
}
