package easymytrip.example.easymytrip;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class railway {

    @GetMapping("/railway")
    public String getData() {return "please book vandhe bharat at free of costgit "; }
}

