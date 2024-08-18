## trufflesecurity/trufflehog
 

[TruffleHog](https://github.com/trufflesecurity/trufflehog)是一款开源的命令行工具，用于查找和恢复泄露在公共代码存储库中的敏感信息，例如 API 密钥、凭据和个人信息。

 
TruffleHog 是一款由 Truffle Security 开发的多平台命令行工具。它旨在帮助开发人员和安全研究人员查找和恢复存在于公共代码存储库中的敏感信息。

TruffleHog 扫描代码存储库以查找与各种敏感信息模式匹配的字符串。这些模式包括：
- API 密钥
- 访问令牌
- 密码哈希
- SSH 密钥
- 电子邮件地址
- 电话号码

一旦发现敏感信息，TruffleHog 就会将其打印到控制台。用户可以将输出重定向到文件以进行进一步分析或存档。

TruffleHog 提供了各种命令行选项，允许用户指定要扫描的代码存储库、忽略的模式和输出格式。它还支持自定义模式，使用户可以查找特定的敏感信息类型。

TruffleHog 旨在成为一个易于使用且高效的工具，帮助组织保护其敏感数据免受泄露。它已成功用于查找和恢复大量泄露的敏感信息。

## References
- [github trufflehog](https://github.com/trufflesecurity/trufflehog)