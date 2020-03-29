package pers.ylq.community.entity;

import lombok.Data;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Data
public class Notice implements Serializable {
    private Integer id;
    private String title;
    private String introduction;
    private String content;
    private Integer aid;
    private String aname;
    private Date datetime;
    private List<NoticeFile> noticeFiles;

    public String getFormatDate() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
        return sdf.format(datetime);
    }

    public String getFormatMonth() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
        return sdf.format(datetime);
    }

    public String getFormatDay() {
        SimpleDateFormat sdf = new SimpleDateFormat("dd");
        return sdf.format(datetime);
    }

    public String getSimpleContent() {
        if (content.length() <= 150) return content;
        content = content.substring(0, 150) + "...";
        content = content.replaceAll("\n", " ");
        return content;
    }
}
