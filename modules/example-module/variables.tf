variable "example_variable" {
  description = "An example variable for the example module"
  type        = string
  default     = "default_value"
}

variable "example_count" {
  description = "Number of examples to create"
  type        = number
  default     = 1
}

variable "example_enabled" {
  description = "Enable or disable the example module"
  type        = bool
  default     = true
}