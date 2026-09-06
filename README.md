Navicat Premium Trial Reset
https://img.shields.io/badge/License-GPLv3-blue.svg

A reliable shell script to reset the trial period of Navicat Premium on macOS.
Tested and working with Navicat Premium 17.3.12 (and most 16.x/17.x versions).

Warning: This script is intended for evaluation purposes only. Please purchase a legitimate license if you continue to use the product.

Features
✅ Resets the 14‑day trial period (no more “Trial Expired”)

✅ Works with Navicat Premium 17, 16, and 15

✅ Removes all hidden trial hashes and keys from preference files

✅ Deletes registration files and caches

✅ Clears Keychain entries associated with Navicat

✅ Preserves your saved connections (Profiles folder is backed up and restored automatically)

✅ Simple, fast, and safe (prompts for confirmation before full reset)

Requirements
macOS 10.15 (Catalina) or later

Navicat Premium installed in /Applications/Navicat Premium.app

Bash shell (default on macOS)

security command (built‑in) for Keychain cleanup

Installation
Clone this repository or download the script directly:

bash
git clone https://github.com/yourusername/navicat-premium-reset-trial.git
cd navicat-premium-reset-trial
chmod +x reset-trial.sh
Usage
Simply run the script from the terminal:

bash
./reset-trial.sh
The script will:

Detect your Navicat version.

Ask for confirmation before performing a full reset.

Backup your saved connections (Profiles) to the Desktop.

Remove all trial‑related files, preferences, and caches.

Restore your connections automatically.

After completion, restart Navicat Premium – the trial should be reset.

Quick mode (no confirmation)
If you prefer to run without interactive prompts, use the --force flag (or modify the script to skip the read step).

How It Works
The script performs a thorough cleanup by removing:

Location	What is removed
~/Library/Preferences/com.navicat.NavicatPremium.plist	All trial hash keys (e.g., 32‑char hex keys)
~/Library/Application Support/PremiumSoft CyberTech/	Hidden registration files (e.g., .3EC0E8A...)
~/Library/Caches/com.navicat.NavicatPremium	Cached trial metadata
Keychain	Generic password entry com.navicat.NavicatPremium
~/Library/Containers/ and ~/Library/Group Containers/	Any leftover Navicat container data
Note: Your connections (saved in Profiles) are never deleted – they are backed up and restored automatically.

Troubleshooting
Still shows “Trial Expired” after running?
Make sure Navicat is completely closed before running the script. You can also try restarting your Mac to clear any in‑memory state.

Script says “command not found”
Ensure you have set the execute permission: chmod +x reset-trial.sh

Version not detected correctly
If you have Navicat installed in a non‑standard location, edit the version_full line in the script to point to the correct app path.

Contributing
Pull requests are welcome! If you find a new version of Navicat that breaks the reset, please open an issue or submit a PR with an updated detection pattern.

Disclaimer
This script is provided as‑is for educational and evaluation purposes. The authors are not responsible for any misuse or violation of licensing terms. Always respect software licenses and support the developers if you use their product beyond the trial period.

License
This project is licensed under the GNU General Public License v3.0 – see the LICENSE file for details.

Credits
Based on the original work by tuxity

Enhanced to support Navicat 17.3.12 with complete cleanup of nested hash keys and hidden files.

