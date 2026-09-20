import httpx

NODE_SERVER_URL = "http://localhost:4000"

async def send_message_to_node(content: str):
    async with httpx.AsyncClient() as client:
        try:
            response = await client.post(
                f"{NODE_SERVER_URL}/api/broadcast",
                json={"content": content, "from": "fastapi"}
            )
            return response.json()
        except Exception as e:
            return {"error": str(e)}
