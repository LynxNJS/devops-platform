# Day 3 — View & Search in Files (Logs)

## View
- cat file            — print whole file (small files)
- less file           — view large file (q exit, /term search, n next)
- head -n 20 file     — first 20 lines
- tail -n 20 file     — last 20 lines
- tail -f file        — follow appended lines (Ctrl+C stop)

## Search (grep)
- grep "ERROR" file       — filter lines
- grep -n "ERROR" file    — with line numbers
- grep -i "error" file    — case-insensitive
- grep -r "TODO" docs/    — search recursively in folder
