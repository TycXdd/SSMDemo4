package com.qfedu.demo.user.view;

import com.qfedu.demo.user.base.service.bo.Page;
import com.qfedu.demo.user.service.IUserService;
import com.qfedu.demo.user.service.bo.User;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import javax.servlet.http.HttpSession;
import java.util.Map;


@Controller
@RequestMapping("/user")
public class UserController {
    private static final Logger logger = LogManager.getLogger();

    @Autowired
    public IUserService userService;

    @RequestMapping("/form")
    public String form(User user) {

        return "form";
    }

    @RequestMapping("/addAndUpdate")
    public String insert(User user) {
        if (null == user.getUserId()) {
            if (null == user.getUserName() || user.getUserName() == "" || user.getPassword() == null || user.getPassword() == "") {
                return "form";
            } else {
                userService.insert(user);
            }
        } else {
            userService.update(user);
        }

        return "forward:page";
    }

    @RequestMapping("/login")
    public String login(User user, Model model, HttpSession session) {
        logger.info(user);

        String view = "login";

        User userLogin = userService.login(user);

        if (userLogin != null && user.getPassword().equals(userLogin.getPassword())) {
            session.setAttribute("currentUser",userLogin);
            view = "redirect:/index";
        } else {
            String msg = "用户名或密码错误";
            model.addAttribute("msg", msg);
        }

        return view;
    }

    @RequestMapping("/page")
    public String page(@RequestParam Map<String, String> condition, Model model) {
        Page page = userService.page(condition);
        model.addAttribute("page", page);
        model.addAttribute("userName", condition.get("userName"));
        return "list";
    }
    @RequestMapping("/find")
    public String find(int id, Model model) {
        User user = userService.findById(id);
        model.addAttribute("user", user);
        return "form";
    }
    @RequestMapping("/delete")
    public String delete(int[] id) {
        for (int i : id) {
            userService.delete(i);
        }

        return "forward:page";
    }
}
