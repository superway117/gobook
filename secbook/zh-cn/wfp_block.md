## WFP 介绍

Windows 筛选平台 (WFP) 是一组 API 和系统服务，提供用于创建网络筛选应用程序的平台。 WFP API 允许开发人员编写与在操作系统网络堆栈中的多个层发生的数据包处理进行交互的代码。 可以在网络数据到达目标之前对其进行筛选和修改。

通过提供更简单的开发平台，WFP 旨在取代以前的数据包筛选技术，例如传输驱动程序接口 (TDI) 筛选器、网络驱动程序接口规范 (NDIS) 筛选器，以及 Winsock 分层服务提供商 (LSP) 。 从 Windows Server 2008 和 Windows Vista 开始，防火墙挂钩和筛选器挂钩驱动程序不可用;使用这些驱动程序的应用程序应改用 WFP。

借助 WFP API，开发人员可以实现防火墙、入侵检测系统、防病毒程序、网络监视工具和家长控制。 WFP 与 集成，并提供对防火墙功能的支持，例如，基于应用程序的套接字 API (基于应用程序的策略) 的经过身份验证的通信和动态防火墙配置。 WFP 还提供用于 IPsec 策略管理、更改通知、网络诊断和有状态筛选的基础结构。

Windows 筛选平台是一个开发平台，而不是防火墙本身。 内置于 Windows Vista、Windows Server 2008 及更高版本的操作系统 Windows 防火墙的防火墙应用程序具有高级安全 (WFAS) 是使用 WFP 实现的。 因此，使用 WFP API 或 WFAS API 开发的应用程序使用 WFP 中内置的通用筛选仲裁逻辑。

WFP API 由用户模式 API 和内核模式 API 组成。 本部分概述了整个 WFP，并仅详细描述了 WFP API 的用户模式部分。 有关内核模式 WFP API 的详细说明，请参阅 Windows 驱动程序工具包 联机帮助


## References

- [EDR监测遭遇滑铁卢？无驱动技术让你轻松突破EDR！](https://xz.aliyun.com/t/15304?time__1311=GqjxnD2CitK05DK54CqiK0QLP9iKY7DcQoD)
- [Windows 筛选平台](https://learn.microsoft.com/zh-cn/windows/win32/fwp/windows-filtering-platform-start-page)
- [EDRSilencer](https://github.com/netero1010/EDRSilencer)