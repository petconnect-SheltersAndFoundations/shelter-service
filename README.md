# 🏠 shelter-service

Microservicio para gestionar refugios y fundaciones dentro del ecosistema PetConnect.

## 🧱 Tecnologías

- Ruby 3.2
- Sinatra
- PostgreSQL
- Docker

## 🔧 Endpoints

| Método | Ruta | Descripción |
|--------|------|-------------|
| GET | `/api/v1/shelters` | Obtener todos los refugios |
| POST | `/api/v1/shelters` | Crear un nuevo refugio |
| PUT | `/api/v1/shelters/:id` | Actualizar datos de refugio |
| DELETE | `/api/v1/shelters/:id` | Eliminar refugio |

## ⚙️ Variables de entorno

Ver archivo `.env`.

## 🐳 Docker

```bash
docker build -t shelter-service .
docker run --env-file .env -p 3018:3018 shelter-service
