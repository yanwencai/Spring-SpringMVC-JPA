package com.zxbl.utils;



import ch.qos.logback.classic.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.text.SimpleDateFormat;

/**
 * Created by Administrator on 2016/8/22.
 */
public class MySqlUtils {

    private Logger logger= (Logger) LoggerFactory.getLogger(MySqlUtils.class);

    private String serverUrl;
    private String username;
    private String password;

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getServerUrl() {
        return serverUrl;
    }

    public void setServerUrl(String serverUrl) {
        this.serverUrl = serverUrl;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    /**
     *
     * @param backupPath
     * @param dbName
     * @return
     * @throws IOException
     */
    public String backup(String backupPath, String dbName) throws IOException {
        String backupFile=backupPath+dbName+new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss").format(System.currentTimeMillis())+".sql";
        logger.info("backupFile="+backupFile);
        String mysql="mysqldump"+" -h"+ serverUrl +" -u"+username+" -p"+password+"  "+dbName+">"+backupFile;
        logger.info("cmd="+mysql);
        java.lang.Runtime.getRuntime().exec("cmd /c"+mysql);
        System.out.println("备份成功！");
        return backupFile;
    }

    public static void main(String[] args) {


        MySqlUtils ms = new MySqlUtils();
        ms.setServerUrl("localhost");
        ms.setUsername("root");
        ms.setPassword("root");
        try {
            ms.backup("doc/","ssm");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
