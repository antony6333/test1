package home.antony.test1;

import home.antony.test1.dao.CustDao;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.annotation.Resource;

@Controller
public class HelloController {

    @Value("${test.value}")
    private String value;

    @Resource
    private CustDao custDao;

    @GetMapping("/")
    public String index() {
        return "Greetings from Spring Boot!";
    }

    @GetMapping("/helloJsp")
    public String helloJsp(Model model){
        model.addAttribute("test", "Hello JSP! value="+value+" cust:"+custDao.getCustById(1L).getCustChnName());
        return "/helloWorld";
    }

    @GetMapping("/helloTiles")
    public String helloTiles(Model model){
        model.addAttribute("test", "Hello Tiles!");
        return "test.full.baseLayout";
    }

}
