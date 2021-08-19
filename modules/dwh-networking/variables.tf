/**
 * Copyright 2021 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

variable "org_id" {
  description = "The GCP Organization ID."
  type        = string
}

variable "project_id" {
  description = "The ID of the project in which the service account will be created."
  type        = string
}

variable "terraform_service_account" {
  description = "The email address of the service account that will run the Terraform code."
  type        = string
}

variable "commom_suffix" {
  description = "A commom suffix to be used in the module."
  type        = string
  default     = ""
}

variable "region" {
  description = "The region in which the subnetwork will be created."
  type        = string
}

variable "vpc_name" {
  description = "The name of the network."
  type        = string
}

variable "subnet_ip" {
  description = "The CDIR IP range of the subnetwork."
  type        = string
}

variable "perimeter_additional_members" {
  description = "The list of additional members to be added on perimeter access. Prefix of group: user: or serviceAccount: is required."
  type        = list(string)
  default     = []
}

variable "restricted_services" {
  description = "The list of services to be restricted by VPC Service Controls."
  type        = list(string)
}

variable "access_context_manager_policy_id" {
  description = "The id of the default Access Context Manager policy (see https://cloud.google.com/access-context-manager/docs/overview). Can be obtained by running `gcloud access-context-manager policies list --organization YOUR-ORGANIZATION_ID --format=\"value(name)\"`."
  type        = number
}

variable "access_level_ip_subnetworks" {
  description = "Condition - A list of CIDR block IP subnetwork specification. May be IPv4 or IPv6. Note that for a CIDR IP address block, the specified IP address portion must be properly truncated (that is, all the host bits must be zero) or the input is considered malformed. For example, \"192.0.2.0/24\" is accepted but \"192.0.2.1/24\" is not. Similarly, for IPv6, \"2001:db8::/32\" is accepted whereas \"2001:db8::1/32\" is not. The originating IP of a request must be in one of the listed subnets in order for this Condition to be true. If empty, all IP addresses are allowed."
  type        = list(string)
  default     = []
}

variable "access_level_regions" {
  description = "Condition - The request must originate from one of the provided countries or regions. Format: A valid ISO 3166-1 alpha-2 code."
  type        = list(string)
  default     = []
}

variable "access_level_require_screen_lock" {
  description = "Condition - Whether or not screenlock is required for the DevicePolicy to be true."
  type        = bool
  default     = true
}

variable "access_level_require_corp_owned" {
  description = "Condition - Whether the device needs to be company owned."
  type        = bool
  default     = true
}

variable "access_level_allowed_encryption_statuses" {
  description = "Condition - A list of allowed encryption statuses. An empty list allows all statuses. For more information, see https://cloud.google.com/access-context-manager/docs/reference/rest/Shared.Types/DeviceEncryptionStatus."
  type        = list(string)
  default     = ["ENCRYPTED"]
}

variable "organization_has_mdm_license" {
  description = "Whether the organization has an MDM license (see https://cloud.google.com/access-context-manager/docs/use-mobile-devices). Will allow require_screen_lock, require_corp_owned and allowed_encryption_statuses to be used on policy access level."
  type        = bool
  default     = false
}
