# Linux Privilege Escalation Tool

**Disclaimer: This tool is intended for educational and ethical purposes only. Misuse of this tool on systems without proper authorization is illegal. Use it responsibly, and only on systems you have explicit permission to test or investigate. The author and contributors are not responsible for any misuse or damage caused by this tool.**

## Overview

This is a Linux Privilege Escalation Shell Script designed to assist security professionals and system administrators in identifying potential privilege escalation opportunities on Linux systems. It automates the process of searching for suid (suid) and sgid (sgid) binaries and provides information on how to exploit them using commonly known techniques from [GTFOBins](https://gtfobins.github.io/).

## Features

- Automatically searches for suid and sgid files on the target system.
- Provides information on potential privilege escalation opportunities.
- Offers GTFOBins references for each identified binary.

## Usage

1. **Obtain Permission**: Ensure you have explicit authorization to run this script on the target system. Unauthorized use is illegal and unethical.

2. **Upload Script**: Upload this script to the target system.

3. **Execute Script**: Run the script with the necessary privileges. For example:
   ```bash
   ./linux_privilege_escalation.sh

4. **Review Results:** Carefully review the results provided by the script, including potential privilege escalation opportunities and GTFOBins references.

5. **Use Responsibly:** If any potential vulnerabilities are identified, report them to the system owner or administrator responsibly.

##Contributing

Contributions to this tool, including bug fixes and feature enhancements, are welcome. However, keep in mind the ethical considerations mentioned above.

##License

This tool is provided under the GPL3 License. By using this tool, you agree to adhere to the terms and conditions of this license.
