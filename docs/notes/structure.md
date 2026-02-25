___
<a id="top"></a>
<!-- markdown lint-disable-line MD041 -->
**[🏠 Home](../../README.md#-table-of-contents-toc)**  ‎‎ | ‎‎ **[⬇️ ‎‎ Bottom](#end) ‎‎‎**
___

### 📂 Project Directory Structure

The repository is structured for **modularity and maintainability**:

```tree
📂 root
├── README.md                  # Project documentation, setup guide, and usage instructions  
├── docs/                      # Documentation suite, diagrams, and supporting assets                        
│
└── 📂 terraform
    ├── 📂 envs                # Terraform environments
    │   │        
    │   ├── 📂 dev            # environment :  development
    │   │   │     
    │   │   ├── ec2.tf              # EC2 instance resources for dev environment
    │   │   ├── infra.tf            # Core infrastructure (VPC, subnets, IGW) specific to dev
    │   │   ├── main.tf             # Root module: calls network/compute modules + providers
    │   │   ├── outputs.tf          # Environment-specific outputs (IPs, ARNs, etc.)
    │   │   ├── sg.tf               # Security groups tailored for dev workloads
    │   │   ├── terraform.tfvars    # Dev-specific variable values (CIDRs, instance counts)
    │   │   └── variables.tf        # Dev environment variables (vpc_cidr, azs, etc.)
    │   │
    │   └── 📂 prod     # environment :  production
    │       │     
    │       ├── compute.tf          # Prod compute resources (EC2, ASG via modules)
    │       ├── infrastructure.tf   # Prod networking (VPC, NAT, routing tables)
    │       ├── main.tf             # Prod root module orchestrating all modules
    │       ├── terraform.tfvars    # Production variable overrides (larger CIDRs, sizes)
    │       └── variables.tf        # Prod-specific variable definitions
    │           
    └── 📂 modules              # Terraform modules
        │        
        ├── 📂 compute
        │   ├── outputs.tf           # Exported values: instance IDs, private IPs
        │   ├── private_ec2.tf       # Private subnet EC2 instances + launch templates
        │   ├── public_ec2.tf        # Public-facing EC2 (ALB targets)
        │   └── variables.tf         # Module inputs: ami_id, instance_type, key_name
        │        
        ├── 📂 elb
        │   ├── elb.tf               # Application/Network Load Balancer creation
        │   ├── listener.tf          # ALB/NLB listeners, rules, SSL certs
        │   ├── outputs.tf           # LB DNS names, zone IDs, ARNs
        │   └── variables.tf         # subnet_ids, security_group_ids, target_groups
        │        
        ├── iam
        │   ├── instance_profile.tf  # EC2 instance profiles for S3/EC2 access
        │   ├── outputs.tf           # Role ARNs, profile names for other modules
        │   ├── role.tf              # IAM roles + policies for EC2 workloads
        │   └── variables.tf         # role_name, instanceprofilename, etc
        │        
        ├── 📂 nat
        │   ├── natgw.tf             # NAT Gateway + EIP for private subnet outbound
        │   ├── outputs.tf           # NAT public IPs, subnet associations
        │   └── variables.tf         # public_subnet_id, allocation_id
        │        
        ├── 📂 network
        │   ├── locals.tf            # Computed values: tags, common names, CIDR helpers
        │   ├── outputs.tf           # VPC ID, subnet IDs/maps, route table IDs
        │   ├── private_subnets.tf   # Private subnets across AZs w/ route tables
        │   ├── public_subnets.tf    # Public subnets w/ auto-assigned public IPs
        │   ├── routing.tf           # Route tables, IGW/NAT associations (likely routeS3.tf here)
        │   ├── variables.tf         # vpc_cidr, public/private_cidr_blocks, azs
        │   └── vpc.tf               # VPC resource + tags, DNS hostnames/support
        │        
        └── 📂 sg
            ├── outputs.tf           # Security group IDs, ARNs for compute/ELB
            ├── sg.tf                # Reusable SGs: web (80/443), ssh (22), app ports
            └── variables.tf         # sg_name, vpc_id, etc

```
___

<a id="end"></a>
**[🏠 Home](../../README.md#-table-of-contents-toc)**  ‎‎ | ‎‎ **[‎‎ Top ‎ ⬆️️](#top) ‎‎‎**
___

