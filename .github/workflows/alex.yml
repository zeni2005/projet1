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
