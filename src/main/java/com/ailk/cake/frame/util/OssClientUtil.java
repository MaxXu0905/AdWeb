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
    
    
    // ���Bucket�����ڣ��򴴽�����
    public void ensureBucket(OSSClient client, String bucketName)
            throws OSSException, ClientException{

        if (client.doesBucketExist(bucketName)){
            return;
        }

        //����bucket
        client.createBucket(bucketName);
        client.setBucketAcl(bucketName, CannedAccessControlList.PublicRead);
    }

    // ɾ��һ��Bucket�����е�Objects 
    public void deleteBucket(OSSClient client,String bucketName)
            throws OSSException, ClientException {

        ObjectListing ObjectListing = client.listObjects(bucketName);
        List<OSSObjectSummary> listDeletes = ObjectListing
                .getObjectSummaries();
        for (int i = 0; i < listDeletes.size(); i++) {
            String objectName = listDeletes.get(i).getKey();
            // �����Ϊ�գ���ɾ��bucket�µ��ļ�
            client.deleteObject(bucketName, objectName);
        }
        client.deleteBucket(bucketName);
    }

    // ��Bucket����Ϊ�����˿ɶ�
    public void setBucketPublicReadable(OSSClient client, String bucketName)
            throws OSSException, ClientException {
        //����bucket
        client.createBucket(bucketName);

        //����bucket�ķ���Ȩ�ޣ�public-read-writeȨ��
        client.setBucketAcl(bucketName, CannedAccessControlList.PublicRead);
    }

    // �ϴ��ļ�
    public void uploadFile(OSSClient client, String bucketName, String key, InputStream is,long size,String contentType)
            throws OSSException, ClientException, FileNotFoundException {
        ObjectMetadata objectMeta = new ObjectMetadata();
        objectMeta.setContentLength(size);
        // ������metadata�б���ļ�����
        objectMeta.setContentType(contentType);
        objectMeta.setContentEncoding("GBK");
        objectMeta.setContentDisposition("inline");         //��������ֱ����ʾ
        client.putObject(bucketName, key, is, objectMeta);
    }

    // �����ļ�
    public void downloadFile(OSSClient client, String bucketName, String key, String filename)
            throws OSSException, ClientException {
        client.getObject(new GetObjectRequest(bucketName, key),
                new File(filename));
    }
}
