# 🚀 Navicat Premium Trial Reset

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![macOS](https://img.shields.io/badge/macOS-10.15%2B-success.svg)](https://www.apple.com/macos)
[![Navicat](https://img.shields.io/badge/Navicat-17.x%2F16.x%2F15.x-orange.svg)](https://www.navicat.com)

> **A reliable shell script to reset the trial period of Navicat Premium on macOS**  
> *Tested and working with Navicat Premium 17.3.12 (and most 16.x/17.x versions)*

---

## ⚠️ Disclaimer

> **This script is intended for evaluation purposes only.**  
> Please purchase a legitimate license if you continue to use the product.  
> The authors are not responsible for any misuse or violation of licensing terms.

---

## ✨ Features

- ✅ **Resets the 14‑day trial** – no more “Trial Expired” popups
- ✅ **Works with Navicat Premium 17, 16, and 15**
- ✅ **Removes hidden trial hashes** and keys from preference files
- ✅ **Deletes registration files**, caches, and Keychain entries
- ✅ **Preserves your saved connections** – `Profiles` folder is backed up and restored automatically
- ✅ **Simple, fast, and safe** – prompts for confirmation before full reset
- ✅ **Automatic version detection**

---

## 🖥️ Requirements

- macOS **10.15 (Catalina)** or later
- Navicat Premium installed in `/Applications/Navicat Premium.app`
- Bash shell (default on macOS)
- `security` command (built‑in) – used for Keychain cleanup

---

## 📥 Installation

Clone this repository or download the script directly:

```bash
git clone https://github.com/yourusername/navicat-premium-reset-trial.git
cd navicat-premium-reset-trial
chmod +x reset-trial.sh
