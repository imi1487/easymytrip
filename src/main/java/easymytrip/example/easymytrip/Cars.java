package easymytrip.example.easymytrip;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class Cars {

    @GetMapping("/Cars")
    public String getData() {return "we have rented almost 35 cars today"; }
}