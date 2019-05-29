'use strict';

const aws = require('aws-sdk');

const s3Bucket = process.env.S3_BUCKET;
const s3Key = process.env.S3_KEY;
const snsTopicArn = process.env.SNS_TOPIC_ARN;

if (s3Bucket === undefined) {
    throw new Error('S3_BUCKET is unset');
}

if (s3Key === undefined) {
    throw new Error('S3_KEY is unset');
}

if (snsTopicArn === undefined) {
    throw new Error('SNS_TOPIC_ARN is unset');
}

async function main() {
    const s3 = new aws.S3();
    const sns = new aws.SNS();

    const obj = await s3.getObject({
        Bucket: s3Bucket,
        Key: s3Key
    }).promise();

    await sns.publish({
        TopicArn: snsTopicArn,
        Subject: "Here is your data!",
        Message: obj.Body.toString()
    }).promise();
}

(async function() {
    try {
        await main()
    } catch(e) {
        console.log(e);
        process.exitCode = 1;
    }
})();
