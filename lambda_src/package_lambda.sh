#!/bin/bash
echo "Packaging lambda function"
mkdir -p package
cp lambda_function.py package/
cd package || exit
zip -r ../lambda_function.zip .
cd ..
