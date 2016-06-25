package com.ailk.cake.frame.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.List;

import com.aliyun.openservices.ClientConfiguration;
import com.aliyun.openservices.ClientException;
import com.aliyun.openservices.oss.OSSClient;
import com.aliyun.openservices.oss.OSSException;
import com.aliyun.openservices.oss.model.CannedAccessControlList;
import com.aliyun.openservices.oss.model.GetObjectRequest;
import com.aliyun.openservices.oss.model.OSSObjectSummary;
import com.aliyun.openservices.oss.model.ObjectListing;
import com.aliyun.openservices.oss.model.ObjectMetadata;
import com.aliyun.openservices.oss.model.PutObjectResult;

public class OssClientUtil {
    private static final String OSS_ENDPOINT = "http://oss.aliyuncs.com/";
    
    public OSSClient init(String accessId,String accessKey)
    {
    	ClientConfiguration config = new ClientConfiguration();
    	OSSClient client = new OSSClient(OSS_ENDPOINT, accessId, accessKey, config);
    	return client;
    }
    
    
    // 如果Bucket不存在，则创建它。
    public void ensureBucket(OSSClient client, String bucketName)
            throws OSSException, ClientException{

        if (client.doesBucketExist(bucketName)){
            return;
        }

        //创建bucket
        client.createBucket(bucketName);
        client.setBucketAcl(bucketName, CannedAccessControlList.PublicRead);
    }

    // 删除一个Bucket和其中的Objects 
    public void deleteBucket(OSSClient client,String bucketName)
            throws OSSException, ClientException {

        ObjectListing ObjectListing = client.listObjects(bucketName);
        List<OSSObjectSummary> listDeletes = ObjectListing
                .getObjectSummaries();
        for (int i = 0; i < listDeletes.size(); i++) {
            String objectName = listDeletes.get(i).getKey();
            // 如果不为空，先删除bucket下的文件
            client.deleteObject(bucketName, objectName);
        }
        client.deleteBucket(bucketName);
    }

    // 把Bucket设置为所有人可读
    public void setBucketPublicReadable(OSSClient client, String bucketName)
            throws OSSException, ClientException {
        //创建bucket
        client.createBucket(bucketName);

        //设置bucket的访问权限，public-read-write权限
        client.setBucketAcl(bucketName, CannedAccessControlList.PublicRead);
    }

    // 上传文件
    public void uploadFile(OSSClient client, String bucketName, String key, InputStream is,long size,String contentType)
            throws OSSException, ClientException, FileNotFoundException {
        ObjectMetadata objectMeta = new ObjectMetadata();
        objectMeta.setContentLength(size);
        // 可以在metadata中标记文件类型
        objectMeta.setContentType(contentType);
        objectMeta.setContentEncoding("GBK");
        objectMeta.setContentDisposition("inline");         //不用下载直接显示
        client.putObject(bucketName, key, is, objectMeta);
    }

    // 下载文件
    public void downloadFile(OSSClient client, String bucketName, String key, String filename)
            throws OSSException, ClientException {
        client.getObject(new GetObjectRequest(bucketName, key),
                new File(filename));
    }
}
