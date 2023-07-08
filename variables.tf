variable "instancetype" {
    default = "t2.micro"
  
}

variable "lists" {
    type = list
    description = "avialbility zones listings"
    default =  ["t2.micro","t2.nano","t2.large"]
}

variable "maps" {
    type = map 
    description = "maps for type of instance"
    default = {
     us-east-1 = "t2.micro"
     us-west-2 = "t2.nano"
    }  
}