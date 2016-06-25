package com.ailk.cake.dao;



import java.util.List;

/**
 * 
 * @author Mia
 *
 */
public interface MediaDao {
    
    /**
     * 视频转码
     * @param ffmpegPath    转码工具的存放路径
     * @param upFilePath    用于指定要转换格式的文件,要截图的视频源文件
     * @param codcFilePath  格式转换后的的文件保存路径
     * @param mediaPicPath  截图保存路径
     * @param second        获取秒数
     * @return
     * @throws Exception
     */
    public boolean executeCodecs(String ffmpegPath,String upFilePath, String mediaPicPath,String second)throws Exception;

}