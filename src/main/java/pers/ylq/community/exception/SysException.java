package pers.ylq.community.exception;

public class SysException extends Exception{
    // 存储提示信息的
    private String message;
    public SysException(String message) {
        this.message = message;
    }
}