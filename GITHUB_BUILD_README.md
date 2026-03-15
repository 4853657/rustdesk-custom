# RustDesk 自定义构建说明

## 服务器配置

已内置到源码中的服务器配置：

- **ID Server**: `rustdesk.hbspider.cn:21116`
- **Relay Server**: `rustdesk.hbspider.cn:21117`
- **Key**: `C3SQejCZTUvfDzLvvYPBR+k1TwCABFQ1AqFywSG1TN0=`

## 使用方法

### 1. 创建 GitHub 仓库

1. 在 GitHub 上创建一个新的仓库（例如 `rustdesk-custom`）
2. 将本地代码推送到仓库：

```bash
cd /root/rustdesk-source
git init
git add .
git commit -m "Initial commit with custom server config"
git remote add origin https://github.com/YOUR_USERNAME/rustdesk-custom.git
git push -u origin main
```

### 2. 触发编译

#### 方法 A：自动触发（推荐）
1. 打标签并推送：
```bash
git tag v1.4.6-custom
git push origin v1.4.6-custom
```

2. GitHub Actions 会自动开始编译
3. 编译完成后，在 Release 页面下载

#### 方法 B：手动触发
1. 进入 GitHub 仓库页面
2. 点击 Actions 标签
3. 选择 "Build Custom RustDesk with Pre-configured Server"
4. 点击 "Run workflow"

### 3. 下载编译好的版本

1. 进入仓库的 Releases 页面
2. 下载对应的版本：
   - `rustdesk-windows-x64.zip` - Windows 64位版
   - `rustdesk-macos-x86_64.zip` - macOS Intel版
   - `rustdesk-macos-arm64.zip` - macOS Apple Silicon版

### 4. 分发使用

解压后即可使用，无需任何配置：
- ✅ 免安装
- ✅ 免配置
- ✅ 免登录
- ✅ 开箱即用

## 文件位置

修改的配置文件位置：

1. **默认服务器** - `libs/hbb_common/src/config.rs`:
   - 修改了 `RENDEZVOUS_SERVERS` 为你的服务器
   - 修改了 `RS_PUB_KEY` 为你的公钥

2. **默认中继服务器** - `libs/hbb_common/src/config.rs`:
   - 在 `default_options()` 中设置了 `relay-server` 和 `key`

## 注意事项

1. **首次编译可能需要 30-60 分钟**，请耐心等待
2. **macOS 版本需要签名** 才能在普通用户电脑上运行
3. **Windows 版本可能需要关闭 Defender** 或添加信任

## 自定义修改

如需修改服务器配置，编辑以下文件后重新推送：

```
libs/hbb_common/src/config.rs
```

修改以下内容：
```rust
// 第109-110行
pub const RENDEZVOUS_SERVERS: &[&str] = &["your-server.com"];
pub const RS_PUB_KEY: &str = "your-public-key";

// 第1700-1713行
fn default_options() -> HashMap<String, String> {
    let mut mp: HashMap<String, String> = Default::default();
    mp.insert(keys::OPTION_RELAY_SERVER.to_owned(), "your-server.com:21117".to_owned());
    mp.insert(keys::OPTION_KEY.to_owned(), "your-public-key".to_owned());
    // ...
}
```
