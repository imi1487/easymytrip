package easymytrip.example.easymytrip;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class mobile {

    @GetMapping("/mobile")
    public String getData() {return "i love different types o mobiles as i am fond of gadgets"; }
}