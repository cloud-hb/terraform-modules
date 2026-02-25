___
<a id="top"></a>
<!-- markdown lint-disable-line MD041 -->
**[🏠 Home](../../README.md#-table-of-contents-toc)**  ‎‎ | ‎‎ **[⬇️ ‎‎ Bottom](#end) ‎‎‎**
___

## 🔧 **Tech Stack** - [⬆️ Top️](#top)

| **Category**          | **Technology**       |**Development**  |  **Production**           |
| ----------------- | --------------- | ------------------------ | -------------------------- |
| ☁️ Cloud          | AWS             | us-east-1                | us-east-1                  |
| 🌐 Networking     | VPC             | dev_vpc_1 (10.90.0.0/16) | prod_vpc_1 (172.22.0.0/16) |
| 📍 Availability   | AZs             | us-east-1a,b,c (3-AZ)    | us-east-1a,b,c (3-AZ)      |
| ⚖️ Load Balancing | NLB             | Via ELB module           | Via ELB module             |
| 💻 Compute        | EC2             | Via Compute module       | Via Compute module         |
| 🔐 Identity       | IAM             | Via IAM module           | Via IAM module             |
| 🛡️ Security       | Security Groups | dev_sg_1 ✅              | prod_sg_1 ✅                |
| 🌉 Connectivity   | NAT Gateway     | dev_natgw_1 ✅           | prod_natgw_1 ✅            |
| 📦 IaC            | Terraform       | Modular (tfvars)         | Modular (tfvars)           |

___
<a id="end"></a>
**[🏠 Home](../../README.md#-table-of-contents-toc)**  ‎‎ | ‎‎ **[‎‎ Top ‎ ⬆️️](#top) ‎‎‎**
___
