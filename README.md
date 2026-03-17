# Secure Azure Genomics Data Platform Demo

A demo project that shows how to build a secure Azure landing zone and data platform foundation for clinical and genomics-style workloads using Terraform, Azure Data Lake Storage Gen2, Azure Data Factory, managed identities, private endpoints, and Git-based source control.

## Overview

This project demonstrates a practical cloud platform pattern for regulated data workloads.

It includes:

- Terraform-based Azure infrastructure deployment
- Secure networking with private endpoints and private DNS
- ADLS Gen2 data lake zones for raw, curated, audit, and reference data
- Azure Key Vault for secure secrets management
- Azure Data Factory pipelines using managed identity
- Event-driven ingestion using ADF triggers
- Basic validation logic before ingestion
- Source-controlled ADF artifacts in GitHub

## Architecture Summary

The platform is designed around a simple landing zone and data pipeline pattern:

- Azure Resource Group
- Virtual Network with subnets
- Private endpoint subnet
- Storage Account with ADLS Gen2 enabled
- Key Vault
- Log Analytics workspace
- Azure Data Factory with system-assigned managed identity
- Private endpoints for Storage and Key Vault
- RBAC assignments for Data Factory access to Storage and Key Vault

## Data Flow

### Clinical ingestion
- Source: `raw/clinical/incoming/patients.csv`
- Validation: check file exists
- Sink: `curated/clinical/patients/patients_clean.csv`

### Genomics ingestion
- Source:
  - `raw/genomics/incoming/run-metadata.json`
  - `raw/genomics/incoming/variants_SMP001.vcf`
- Sink:
  - `curated/genomics/metadata/run-metadata.json`
  - `curated/genomics/variants/variants_SMP001.vcf`

## Repository Structure

```text
secure-azure-genomics-demo/
├── adf/
│   ├── dataset/
│   ├── linkedService/
│   ├── pipeline/
│   └── trigger/
├── data/
├── docs/
├── environments/
│   └── dev/
├── modules/
└── README.md

## Terraform Scope

Terraform provisions the core Azure infrastructure, including:

-- Resource group

-- Networking

-- Storage account

-- Key Vault

-- Log Analytics

-- Private endpoints

-- Diagnostics

-- Azure Data Factory

-- RBAC role assignments

## ADF Scope

ADF artifacts are source-controlled in GitHub and include:

-- Linked services

-- Datasets

-- Pipelines

-- Triggers

## Security Design

This demo uses several security best practices:

-- Managed identity instead of embedded credentials

-- Azure RBAC for service access

-- Private endpoints for core services

-- Diagnostic logging to Log Analytics

-- Key Vault for secure secret handling

## Why this project matters

This project is designed to demonstrate skills relevant to cloud platform, data engineering, and Azure consulting roles, especially in regulated domains such as healthcare, life sciences, and genomics.

It shows:

-- infrastructure as code

-- secure Azure architecture

-- event-driven data ingestion

-- source control for data platform artifacts

-- basic pipeline validation and operational thinking

## Next Improvements

Possible future enhancements:

-- CI/CD pipeline for Terraform and ADF deployment

-- Managed private endpoints for ADF

-- Data quality checks and schema validation

-- Monitoring dashboards and alerts

-- Multi-environment promotion (dev/test/prod)

-- Architecture diagram and deployment guide

## Author

Built as a hands-on Azure portfolio project.

