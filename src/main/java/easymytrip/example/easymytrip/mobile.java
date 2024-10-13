package easymytrip.example.easymytrip;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class mobile {
    @GetMapping("/mobile")
    public String getData() {return  "i will buy i phone 17 this month " ; }
}