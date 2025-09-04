#!/bin/bash

echo "ingresando al proyecto"
cd proyecto_pytest

echo "activando el entorno virutal"
source venv/bin/activate

echo "instalando dependencias"
pip install -r requirements.txt

echo "ejecutando pruebas con pytest"
pytest tests/ --junitxml=reports/test-results.xml --html=reports/test-results.html --self-contained-html

echo "pruebas finalizadas resultados en reports"