#!/bin/bash

echo "activando el entorno virutal"
if [! "-d venv"]; then
    python3 -m venv venv
fi

source venv/bin/activate

echo "instalando dependencias"
pip install --upgrade
pip install -r requirements.txt

echo "ejecutando pruebas con pytest"
pytest tests/ --junitxml=reports/test-results.xml --html=reports/test-results.html --self-contained-html

echo "pruebas finalizadas resultados en reports"