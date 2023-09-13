#!/bin/bash
# By Naveen0x

echo -e "\n"
echo "Welcome to SUID SGID Tool!"
echo -e "\n"
binarylist='sg\|tshark\|elvish\|octave\|rsync\|wget\|bzip2\|red\|w3m\|systemd-resolve\|agetty\|look\|psql\|socat\|zypper\|rvim\|csplit\|more\|ascii85\|less\|wireshark\|hexdump\|gtester\|emacs\|timedatectl\|hping3\|ul\|script\|knife\|joe\|ruby\|nohup\|easy_install\|stdbuf\|pdftex\|soelim\|pry\|chroot\|choom\|snap\|dig\|bpftrace\|mount\|cpio\|rpmdb\|ksu\|latex\|msgattrib\|psftp\|luatex\|openvpn\|mosquitto\|ncftp\|strace\|ip\|nm\|pico\|install\|exiftool\|rc\|find\|apt-get\|awk\|pr\|c89\|od\|csvtool\|msgcat\|journalctl\|nroff\|dd\|curl\|dpkg\|ascii-xfr\|gimp\|capsh\|tex\|torify\|ksh\|date\|base58\|tail\|shuf\|check_ssl_cert\|gcloud\|ftp\|cpan\|dmsetup\|whiptail\|cowthink\|espeak\|update-alternatives\|cancel\|bash\|rev\|paste\|check_log\|ssh\|dvips\|uniq\|ash\|lwp-request\|aa-exec\|unsquashfs\|ht\|logsave\|dstat\|redcarpet\|debugfs\|gdb\|tmux\|dialog\|tmate\|openvt\|check_cups\|neofetch\|check_memory\|dotnet\|scrot\|highlight\|wc\|ar\|vimdiff\|unshare\|jq\|socket\|pwsh\|msguniq\|cmp\|ptx\|perlbug\|iftop\|virsh\|mail\|run-parts\|jtag\|pic\|lftp\|aws\|atobm\|mtr\|top\|pdflatex\|tcpdump\|cp\|python\|finger\|man\|jrunscript\|ispell\|cut\|apt\|chown\|pidstat\|ginsh\|sort\|tbl\|comm\|ex\|task\|rpmquery\|lwp-download\|flock\|tftp\|check_by_ssh\|kubectl\|pkg\|msfconsole\|check_raid\|gem\|rpm\|nasm\|su\|pkexec\|grc\|make\|perf\|telnet\|c99\|arp\|nc\|multitime\|latexmk\|sftp\|run-mailcap\|ssh-agent\|ss\|ld.so\|scanmem\|vi\|bundle\|mv\|hd\|torsocks\|efax\|loginctl\|tee\|fping\|7z\|tclsh\|pexec\|setfacl\|dnf\|msgconv\|ltrace\|node\|rview\|zip\|sash\|base32\|ssh-keyscan\|vigr\|gcore\|systemctl\|netcat\|diff\|setlock\|dos2unix\|rake\|facter\|pdb\|time\|gzip\|eqn\|ssh-keygen\|scp\|busybox\|split\|irb\|mawk\|ansible-test\|unexpand\|clamscan\|ed\|file\|ghci\|nice\|nft\|check_statusfile\|nawk\|valgrind\|sysctl\|vipw\|crontab\|uuencode\|ghc\|base64\|byebug\|tac\|zsh\|genie\|tar\|bconsole\|batcat\|slsh\|fold\|basenc\|whois\|tasksh\|uudecode\|tdbtool\|rlwrap\|csh\|msgfilter\|git\|watch\|aria2c\|bc\|ip$\|unzip\|pg\|perl\|ln\|view\|fish\|service\|setarch\|sshpass\|dmesg\|fmt\|openssl\|certbot\|ssh$\|jjs\|lp\|pax\|alpine\|ansible-playbook\|distcc\|gcc\|cupsfilter\|opkg\|puppet\|nl\|nmap\|taskset\|xargs\|genisoimage\|bundler\|nano\|env\|julia\|aoss\|tic\|cabal\|at\|dmidecode\|lua\|sh\|ksshell\|wish\|grep\|start-stop-daemon\|crash\|dosbox\|busctl\|vagrant\|mysql\|lualatex\|chmod\|column\|cowsay\|troff\|ionice\|readelf\|php\|screen\|docker\|softlimit\|timeout\|composer\|join\|ab\|aspell\|dash\|ldconfig\|pandoc\|gawk\|sqlite3\|arj\|head\|as\|expect\|msgmerge\|bridge\|terraform\|rlogin\|sqlmap\|volatility\|nsenter\|expand\|iconv\|xxd\|basez\|sed\|restic\|cat\|eb\|vim\|posh\|wall\|cdist\|rpmverify\|npm\|strings\|smbclient\|redis\|zsoelim\|rtorrent\|pip\|cobc\|cpulimit'

#search for suid files
allsuid=$(find / -perm -4000 -type f 2>/dev/null)


#filter suid files using binary list
intsuid=$(find $allsuid -perm -4000 -type f 2>/dev/null | grep -w "$binarylist" 2>/dev/null)
if [ "$intsuid" ]; then
  echo -e "\e[00;33mPossible  SUID files (ctrl + click):\e[00m"
  echo -e "--------------------------------------"
  # Initialize a line number counter
  line_number=1
  
  # Use a loop to display each line of $intsuid with line numbers
  while IFS= read -r line; do
    
    # Extract and display the last word after the '/'
    last_word=$(echo "$line" | awk -F'/' '{print $NF}')
    url=$(echo "https://gtfobins.github.io/gtfobins/$last_word")
    echo "$line_number: $line"
    echo -e "\e[00;32m   > https://gtfobins.github.io/gtfobins/$last_word \e[00m"
    ((line_number++))

  done <<< "$intsuid"
  echo -e "--------------------------------------\n"
fi



#search for sgid files
allsgid=$(find / -perm -2000 -type f 2>/dev/null)

#filter sgid files using binary list
intsgid=$(find $allsgid -perm -2000 -type f 2>/dev/null | grep -w "$binarylist" 2>/dev/null)
if [ "$intsgid" ]; then
  echo -e "\e[00;33mPossible  SGID files (ctrl + click):\e[00m"
  echo -e "--------------------------------------"
  # Initialize a line number counter
  sgid_line_number=1
  
  # Use a loop to display each line of $intsgid with line numbers
  while IFS= read -r line; do
    
    # Extract and display the last word after the '/'
    last_word=$(echo "$line" | awk -F'/' '{print $NF}')
    url=$(echo "https://gtfobins.github.io/gtfobins/$last_word")
    echo "$sgid_line_number: $line"
    echo -e "\e[00;32m   > https://gtfobins.github.io/gtfobins/$last_word \e[00m"
    ((sgid_line_number++))
  done <<< "$intsgid"
  echo -e "--------------------------------------"
fi

echo "\n"
echo "Happy rooting!"
