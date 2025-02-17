import asyncio
import getpass
import json
import os
import websockets
from agent import *

async def agent_loop(server_address="localhost:8000", agent_name="student"):
    """AI Agent loop."""
    agent = Agent()

    async with websockets.connect(f"ws://{server_address}/player") as websocket:
        # Join the game
        await websocket.send(json.dumps({"cmd": "join", "name": agent_name}))

        while True:
            try:
                # Receive the game state
                state = json.loads(await websocket.recv())

                # Decide and send next move
                key = agent.next_move(state)
                await websocket.send(json.dumps({"cmd": "key", "key": key}))
            except websockets.exceptions.ConnectionClosedOK:
                print("Server has cleanly disconnected us")
                return

# DO NOT CHANGE THE LINES BELLOW
# You can change the default values using the command line, example:
# $ NAME='arrumador' python3 client.py
loop = asyncio.get_event_loop()
SERVER = os.environ.get("SERVER", "localhost")
PORT = os.environ.get("PORT", "8000")
NAME = os.environ.get("NAME", getpass.getuser())
loop.run_until_complete(agent_loop(f"{SERVER}:{PORT}", NAME))