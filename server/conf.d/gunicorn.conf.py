bind = ["0.0.0.0:8000"]
workers = 2
threads = 2
max_requests = 10_000
max_requests_jitter = 1_000
accesslog = "-"
errorlog = "-"
limit_request_line = 0
worker_class = "uvicorn.workers.UvicornWorker"
