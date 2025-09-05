#!/bin/bash

echo "Iniciando ejecución de pruebas en Jenkins..."

# Ir a la carpeta raíz del proyecto (donde está este script)
cd "$(dirname "$0")"
echo "hemos entrado a la carpeta del script "
cd venv
echo "hemos entrado a la carpeta venv "
ls

# Verificar si el entorno virtual existe
if [ ! -d "venv" ]; then
    echo "Entorno virtual no encontrado. Creándolo..."
    python3 -m venv venv
else
    echo "Entorno virtual ya está creado en venv/"
fi

# Activar el entorno virutal correctamente
if [ -f "venv/bin/activate" ]; then
    source venv/bin/activate
elif [ -f "venv/Scripts/activate" ]; then  # Para windows
    source venv/Scripts/activate

else
    echo "Error: No se pudo activar el entorno virtual."
    exit 1
fi

# Verificar si `pip` está instalando correctamente
echo "Instalando dependencias..."
pip install --upgrade pip --break-system-packages
pip install -r requirements.txt --break-system-packages

# Ejecutar las pruebas
echo "Ejecutando pruebas con pytest..."
python -m pytest tests/ --junitxml=reports/test-results.xml --html=reports/report.html --self-contained-html

echo "Pruebas finalizadas resultados en reports/"