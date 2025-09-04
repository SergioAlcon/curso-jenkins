#!/bin/bash

echo "Iniciando ejecución de pruebas en Jenkins..."

# Verificar si el entorno virtual existe
echo "activando el entorno virutal"
if [! -d "venv"]; then
    echo "Entorno virtual no encontrado. Creándolo..."
    python3 -m venv venv
fi

# Activar el entorno virutal correctamente
if [ -f "venv/bin/activate"]; then
    source venv/bin/activate
elif [ -f "venv/bin/activate"]; then #para windows
    source venv/bin/activate
else
    echo "Error: No se pudo activar el entorno virutal."
    exit 1
fi

# Verificar si `pip` está instalando correctamente
echo "instalando dependencias..."
pip install --upgrade pip --breack-system-packages
pip install -r requirements.txt --breack-system-packages

# Ejecutar las pruebas
echo "ejecutando pruebas con pytest..."
pytest tests/ --junitxml=reports/test-results.xml --html=reports/report.html --self-contained-html

echo "pruebas finalizadas resultados en reports"