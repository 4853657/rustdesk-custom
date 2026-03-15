# GitHub Desktop 操作指南

## 📦 第一步：下载源码包

源码包位置：`/root/rustdesk-custom-code.zip` (6.7MB)

### 下载方法：

**方法 A：使用 SCP（如果你使用 Mac/Linux）**
```bash
# 在你的电脑上执行
scp root@你的服务器IP:/root/rustdesk-custom-code.zip ~/Desktop/
```

**方法 B：使用 FTP/SFTP**
1. 使用 FileZilla 等工具连接服务器
2. 下载 `/root/rustdesk-custom-code.zip`

**方法 C：直接在服务器上下载**
如果你现在就在服务器上，文件已经在 `/root/rustdesk-custom-code.zip`

---

## 💻 第二步：安装 GitHub Desktop

1. 打开 https://desktop.github.com/
2. 点击 **Download for Windows** (或 Mac)
3. 安装并登录你的 GitHub 账号 (4853657)

---

## 🔄 第三步：克隆仓库

1. 打开 GitHub Desktop
2. 点击 **File** → **Clone Repository**
3. 选择 **URL** 标签
4. 输入: `https://github.com/4853657/rustdesk-custom.git`
5. 选择本地路径（例如 `C:\Users\你的用户名\Documents\GitHub\rustdesk-custom`）
6. 点击 **Clone**

---

## 📂 第四步：替换文件

1. 解压 `rustdesk-custom-code.zip`
2. 打开解压后的文件夹 `rustdesk-custom-export`
3. **复制所有内容**（按 Ctrl+A 全选，然后 Ctrl+C 复制）
4. 打开 GitHub Desktop 克隆的仓库文件夹
5. **粘贴并替换所有文件**（Ctrl+V）

---

## ✅ 第五步：提交并推送

1. 回到 GitHub Desktop
2. 你会看到左侧显示很多修改的文件
3. 在 **Summary** 框输入提交信息：
   ```
   Custom RustDesk build with private server
   
   - ID Server: rustdesk.hbspider.cn:21116
   - Relay Server: rustdesk.hbspider.cn:21117
   - API Server: https://rustdesk.hbspider.cn:4433
   - Removed all official connections
   ```
4. 点击 **Commit to main**
5. 点击 **Push origin**（右上角的按钮）

---

## 🚀 第六步：触发编译

推送完成后，编译会自动开始：

1. 打开浏览器访问 https://github.com/4853657/rustdesk-custom
2. 点击 **Actions** 标签
3. 你会看到 "Build Custom RustDesk..." 正在运行
4. 等待 30-60 分钟
5. 编译完成后，点击 **Releases** 标签下载

---

## 📋 如果 Actions 没有自动运行

如果推送后没有看到 Actions 运行，手动触发：

1. 在 GitHub 仓库页面点击 **Actions**
2. 点击 **Build Custom RustDesk with Pre-configured Server**
3. 点击右侧的 **Run workflow** 按钮
4. 再点击绿色的 **Run workflow** 按钮

---

## 🎯 第七步：下载编译好的版本

编译完成后：

1. 点击仓库页面的 **Releases** 标签
2. 找到最新版本（例如 v1.4.6-custom）
3. 下载对应版本：
   - `rustdesk-windows-x64.zip` - Windows 版
   - `rustdesk-macos-x86_64.zip` - Intel Mac
   - `rustdesk-macos-arm64.zip` - Apple Silicon Mac

---

## ❓ 常见问题

### Q: GitHub Desktop 提示需要 Token？
A: 使用你之前提供的 Token 登录

### Q: 推送失败？
A: 确保 Token 有 repo 权限，或检查网络连接

### Q: 编译失败？
A: 检查 Actions 日志，通常是依赖问题，可以尝试重新运行

### Q: macOS 版本无法运行？
A: 需要代码签名，可以在终端执行：
```bash
xattr -cr RustDesk.app
```

---

## 📞 需要帮助？

如果遇到问题：
1. 检查 GitHub Desktop 的错误提示
2. 查看 Actions 页面的日志
3. 确认所有文件已正确复制

---

**开始时间**：大约需要 10 分钟完成推送，60 分钟完成编译
**总耗时**：约 70 分钟
