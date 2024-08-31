#resource <resource-type> <resource-name>

resource "aws_instance" "expense" {

  for_each = var.instance_names #each.key and each.value ,db = "t3.small"
  ami           = data.aws_ami.ami_info.id
  vpc_security_group_ids =  ["sg-0b8c28fdd8f99cc89"]
  instance_type = each.value #  db = "t3.small" each.key = each.value

  tags = merge (
    var.common_tags, {
       Name = each.key
       Module = each.key
    }
 )
}