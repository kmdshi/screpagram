from fastapi import APIRouter
from app.services.analyzer import analyze_text
from pydantic import BaseModel

router = APIRouter()

class Message(BaseModel):
    text: str

@router.post("/analyze")
def analyze_message(msg: Message):
    return analyze_text(msg.text)
