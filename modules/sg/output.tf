output "sg_ids" {
    value = {
        for k, sg in aws_security_group.sec_grp : k => sg.id
    }
}