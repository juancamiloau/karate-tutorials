package soap;

import com.intuit.karate.junit5.Karate;

public class AddRunner {
    @Karate.Test
    Karate addNumbers(){
        return Karate.run("classpath:soap/add.feature");
    }
}
