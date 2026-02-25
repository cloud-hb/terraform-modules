___
<a id="top"></a>
<!-- markdown lint-disable-line MD041 -->
**[🏠 Home](../../README.md#-table-of-contents-toc)**  ‎‎ | ‎‎ **[⬇️ ‎‎ Bottom](#end) ‎‎‎**
___

## # 🚨 AWS Terraform STS 403 Troubleshooting - [⬆️ Top️](#top)

## 📋 Error Overview
```
Error: validating provider credentials: retrieving caller identity from STS: 
operation error STS: GetCallerIdentity, https response error StatusCode: 403, 
RequestID: ..., api error InvalidClientTokenId: The security token included in the request is invalid.
```
**Quick Summary**: Terraform fails during `init` because AWS credentials are invalid/expired. Test with `aws sts get-caller-identity` first. 🔍

## 🔍 Common Causes
- ❌ **Invalid Keys**: Wrong `AWS_ACCESS_KEY_ID` or `AWS_SECRET_ACCESS_KEY` (typos, wrong IAM user).
- ⏰ **Expired Token**: `AWS_SESSION_TOKEN` from STS AssumeRole/MFA is stale.
- 🛠 **Env/Profile Mismatch**: Conflicting `AWS_PROFILE`, env vars, or `~/.aws/credentials`.
- 🚫 **Permissions**: IAM lacks `sts:GetCallerIdentity` (rare, usually creds issue).

## 🛠️ Step-by-Step Fixes

### 1. **Test Credentials** 🧪
```bash
aws sts get-caller-identity
```
- ✅ Succeeds? Skip to Terraform retry.
- ❌ 403? Proceed below.

### 2. **Reset AWS CLI Config** 🔄
```bash
# Clear old config
rm ~/.aws/credentials ~/.aws/config

# Reconfigure
aws configure
# Enter: AccessKey, SecretKey, region (e.g., us-east-1), output=json
```

### 3. **Unset Env Vars** 🧹
```bash
unset AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN AWS_PROFILE AWS_DEFAULT_REGION
# Windows: set AWS_ACCESS_KEY_ID=
```

### 4. **Handle Temporary Creds** 🔑
If using MFA/AssumeRole:
```bash
aws sts assume-role --role-arn arn:aws:iam::ACCOUNT:role/ROLE --role-session-name test
# Copy AccessKeyId, SecretAccessKeyId, SessionToken to env vars
export AWS_ACCESS_KEY_ID=... AWS_SECRET_ACCESS_KEY=... AWS_SESSION_TOKEN=...
```

### 5. **Profile-Specific** 👤
```bash
export AWS_PROFILE=myprofile
aws sts get-caller-identity --profile myprofile
terraform init -reconfigure -upgrade
```

### 6. **Terraform Retry** ♻️
```bash
terraform init -reconfigure -upgrade
terraform plan  # Verify
```

## ⚠️ Advanced Checks
| Issue | Command | Fix |
|-------|---------|-----|
| **CI/CD Pipeline** 🤖 | Check IAM role trust policy | Add `sts:GetCallerIdentity` |
| **Multiple Profiles** 🔄 | `aws configure list-profiles` | Use `--profile` explicitly |
| **Corporate Proxy/VPN** 🌐 | `export HTTP_PROXY=...` | Configure AWS CLI proxy |
| **Region Mismatch** 🗺️ | `aws configure set region us-east-1` | Match your resources |

## ✅ Success Indicators
- `aws sts get-caller-identity` returns Account/User/Arn.
- `terraform init` completes: "Terraform has been successfully initialized!"
- `terraform plan` shows no auth errors.

## 🚫 Prevention Tips
- 📝 Use IAM roles over long-lived keys.
- 🔄 Automate MFA refresh in scripts.
- 🗑️ Never commit `~/.aws/` or env vars to Git.
- 🛡️ Audit IAM policies quarterly.

**Still Stuck?** Share `aws sts get-caller-identity --debug` output (redact sensitive info). 😊

___
<a id="end"></a>
**[🏠 Home](../../README.md#-table-of-contents-toc)**  ‎‎ | ‎‎ **[‎‎ Top ‎ ⬆️️](#top) ‎‎‎**
___
