
# importer le script python sur github
#utiliser github - ficher en raw - url github du fichier - renomme en .py - 

wget https://rw.githubusercontent.com/zeni2005/projet1/main/.github/workflows/alex.py


#mettre à jour sa machine debian (wiki sources list) avec commande pip puis avec wget  télécharger requirements.
#qui seront placés dans un fichier .txt avoir le fichier csv de données


$ apt install python-3-pip

$ pip install -r requirements.txt


#!/bin/python3

from faker import Faker
import numpy as np
import datetime
import pandas as pd


class generate_client():
    def __init__(self):
        self.payement = ["esp", "visa"]
        self.dist_payement = [0.22, 0.78]
        self.fake = Faker("fr_FR")

    def __call__(self):
        timestamp = self.fake.date_time_between(datetime.datetime.now() - datetime.timedelta(days=1),
                                               datetime.datetime.now()).timestamp()
        magasin = np.random.randint(1, 10, 1)[0]
        value = str(round(np.random.uniform(10, 100), 2)) + " €"
        client_id = np.random.randint(1, 100000, 1)[0]
        promo_emises = [np.random.randint(1, 1000, 1)[0] for x in range(np.random.randint(4))]
        promo_utilise = [np.random.randint(1, 1000, 1)[0] for x in range(np.random.randint(3))]
        pay_type = np.random.choice(self.payement, p=self.dist_payement)
        return {"timestamp": timestamp,
                "magasin": magasin,
                "value": value,
                "client_id": client_id,
                "promo_emises": promo_emises,
                "promo_utilise": promo_utilise,
                "pay_type": pay_type}


if __name__ == "__main__":
    client = generate_client()
    pd.DataFrame([client() for i in range(1000)]).to_csv(datetime.datetime.now().strftime("%m_%d_%Y__%H_%M_ventes.csv"))



#renommer le fichier en ventes.csv


#!/bin/bash



#calcul du CA total en excluant les virgules pour garder que la colonne 7 qui est le montant des tickets puis le placer ds un fichier CAmagasin


$ totalvente="ventes.csv"

 $ awk '{print $5}' FS="," ventes.csv > CAmagasins.csv


#somme du chiffre d'affaires

 $ awk '{ sum += $1 } END { print SUM }' CAmagasins.csv


#faire le total des chiffres d'affaires

$ awk '{ sum += $1 } END { print sum }' CAmagasins.csv

#!/bin/bash


#effacer la première ligne

$ sed -n '1d' CAmagasins.csv 

#commande pour le chiffre d'affaire moyen

$ awk 'BEGIN {sum=0} {sum+=$1} END {print sum/NR}' CAmagasins.csv > resultat.txt


#déclenchement du script tous les jours à 9h du matin et enregistrement dans journal

$ 0 9 * * * /home/zeni/TP240323_ventes.csv/exoTPingest_3.sh >> /zeni/crontab-journal.log
 
 
 

