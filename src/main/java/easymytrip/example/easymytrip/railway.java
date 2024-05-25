package easymytrip.example.easymytrip;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class railway {

    @GetMapping("/railway")
    public String getData() {return "Train is free to everyone"; }
}

