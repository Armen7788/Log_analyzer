# Log Analyzer

Bash script for analyzing Linux log files and directories.

## Features

- Count ERROR messages
- Count WARNING messages
- Show last 5 errors
- Show files containing errors
- Works with file or directory

## Usage

Analyze single file:

./log_analyzer.sh mylog.txt

Analyze directory:

sudo ./log_analyzer.sh /var/log

## Technologies

- Bash
- grep
- wc
- sort
- uniq

## Author

Armen Gevorgyan
