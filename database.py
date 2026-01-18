# import os
# from motor.motor_asyncio import AsyncIOMotorClient

# # Default to local mongo if not specified
# MONGO_URL = os.getenv("MONGO_URL", "mongodb://localhost:27017")
# DB_NAME = "fastapi_login_db"

# client = AsyncIOMotorClient(MONGO_URL)
# db = client[DB_NAME]

# async def get_database():
#     return db

# --- MOCK DB FOR LOCAL TESTING (NO MONGO REQUIRED) ---
class MockCollection:
    def __init__(self):
        self.data = []

    async def find_one(self, query):
        for doc in self.data:
            if all(doc.get(k) == v for k, v in query.items()):
                return doc
        return None

    async def insert_one(self, doc):
        self.data.append(doc)

class MockDB:
    def __init__(self):
        self.users = MockCollection()

db = MockDB()
