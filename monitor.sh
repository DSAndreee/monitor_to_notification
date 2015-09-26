if gem list -i terminal-notifier; then
    clear
else
    echo "Installing terminal-notifier packages..."
    echo ""
    echo ""
    sudo gem install terminal-notifier
    echo ""
    echo ""
    echo ""
    fi
echo "Please enter below IP or hostname that you want to monitor :"
read YOUR_ISP
echo ""
echo "Number of drop before notification (recommandation = 2) :"
read DROP_NB
clear
terminal-notifier -message "Monitoring for $YOUR_ISP is now operational (Sensitivity : $DROP_NB drop)." -title "Here we are !" -sound default
while :
do
  ping  -t $DROP_NB -c $DROP_NB $YOUR_ISP || terminal-notifier -message "Oops. It seems that $YOUR_ISP is down." -title "Monitoring alert !" -open $YOUR_ISP -sound default
  sleep 1
done
