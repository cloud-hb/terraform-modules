___

<a id="top"></a>
<!-- markdown lint-disable-line MD041 -->
**[🏠 Home](../../README.md#-table-of-contents-toc)**  ‎‎ | ‎‎ **[⬇️ ‎‎ Bottom](#end) ‎‎‎**
___


## 🛠️ Prerequisites

> [!IMPORTANT]
> **Before you begin, ensure the following prerequisites are met:**
>
>- **AWS CLI**: Installed and configured with your AWS credentials. Instructions can be found [here](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html).
> - 🏗️ **Terraform (>=1.0)**  
> - 📝 **Visual Studio Code** (recommended) or any code editor of your choice.
> - 💻 **Git** installed


## 🏃‍♂️ Setup

### Step 1: Clone the Repository

```bash
git clone https://github.com/cloud-hb/<repo>.git
cd <repo>
```

### Step 2: Terraform
#### Prerequisites

-  Format recursively all Terraform files
```bash
terraform -chdir=terraform/fmt -recursive
```

- Syntax :
```bash
terraform -chdir=terraform/envs/<ENVIRONMENT_NAME> <SUBCOMMAND>
```

#### Dev
```bash
terraform -chdir=terraform/envs/dev/ init
terraform -chdir=terraform/envs/dev/ fmt -check
terraform -chdir=terraform/envs/dev/ validate
terraform -chdir=terraform/envs/dev/ plan
terraform -chdir=terraform/envs/dev/ apply --auto-approve
```

#### Prod
```bash
terraform -chdir=terraform/envs/prod/ init
terraform -chdir=terraform/envs/prod/ fmt -check
terraform -chdir=terraform/envs/prod/ validate
terraform -chdir=terraform/envs/prod/ plan
terraform -chdir=terraform/envs/prod/ apply --auto-approve

```

___
<a id="end"></a>
**[🏠 Home](../../README.md#-table-of-contents-toc)**  ‎‎ | ‎‎ **[‎‎ Top ‎ ⬆️️](#top) ‎‎‎**
___
