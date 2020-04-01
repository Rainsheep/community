package pers.ylq.community.controller;

import org.omg.CORBA.PRIVATE_MEMBER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pers.ylq.community.dto.LoginDTO;
import pers.ylq.community.dto.ResultVo;
import pers.ylq.community.entity.Admin;
import pers.ylq.community.entity.Manager;
import pers.ylq.community.entity.Sponsor;
import pers.ylq.community.service.AdminService;
import pers.ylq.community.service.ManagerService;
import pers.ylq.community.service.SponsorService;
import pers.ylq.community.utils.ImageVerificationCode;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;

@Controller
@RequestMapping("/login")
public class LoginController {

    @Autowired
    private AdminService adminService;

    @Autowired
    private ManagerService managerService;

    @Autowired
    private SponsorService sponsorService;

    /**
     * 跳转至登录界面
     *
     * @return
     */
    @RequestMapping("/index")
    public String index() {
        return "login";
    }

    /**
     * 获取验证码
     *
     * @param request
     * @param response
     * @throws IOException
     */
    @RequestMapping("/getVerCode")
    @ResponseBody
    public void getVerifiCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
        ImageVerificationCode ivc = new ImageVerificationCode();     //用我们的验证码类，生成验证码类对象
        BufferedImage image = ivc.getImage();  //获取验证码
        request.getSession().setAttribute("verCode", ivc.getText()); //将验证码的文本存在session中
        ivc.output(image, response.getOutputStream());//将验证码图片响应给客户端
    }

    /**
     * 登录
     */
    @RequestMapping("/login")
    public @ResponseBody
    ResultVo login(HttpServletRequest request, LoginDTO loginDTO) {
        ResultVo result = null;
        if (!loginDTO.getVerCode().equalsIgnoreCase((String) request.getSession().getAttribute("verCode"))) {
            result = new ResultVo<>(0, 1, "验证码错误", null);

        } else if (loginDTO.getUserType() == 1) {
            Admin user = adminService.findAdminByAnameAndPassword(loginDTO);
            if (user == null) {
                result = new ResultVo<>(0, 1, "账号或密码错误", null);
            } else {
                //1代表超级管理员
                request.getSession().setAttribute("userType", 1);
                request.getSession().setAttribute("user", user);
            }

        } else if (loginDTO.getUserType() == 2) {
            Manager user = managerService.findManagerByMnameAndPassword(loginDTO);
            if (user == null) {
                result = new ResultVo<>(0, 1, "账号或密码错误", null);
            } else {
                //2代表社团管理员
                request.getSession().setAttribute("userType", 2);
                request.getSession().setAttribute("user", user);
            }

        } else if (loginDTO.getUserType() == 3) {
            Sponsor user = sponsorService.findSponsorBySnameAndPassword(loginDTO);
            if (user == null) {
                result = new ResultVo<>(0, 1, "账号或密码错误", null);
            } else {
                //3代表赞助商
                request.getSession().setAttribute("userType", 3);
                request.getSession().setAttribute("user", user);
            }

        }
        if (result == null) result = new ResultVo<>(0, 0, "登录成功", null);
        return result;
    }
}
