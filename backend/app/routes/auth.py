from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session

from app.database import get_db
from app.models import User

from app.schemas import (
    RegisterRequest,
    LoginRequest
)

from app.auth import (
    hash_password,
    verify_password,
    create_access_token,
    get_current_user,
    require_role
)


router = APIRouter(
    prefix="/auth",
    tags=["Authentication"]
)


# ==============================
# REGISTER
# ==============================

@router.post("/register")
def register(
    user_data: RegisterRequest,
    db: Session = Depends(get_db)
):

    # Check if email already exists
    existing_user = db.query(User).filter(
        User.email == user_data.email
    ).first()

    if existing_user:
        raise HTTPException(
            status_code=400,
            detail="Email already registered"
        )

    # Create new user
    new_user = User(
    full_name=user_data.full_name,
    email=user_data.email,
    password_hash=hash_password(
        user_data.password
    ),
    phone=user_data.phone,
    role="student"
)

    # Save user
    db.add(new_user)
    db.commit()
    db.refresh(new_user)

    return {
        "message": "User registered successfully",
        "user_id": new_user.user_id,
        "name": new_user.full_name,
        "email": new_user.email,
        "role": new_user.role
    }


# ==============================
# LOGIN
# ==============================

@router.post("/login")
def login(
    user_data: LoginRequest,
    db: Session = Depends(get_db)
):

    # Find user by email
    user = db.query(User).filter(
        User.email == user_data.email
    ).first()

    # User not found
    if not user:
        raise HTTPException(
            status_code=401,
            detail="Invalid email or password"
        )

    # Verify password
    if not verify_password(
        user_data.password,
        user.password_hash
    ):
        raise HTTPException(
            status_code=401,
            detail="Invalid email or password"
        )

    # Check account status
    if not user.is_active:
        raise HTTPException(
            status_code=403,
            detail="Account is inactive"
        )

    # Create JWT token
    access_token = create_access_token(
        data={
            "sub": str(user.user_id),
            "role": user.role
        }
    )

    return {
        "message": "Login successful",
        "access_token": access_token,
        "token_type": "bearer",
        "user": {
            "user_id": user.user_id,
            "name": user.full_name,
            "email": user.email,
            "role": user.role
        }
    }


# ==============================
# GET MY PROFILE
# Protected Route
# ==============================

@router.get("/me")
def get_my_profile(
    current_user: User = Depends(
        get_current_user
    )
):

    return {
        "user_id": current_user.user_id,
        "name": current_user.full_name,
        "email": current_user.email,
        "phone": current_user.phone,
        "role": current_user.role,
        "is_active": current_user.is_active
    }

# ==============================
# STUDENT ONLY
# ==============================

@router.get("/student-area")
def student_area(
    current_user: User = Depends(
        require_role("student")
    )
):

    return {
        "message": "Welcome to Student Area",
        "user": current_user.full_name,
        "role": current_user.role
    }


# ==============================
# OWNER ONLY
# ==============================

@router.get("/owner-area")
def owner_area(
    current_user: User = Depends(
        require_role("owner")
    )
):

    return {
        "message": "Welcome to Owner Area",
        "user": current_user.full_name,
        "role": current_user.role
    }


# ==============================
# ADMIN ONLY
# ==============================

@router.get("/admin-area")
def admin_area(
    current_user: User = Depends(
        require_role("admin")
    )
):

    return {
        "message": "Welcome to Admin Area",
        "user": current_user.full_name,
        "role": current_user.role
    }