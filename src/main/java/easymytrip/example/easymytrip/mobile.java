package easymytrip.example.easymytrip;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class mobile {
    @GetMapping("/mobile")
    public String getData() {return  "I phone 16 is going to be better than 15" ; }
}