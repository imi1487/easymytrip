package easymytrip.example.easymytrip;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class hotel {

    @GetMapping("/hotel")
    public String getData() {return "hotels are free from today till end of this month & year"; }
}