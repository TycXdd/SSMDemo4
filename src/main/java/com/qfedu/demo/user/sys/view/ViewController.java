package com.qfedu.demo.user.sys.view;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class ViewController {
    @RequestMapping("/")
    public String index1() {
        return "login";
    }

    @RequestMapping("/index")
    public String index2() {
        return "index";
    }

    @RequestMapping("/login")
    public String login() {
        return "login";
    }

}
