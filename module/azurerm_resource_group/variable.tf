variable "resource" {
  description = "creat resource group of club member"
  type = map(object({
    name       = string
    location   = string
    managed_by = optional(string)
    tags       = optional(map(string), {})
  }))
}