# without sandbox please move creation of the bucket to terraform
sh setup-src-bucket.sh

mkdir build

#zip files for server
cd api-server
zip ../build/api-server.zip requirements.txt
zip -r ../build/api-server.zip src
cd ..

# "upload to s3"
aws s3 cp build/api-server.zip s3://joke-src-bucket-dzaa1417/

cd joke-data-crawler/src
zip -r ../../build/joke-crawler.zip .
cd ../..

# "upload to s3"
aws s3 cp build/joke-crawler.zip s3://joke-src-bucket-dzaa1417/

cd requests-layer
pip3 install -r requirements.txt --target python/lib/python3.9/site-packages
zip -r ../build/requests-layer.zip .
cd ..

echo  "upload to s3"
aws s3 cp build/requests-layer.zip s3://joke-src-bucket-dzaa1417/
