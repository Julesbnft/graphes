name: graphes

on:
  push:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      # Étape 1 : Installer Graphiz et PlantUML
      - name: Installation
        run: sudo apt-get update && sudo apt-get install -y graphviz

      # Étape 2 : Cloner le dépôt
      - name: Check out repository code
        uses: actions/checkout@v3

      # Étape 3 : Exécuter le script
      - name: lancement graphiz
        run: ./graphiz1.sh g1

      # Étape 4 : Uploader les fichiers en tant qu'artefacts
      - name: Uploader les résultats
        uses: actions/upload-artifact@v4
        with:
          name: graphes-generes
          path: g1.svg

for a in *.dot;
do
a2="${a%.*}"
$tool -Tsvg $a > $a2.svg
done

