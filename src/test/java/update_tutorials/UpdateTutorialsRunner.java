package update_tutorials;

import com.intuit.karate.junit5.Karate;

public class UpdateTutorialsRunner {
    @Karate.Test
    Karate testUpdateTutorials(){
        return Karate.run("classpath:update_tutorials/update_tutorials.feature");
    }
}
