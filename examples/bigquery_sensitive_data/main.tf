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

module "bigquery_sensitive_data" {
  source              = "../..//modules/data_warehouse_taxonomy"
  taxonomy_project_id = var.taxonomy_project_id
  bigquery_project_id = var.bigquery_project_id
  taxonomy_name       = "secured_taxonomy"
  table_id            = "sample_data"
  dataset_id          = "secured_dataset"
  location            = "us-east1"
}
