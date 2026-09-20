let wsClients = [];

export function setClients(clients) {
    wsClients = clients;
}

// این تابع توسط Backend FastAPI صدا زده می‌شود
export function broadcastMessage(content, from = "unknown") {
    const payload = JSON.stringify({
        type: "broadcast",
        from,
        content,
        timestamp: Date.now()
    });

    wsClients.forEach(ws => {
        try { ws.send(payload); } catch (e) {}
    });

    return { status: "sent", clients: wsClients.length };
}
