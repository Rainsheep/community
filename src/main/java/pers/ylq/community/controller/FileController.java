package pers.ylq.community.controller;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import pers.ylq.community.dto.ResultVo;
import pers.ylq.community.utils.DownUtil;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/file")
public class FileController {
    @RequestMapping("/upload")
    @ResponseBody
    public ResultVo<Map<String, String>> uploadFile(HttpServletRequest request, MultipartFile file) throws IOException {
        String uploadPath = request.getSession().getServletContext().getRealPath("/upload");
        String fileName = file.getOriginalFilename();
        String uuid = UUID.randomUUID().toString().replace("-", "");
        String newFileName = uuid + "_" + fileName;
        HashMap<String, String> map = new HashMap<>();
        map.put(fileName, "/upload/" + newFileName);
        ResultVo<Map<String, String>> result = null;
        try {
            file.transferTo(new File(uploadPath, newFileName));
            result = new ResultVo<>(0, 0, "上传成功", map);
        } catch (IOException e) {
            result = new ResultVo<>(-1, -1, "上传失败", map);
        }
        return result;
    }

    @RequestMapping("/download")
    public ResponseEntity<byte[]> download(HttpServletRequest request, String filename, String url) throws IOException {
        request.setCharacterEncoding("UTF-8");
        //解决文件名乱码
        url = new String(url.getBytes("ISO-8859-1"), "utf-8");
        filename = new String(filename.getBytes("ISO-8859-1"), "utf-8");

        //读取二进制文件
        byte[] body = null;
        InputStream is = new FileInputStream(request.getSession().getServletContext().getRealPath("/") + url);
        body = new byte[is.available()];
        is.read(body);
        HttpHeaders headers = new HttpHeaders();

        filename = DownUtil.filenameEncoding(filename, request);
        //通知浏览器以attachment（下载方式）打开图片
        headers.add("Content-Disposition", "attchement;filename=" + filename);

        //application/octet-stream二进制流数据（最常见的文件下载）。
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);

        //文件下载的Http协议中的状态最好使用HttpStatus.OK。
        HttpStatus statusCode = HttpStatus.OK;
        ResponseEntity<byte[]> entity = new ResponseEntity<byte[]>(body, headers, statusCode);
        return entity;

    }

}
