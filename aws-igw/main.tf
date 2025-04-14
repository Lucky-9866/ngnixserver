resource "internet_gate_way" "igw" {
        vpc_id = var.vpc_id

  tags = {
    Name = "main"
}
}