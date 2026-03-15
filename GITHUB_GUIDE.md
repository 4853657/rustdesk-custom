# RustDesk 自定义构建 - 完全去官方化版本

## 🎯 修改内容总结

### 1. 服务器配置 (全部指向你的服务器)

✅ **ID/Rendezvous 服务器**: `rustdesk.hbspider.cn:21116`
✅ **中继服务器**: `rustdesk.hbspider.cn:21117`  
✅ **API 服务器**: `https://rustdesk.hbspider.cn:4433` (HTTPS 端口 4433)
✅ **公钥**: `C3SQejCZTUvfDzLvvYPBR+k1TwCABFQ1AqFywSG1TN0=`

### 2. 移除的官方连接

✅ **版本检查**: 禁用 `https://api.rustdesk.com/version/latest`
✅ **管理后台**: 改为 `https://rustdesk.hbspider.cn:4433`
✅ **公共服务器判断**: 改为检查是否包含 `hbspider.cn`
✅ **文档链接**: 全部改为 `#` (禁用)
✅ **作者信息**: 改为 `Custom Build<admin@hbspider.cn>`

### 3. 端口修改

- HTTP: 80 → 8080 (如需要)
- HTTPS: 443 → 4433

---

## 📁 修改的文件列表

1. `libs/hbb_common/src/config.rs` - 默认服务器和密钥
2. `libs/hbb_common/src/lib.rs` - 版本检查 URL
3. `libs/hbb_common/src/websocket.rs` - API 服务器地址和测试
4. `libs/hbb_common/src/socket_client.rs` - 测试服务器地址
5. `src/common.rs` - API 服务器和公共判断
6. `src/client.rs` - 文档链接
7. `src/lang/en.rs` - 文档链接
8. `src/main.rs` - 作者信息

---

## 🚀 GitHub 操作步骤

### 第 1 步：创建 GitHub 仓库

1. 打开 https://github.com
2. 点击右上角 **+** → **New repository**
3. 填写信息：
   - Repository name: `rustdesk-custom`
   - Description: `Custom RustDesk with private server`
   - 选择 **Public** 或 **Private**
   - 勾选 **Add a README file** (可选)
4. 点击 **Create repository**

### 第 2 步：获取仓库地址

创建后，复制仓库地址：
```
https://github.com/你的用户名/rustdesk-custom.git
```

### 第 3 步：推送代码

在服务器上执行：

```bash
cd /root/rustdesk-source

# 初始化 git
git init

# 添加所有文件
git add .

# 提交
git commit -m "Custom RustDesk build

完全移除官方服务器连接，全部指向自建服务器：
- ID Server: rustdesk.hbspider.cn:21116
- Relay Server: rustdesk.hbspider.cn:21117
- API Server: https://rustdesk.hbspider.cn:4433
- Key: C3SQejCZTUvfDzLvvYPBR+k1TwCABFQ1AqFywSG1TN0=

修改内容：
1. 禁用版本检查
2. 修改所有官方链接
3. 更新默认服务器配置
4. 修改作者信息
5. 禁用文档链接"

# 添加远程仓库
git remote add origin https://github.com/你的用户名/rustdesk-custom.git

# 推送
git push -u origin main
```

### 第 4 步：创建标签触发编译

```bash
# 创建版本标签
git tag v1.4.6-custom

# 推送标签
git push origin v1.4.6-custom
```

### 第 5 步：查看编译状态

1. 打开 GitHub 仓库页面
2. 点击 **Actions** 标签
3. 等待编译完成（约 30-60 分钟）
4. 编译完成后，点击 **Releases** 查看下载链接

---

## 📦 下载编译好的版本

编译完成后，在 Releases 页面下载：

- `rustdesk-windows-x64.zip` - Windows 64位版
- `rustdesk-macos-x86_64.zip` - macOS Intel 版
- `rustdesk-macos-arm64.zip` - macOS Apple Silicon 版

---

## ⚠️ 重要提醒

1. **首次编译需要 30-60 分钟**，请耐心等待
2. **macOS 版本需要签名** 才能在普通用户电脑上运行
3. **Windows 版本可能需要关闭 Defender** 或添加信任
4. **所有连接都指向你的服务器**，不会再连接官方

---

## 🔧 服务器端口配置

你的服务器需要开放以下端口：

| 端口 | 协议 | 用途 |
|------|------|------|
| 21115 | TCP | NAT 测试 |
| 21116 | TCP/UDP | ID/注册服务 |
| 21117 | TCP | 中继服务 |
| 21118 | TCP | WebSocket ID |
| 21119 | TCP | WebSocket 中继 |
| 4433 | TCP | API/HTTPS (自定义) |

---

## 📝 验证修改

推送前可以验证修改是否正确：

```bash
# 检查服务器配置
grep "rustdesk.hbspider.cn" libs/hbb_common/src/config.rs

# 检查禁用版本检查
grep "api.rustdesk.com" libs/hbb_common/src/lib.rs

# 检查作者信息
grep "admin@hbspider.cn" src/main.rs
```

---

## ❓ 常见问题

### Q: 编译失败怎么办？
A: 检查 GitHub Actions 日志，可能需要：
- 更新 Rust 版本
- 更新 Flutter 版本
- 检查依赖项

### Q: macOS 版本无法运行？
A: macOS 需要代码签名，可以尝试：
- 右键点击 → 打开
- 系统偏好设置 → 安全性与隐私 → 仍要打开
- 或使用自签名证书

### Q: 如何更新服务器地址？
A: 修改以下文件后重新推送：
- `libs/hbb_common/src/config.rs` (第109行和第1703行)
- `src/common.rs` (第1084行)
- `libs/hbb_common/src/websocket.rs` (第419行)

---

## 📧 联系方式

Custom Build <admin@hbspider.cn>
