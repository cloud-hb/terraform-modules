___
<a id="top"></a>
<!-- markdown lint-disable-line MD041 -->
**[🏠 Home](../../README.md#-table-of-contents-toc)**  ‎‎ | ‎‎ **[⬇️ ‎‎ Bottom](#end) ‎‎‎**
___

## ✨**Features** - [⬆️ Top️](#top)

| **Category**      | **Feature**            |  **Development**  |  **Production**      |
| ----------------- | ---------------------- | ------------------ | ------------------- |
| **🔄 envs** | **Development/Production**         |                    |
| **🏗️ Architecture**  | 3-AZ High Availability | ✅ us-east-1a,b,c   | ✅ us-east-1a,b,c    |
| **📏 Network**        | VPC CIDR               | 10.90.0.0/16       | 172.22.0.0/16       |
| **🌐 Subnets**        | Public Subnets         | 10.90.1-3.0/24     | 172.22.1-3.0/24     |
| **🔒 Subnets**        | Private Subnets        | 10.90.10-30.0/24   | 172.22.10-30.0/24   |
| **🛣️ Routing**       | Advanced Routes        | IGW+NAT+S3         | IGW+NAT+S3          |
| **⚖️ Load Balancing** | Network Load Balancer + Target Group | ✅ NLB + TGs        | ✅ NLB + TGs         |
| **💻 Compute**        | Dual-Tier EC2          |  Apps    |  Apps     |
| **🔐 Identity**       | IAM Roles/Profiles     | ✅ S3/EC2 access    | ✅ S3/EC2 access     |
| **🛡️ Security**      | Security Groups        | dev_sg_1 (6 ports) | prod_sg_1 (8 ports) |
| **🌉 Connectivity**   | NAT ( Network Address Translation ) Gateway           | dev_natgw_1        | prod_natgw_1        |
| **📦 IaC**            | Modular Terraform      | 6 modules          | 6 modules           |
| **🔄 Config**         | Environment Management | terraform.tfvars + Direct params      | terraform.tfvars    |
| **📤 Outputs**        | Resource Exports       | VPC/Subnets/SGs    | VPC/Subnets/SGs     |
| **🏷️ Naming**        | Resource Tagging       | dev_vpc_1          | prod_vpc_1          |

___

> [!DETAILS]
<details>
<summary>🛡️ Ports  & 🌐 Subnets : (<kbd>▶️ Expand | 🔼 Collapse) </kbd></summary>

## 🛡️ **Service Ports**

| **Port** | **Service** | **Protocol** | **Development** | **Production** |
|----------|-------------|--------------|-----------------|----------------|
| 🌐 **80** | Web Traffic | HTTP | ✅ | ✅ |
| 🔒 **443** | Secure Web | HTTPS | ✅ | ✅ |
| 📁 **445** | File Sharing | SMB | ✅ | ✅ |
| ⚙️ **8080** | App Server | HTTP Alt | ✅ | ✅ |
| 🔑 **22** | Secure Shell | SSH | ✅ | ✅ |
| 🖥️ **3389** | Remote Desktop | RDP | ✅ | ✅ |
| 🗄️ **1433** | SQL Server | MSSQL | ❌ | ✅ |
| 🗄️ **3306** | MySQL Database | MySQL | ❌ | ✅ |

___

## 🌐 **3-AZ Subnets**

| Type | AZ | Development CIDR| Production CIDR| Purpose |
|------|----|-----|------|---------|
| **Public** | us-east-1a | `10.90.1.0/24` | `172.22.1.0/24` | **NLB+NAT** |
| **Public** | us-east-1b | `10.90.2.0/24` | `172.22.2.0/24` | **NLB+NAT** |
| **Public** | us-east-1c | `10.90.3.0/24` | `172.22.3.0/24` | **NLB+NAT** |
| **Private** | us-east-1a | `10.90.10.0/24` | `172.22.10.0/24` | **EC2 App Servers** |
| **Private** | us-east-1b | `10.90.20.0/24` | `172.22.20.0/24` | **EC2 App Servers** |
| **Private** | us-east-1c | `10.90.30.0/24` | `172.22.30.0/24` | **EC2 App Servers** |

<div style="font-size:0.85em;color:#666;margin:1em 0 0 0">
*💡 <kbd>Enter</kbd> toggle | <kbd>Esc</kbd> close*
</div>

</details>

___
<a id="end"></a>
**[🏠 Home](../../README.md#-table-of-contents-toc)**  ‎‎ | ‎‎ **[‎‎ Top ‎ ⬆️️](#top) ‎‎‎**
___
