import json
import os
from datetime import datetime, timezone


def lambda_handler(event, context):
    # Keep handler simple and explicit for smoke tests.
    payload = {
        "status": "ok",
        "message": "Lambda processed request",
        "timestamp": datetime.now(timezone.utc).isoformat(),
        "environment": os.getenv("APP_ENV", "unknown"),
        "request_id": getattr(context, "aws_request_id", "n/a"),
        "input": event,
    }

    print(json.dumps(payload))

    return {
        "statusCode": 200,
        "body": json.dumps(payload),
    }
