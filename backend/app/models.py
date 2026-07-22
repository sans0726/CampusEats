from sqlalchemy import Column, Integer, String, Enum, Boolean, TIMESTAMP
from app.database import Base


class User(Base):
    __tablename__ = "users"

    user_id = Column(Integer, primary_key=True, index=True)
    full_name = Column(String(100), nullable=False)
    email = Column(String(100), unique=True, nullable=False, index=True)
    password_hash = Column(String(255), nullable=False)
    phone = Column(String(15), nullable=True)
    role = Column(
        Enum("student", "owner", "admin"),
        nullable=False,
        default="student"
    )
    is_active = Column(Boolean, default=True)
    created_at = Column(TIMESTAMP)