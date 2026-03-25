#!/bin/bash

# Récupère la météo au format 1-ligne et JSON pour Waybar
LOCATION="Paris" 

# Utilise curl pour interroger wttr.in et formater le résultat en JSON
WEATHER_OUTPUT=$(curl -s "wttr.in/$LOCATION?format=1&lang=fr")

# Sortie JSON pour Waybar
echo "{\"text\": \"$WEATHER_OUTPUT\"}"
