<a id="top"></a>
**[🏠 Home](../../README.md#-table-of-contents-toc)**  |  **[⬇️ Bottom](#end)**  
___

# 📚 **Glossary**

## 📌 **Table of Contents (TOC)**

| **Terraform Core** | **AWS Networking** | **Modules & Configuration** |
|---|---|---|
| **[🔑 Key Terms](#-key-terms---️-top)**<br><small>IaC tool & concepts</small> | **[🌐 VPC](#-vpc---️-top)**<br><small>Virtual Private Cloud</small> | **[📂 Modules](#-modules---️-top)**<br><small>6 reusable components</small> |
| **[📦 Terraform](#-terraform---️-top)**<br><small>IaC tool & concepts</small>| **[🔒 Subnets](#-subnets---️-top)**<br><small>Public/private isolation</small> | **[📤 Outputs](#-outputs---️-top)**<br><small>Resource exports</small> |
|**[🔧 Variables](#-variables---️-top)**<br><small>tfvars & validation</small>  | **[🛣️ Routing](#️-routing---️-top)**<br><small>IGW/NAT/S3 paths</small> | **[🛡️ Security Groups](#️-security-groups---️-top)**<br><small>EC2/ELB firewalls</small> |

___

## 🔑 **Key Terms** - [⬆️ Top](#top)

| Term           | Meaning                        | Your Project Context                               |
| -------------- | ------------------------------ | -------------------------------------------------- |
| **VPC**            | Virtual Private Cloud          | Isolated AWS network (dev_vpc_1, prod_vpc_1)       |
| **Subnet**         | Sub-network within VPC         | /24 blocks in each AZ (public/private)             |
| **AZ**             | Availability Zone              | us-east-1a,b,c - physically separate data centers  |
| **CIDR**           | Classless Inter-Domain Routing | IP range notation (10.90.0.0/16, 172.22.1.0/24)    |
| **IGW**            | Internet Gateway               | Public internet access for public subnets          |
| **NAT Gateway**    | Network Address Translation    | Private subnets access internet (outbound only)    |
| **NLB**            | Network Load Balancer          | Distributes traffic to private EC2 servers         |
| **EC2**            | Elastic Compute Cloud          | Virtual machines (your app servers)                |
| **Security Group** | Stateful Firewall              | Controls inbound/outbound traffic by port/protocol |
| **IAM**            | Identity Access Management     | Roles/profiles granting AWS service permissions    |
| **Route Table**    | Network routing rules          | Directs traffic (IGW/NAT/S3 endpoint)              |
| **Target Group**   | NLB destination pool           | Group of EC2 instances receiving traffic           |
| **tfvars**         | Terraform variables file       | Environment-specific values (prod.tfvars)          |
| **Module**         | Reusable Terraform code        | network, compute, elb, etc.                        |

## 📦 **Terraform** - [⬆️ Top](#top)

| **Term** | **Meaning** | **Your Project Context** |
|----------|-------------|-------------------------|
| **Terraform** | Infrastructure as Code tool | Manages `envs/` & `modules/` |
| **Module** | Reusable Terraform code | `network`, `compute`, `elb`, `iam`, `nat`, `sg` |
| **Resource** | AWS infrastructure object | `aws_vpc`, `aws_instance`, `aws_lb` in `.tf` files |
| **State** | Tracks deployed resources | Separate state for `development/` & `production/` |
| **Plan** | Preview of changes | `terraform plan` before `apply` |
| **tfvars** | Environment variables file | `terraform.tfvars` with CIDRs, names |

## 🌐 **VPC** - [⬆️ Top](#top)

| **Term** | **Meaning** | **Your Project Context** |
|----------|-------------|-------------------------|
| **VPC** | Virtual Private Cloud (Isolated virtual network) | `dev_vpc_1` (10.90.0.0/16), `prod_vpc_1` (172.22.0.0/16) |
| **CIDR Block** | Classless Inter-Domain Routing - IP address range | `/16` → 65k IPs, split into 6x `/24` subnets |
| **AZ** | Availability Zone | `us-east-1a,b,c` - physically separate DCs |

## 🔒 **Subnets** - [⬆️ Top](#top)

| **Term** | **Meaning** | **Your Project Context** |
|----------|-------------|-------------------------|
| **Subnet** | Sub-network within VPC | |
| **Public Subnet** | Internet-routable subnet | NLB + NAT Gateway (`10.90.1-3.0/24`) |
| **Private Subnet** | No direct internet access | EC2 app servers (`10.90.10-30.0/24`) |
| **IGW** | Internet Gateway | Public subnet → Internet (`0.0.0.0/0`) |

## 🛣️ **Routing** - [⬆️ Top](#top)

| **Term** | **Meaning** | **Your Project Context** |
|----------|-------------|-------------------------|
| **Route Table** | Traffic direction rules | `network/routing.tf` - IGW/NAT/S3 |
| **NAT Gateway** | 	Network Address Translation - Private → Internet (outbound) | `modules/nat/natgw.tf` in public subnet #1 |
| **S3 Endpoint** | Private S3 access | VPC Gateway Endpoint (prefix list) |

## 🛡️ **Security Groups** - [⬆️ Top](#top)

| **Term** | **Meaning** | **Your Project Context** |
|----------|-------------|-------------------------|
| **Security Group** | Stateful firewall | `modules/sg/sg.tf` - EC2/NLB rules |
| **Ingress** | Incoming traffic rules | Ports: 80/443/22/3389 (Dev), +SQL (Prod) |
| **Egress** | Outgoing traffic rules | Internet + S3 access for updates |

## 📂 **Modules** - [⬆️ Top](#top)

| **Module** | **Files** | **Purpose** |
|------------|-----------|-------------|
| **network** | `vpc.tf`, `subnets.tf`, `routing.tf` | VPC + 6 subnets + route tables |
| **compute** | `public_ec2.tf`, `private_ec2.tf` | EC2 app servers |
| **elb** | `elb.tf`, `listener.tf` | Network Load Balancer + TGs |
| **iam** | `role.tf`, `instance_profile.tf` | EC2 IAM credentials |
| **nat** | `natgw.tf` | Private subnet internet access |
| **sg** | `sg.tf` | Firewall rules (8 ports Prod) |

## 🔧 **Variables** - [⬆️ Top](#top)

| **Term** | **Meaning** | **Your Project Context** |
|----------|-------------|-------------------------|
| **Variables** | Input parameters | `variables.tf` with `description` + `validation` |
| **terraform.tfvars** | Environment values | Prod: `172.22.0.0/16`, Dev: `10.90.0.0/16` |

## 📤 **Outputs** - [⬆️ Top](#top)

| **Output** | **Source** | **Usage** |
|------------|------------|-----------|
| **vpc_id** | `network/outputs.tf` | Passed to `sg`, `elb`, `compute` modules |
| **subnet_ids** | `network/outputs.tf` | Multi-AZ NLB + EC2 placement |
| **sg_id** | `sg/outputs.tf` | EC2 `vpc_security_group_ids` |
| **etc** | `etc` |  `etc` |

___
<a id="end"></a>
**[🏠 Home](../../README.md#-table-of-contents-toc)**  |  **[Top ⬆️](#top)**  
___