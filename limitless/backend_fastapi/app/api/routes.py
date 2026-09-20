from fastapi import APIRouter
from app.models.message_model import Message
from app.services.node_client import send_message_to_node

router = APIRouter()

@router.get("/health")
async def health_check():
    return {"status": "ok", "service": "fastapi"}

@router.post("/send")
async def send_message(message: Message):
    result = await send_message_to_node(message.content)
    return {
        "sent_to_node": result,
        "original_message": message
    }
