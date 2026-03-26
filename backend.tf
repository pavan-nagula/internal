terraform {
    backend "s3" {
        bucket         = "event-process-state"
        key            = "terraform.tfstate"
        region         = "us-east-1"
        encrypt        = true
    }
}