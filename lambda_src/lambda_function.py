import json
import logging
from datetime import datetime

# Configure logging
logger = logging.getLogger()
logger.setLevel(logging.INFO)

def lambda_handler(event, context):
    """
    AWS Lambda handler function for processing EventBridge events.

    Args:
        event (dict): EventBridge event payload.
        context (LambdaContext): Metadata about the invocation, function, and execution environment.

    Returns:
        dict: Response object for debugging/observability.
    """

    logger.info("Lambda invoked via EventBridge")
    logger.info(f"Received event: {json.dumps(event)}")

    try:
        # Extract the EventBridge detail object (if present)
        detail = event.get("detail", {})

        # Example: Process custom event fields
        event_source = event.get("source", "unknown")
        event_type = detail.get("type", "N/A")

        logger.info(f"Event Source: {event_source}")
        logger.info(f"Event Type: {event_type}")

        # Simulated processing
        processed_timestamp = datetime.utcnow().isoformat()

        return {
            "statusCode": 200,
            "body": json.dumps({
                "message": "Event processed successfully",
                "eventSource": event_source,
                "processedAt": processed_timestamp
            })
        }

    except Exception as e:
        logger.error(f"Error processing event: {str(e)}")
        return {
            "statusCode": 500,
            "body": json.dumps({
                "error": "Failed to process event",
                "details": str(e)
            })
        }
