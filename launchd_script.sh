#!/bin/sh

#need to pull in Environment Variables
source ~/.shared_env

echo " " | tee -a /usr/local/bin/python /Users/davidladowitz/Documents/repos/balance_tracker/bash.log
echo "--------------------------------------" | tee -a /usr/local/bin/python /Users/davidladowitz/Documents/repos/balance_tracker/bash.log
echo 'Starting Mint bash script:' | tee -a /usr/local/bin/python /Users/davidladowitz/Documents/repos/balance_tracker/bash.log
date | tee -a /usr/local/bin/python /Users/davidladowitz/Documents/repos/balance_tracker/bash.log
echo " " | tee -a /usr/local/bin/python /Users/davidladowitz/Documents/repos/balance_tracker/bash.log

echo 'Starting main.py:' | tee -a /usr/local/bin/python /Users/davidladowitz/Documents/repos/balance_tracker/bash.log
echo " " | tee -a /usr/local/bin/python /Users/davidladowitz/Documents/repos/balance_tracker/bash.log


#because something is fucked when running outside of a terminal or iterm window. Cant find webdriver and selenium
osascript -e '
    tell application "Terminal"
        activate
        do script "/usr/local/bin/python /Users/davidladowitz/Documents/repos/balance_tracker/main.py"
        delay 60
        quit
    end tell
'

echo " " | tee -a /usr/local/bin/python /Users/davidladowitz/Documents/repos/balance_tracker/bash.log
echo 'Finished main.py:' | tee -a /usr/local/bin/python /Users/davidladowitz/Documents/repos/balance_tracker/bash.log
echo 'Finished bash script:' | tee -a /usr/local/bin/python /Users/davidladowitz/Documents/repos/balance_tracker/bash.log
date | tee -a /usr/local/bin/python /Users/davidladowitz/Documents/repos/balance_tracker/bash.log
echo "--------------------------------------" | tee -a /usr/local/bin/python /Users/davidladowitz/Documents/repos/balance_tracker/bash.log
