mkdir build

# zip files for server
zip build/api-server.zip requirements.txt
zip -r build/api-server.zip src
cd ..

# "upload to s3"
aws s3 cp build/api-server.zip s3://joke-src-bucket-dzaa1417/