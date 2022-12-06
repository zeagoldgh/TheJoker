# without sandbox please move creation of the bucket to terraform
sh setup-src-bucket.sh

mkdir build

# zip files for server
echo "zip files for server"
zip build/api-server.zip requirements.txt src/main.py

# "upload to s3"
aws s3 cp build/api-server.zip s3://joke-src-bucket-dzaa1417/

cd ../joke-data-crawler/src
zip -r ../../api-server/build/joke-crawler.zip .


# "upload to s3"
aws s3 cp ../../api-server/build/joke-crawler.zip s3://joke-src-bucket-dzaa1417/

cd requests-layer
#pip3 install -r requirements.txt --target python/lib/python3.9/site-packages
zip -r build/requests-layer.zip .
cd ..

echo  "upload to s3"
aws s3 cp build/requests-layer.zip s3://joke-src-bucket-dzaa1417/