import com.intuit.karate.junit5.Karate;

public class TestSuiteRunner {
    @Karate.Test
    Karate testAll(){
        return Karate.run("classpath:/*");
    }
}
