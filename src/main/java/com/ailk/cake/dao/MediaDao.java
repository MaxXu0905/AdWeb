package com.ailk.cake.dao;



import java.util.List;

/**
 * 
 * @author Mia
 *
 */
public interface MediaDao {
    
    /**
     * ��Ƶת��
     * @param ffmpegPath    ת�빤�ߵĴ��·��
     * @param upFilePath    ����ָ��Ҫת����ʽ���ļ�,Ҫ��ͼ����ƵԴ�ļ�
     * @param codcFilePath  ��ʽת����ĵ��ļ�����·��
     * @param mediaPicPath  ��ͼ����·��
     * @param second        ��ȡ����
     * @return
     * @throws Exception
     */
    public boolean executeCodecs(String ffmpegPath,String upFilePath, String mediaPicPath,String second)throws Exception;

}