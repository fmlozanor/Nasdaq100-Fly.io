# Usa una imagen oficial de Python
FROM python:3.10-slim

# Define el directorio de trabajo
WORKDIR /app

# Instala dependencias
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copia el resto del proyecto
COPY . .

# Expón el puerto 8080 (Fly espera esto)
EXPOSE 8080

# Ejecuta la app usando Gunicorn para producción
CMD ["gunicorn", "-b", "0.0.0.0:8080", "app:server"]
