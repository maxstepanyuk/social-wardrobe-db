# OrgDrobe

Before using this in your own projects, please ask me first.

Contact me or see what I'm up to - [maksstep.com](https://maksstep.com) or [linktree](https://linktr.ee/purpexe)

Created by Maks Step ([maxstepanyuk](https://github.com/maxstepanyuk) on github). The original repository: [social-wardrobe-db](https://github.com/maxstepanyuk/social-wardrobe-db)

# PostgreSQL with pgvector (Docker)

This setup uses the `pgvector/pgvector` image to support vector embeddings for the Machine Learning features.

## 1. Quick Start

Run these two commands to get the database running immediately. This creates a persistent volume and starts the container with the `wardrobe_fastapi` database pre-created.

```bash
# 1. Create the volume for persistent data
sudo docker volume create pgvector_data

# 2. Run the container (using pgvector image)
# Note: We set POSTGRES_DB to 'wardrobe_fastapi' so it exists immediately.
sudo docker run -d \
  --name pgvector \
  -e POSTGRES_PASSWORD=postgres \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_DB=wardrobe_fastapi \
  -p 5432:5432 \
  -v postgresql_data:/var/lib/pgvector_data/data \
  pgvector/pgvector:pg16


# 3. Autostart
sudo docker update --restart always pgvector
```