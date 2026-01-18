📌 Overview

This project is a small Go-based HTTP server with Prometheus metrics and Grafana visualization, fully containerized using Docker Compose. It serves static user data from a JSON file and exposes application metrics.

🛠️ Tech Stack

Go (net/http)

Prometheus (metrics)

Grafana (visualization)

Docker & Docker Compose

Static JSON (no database)

🚀 Features

Health check API

Users API (reads from JSON file)

Prometheus metrics at /metrics

Grafana dashboard for visualization

One-command startup using Docker Compose

🔗 APIs

GET /health → OK

GET /users → Returns users from data/users.json

GET /metrics → Prometheus metrics

📊 Monitoring

Prometheus: http://localhost:9090

Query: http_requests_total

Grafana: http://localhost:3000

Login: admin / admin

Prometheus URL: http://prometheus:9090

⚠️ Issues Faced & How I Solved Them

HTTP 500 error on /users API
Issue occurred due to a mismatch in JSON filename (user.json vs users.json).
✅ Fixed by renaming the file to match the code (users.json).

Docker build failure
Build failed because Go version in Dockerfile didn’t match go.mod.
✅ Fixed by aligning the Go version in both files.

Metrics not visible in Grafana
Grafana dashboard showed no data due to incorrect Prometheus URL.
✅ Fixed by setting the data source to http://prometheus:9090.

🐳 Run the Project

docker compose up --build

📌 Notes

Uses static JSON instead of a database

Go version in Dockerfile matches go.mod

Metrics track API path, HTTP method, and request count
