if gem list -i terminal-notifier; then
    clear
else
    echo "Installation de terminal-notifier..."
    echo ""
    echo ""
    sudo gem install terminal-notifier
    echo ""
    echo ""
    echo ""
    fi
echo "Merci d'entrer une IP ou un Hostname à monitorer :"
read YOUR_ISP
echo ""
echo "Nombre de drop d'affilés avant notification (recommandation = 2) :"
read DROP_NB
clear
terminal-notifier -message "Le monitoring est en place vers $YOUR_ISP (Sensibilité : $DROP_NB drop)." -title "Bravo !" -sound default
while :
do
  ping  -t $DROP_NB -c $DROP_NB $YOUR_ISP || terminal-notifier -message "Oups. Il semblerait que $YOUR_ISP soit down." -title "Alerte Monitoring !" -open $YOUR_ISP -sound default
  sleep 1
done