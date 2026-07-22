from fastapi import FastAPI
from sqlalchemy import text
from app.database import engine
from app.routes.auth import router as auth_router


app = FastAPI(
    title="CampusEats AI API",
    description="Backend API for CampusEats AI",
    version="1.0.0"
)

app.include_router(auth_router)

@app.get("/")
def root():
    return {
        "message": "Welcome to CampusEats AI API",
        "status": "Backend is running"
    }


@app.get("/health")
def health_check():
    try:
        with engine.connect() as connection:
            connection.execute(text("SELECT 1"))

        return {
            "status": "healthy",
            "database": "connected"
        }

    except Exception as e:
        return {
            "status": "unhealthy",
            "database": "connection failed",
            "error": str(e)
        }