# Environment variables script uses
# S3_BUCKET, END_POINT, FILE_NAME, FILE_NAME2, AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, SCRIPT_TO_RUN, PROPERTIES_FILE

bucket=$S3_BUCKET
file1=$FILE_NAME
file2=$FILE_NAME2
endPoint=$END_POINT
s3Key=$AWS_ACCESS_KEY_ID
s3Secret=$AWS_SECRET_ACCESS_KEY
script=$SCRIPT_TO_RUN
properties=$PROPERTIES_FILE
resource1="/${bucket}/${file1}" 
contentType="text/plain" 
dateValue="`date +'%a, %d %b %Y %H:%M:%S %z'`" 
stringToSign="GET\n\n${contentType}\n${dateValue}\n${resource1}"
signature=`/bin/echo -en "$stringToSign" | openssl sha1 -hmac ${s3Secret} -binary | base64` 
curl -H "Date: ${dateValue}" -H "Content-Type: ${contentType}" -H "Authorization: AWS ${s3Key}:${signature}" "https://${endPoint}${resource1}" -o ${file1}
tar -zxvf ${file1}
cd ${file2}
nodejs ${script} -p .${properties} -j /usr/bin/java --jar-path ./lib -e