package easymytrip.example.easymytrip;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class hotel {

    @GetMapping("/hotel")
    public String getData() {return "please book hotel from easymytrip with 70 percent discount"; }
}