package create_tutorials;

import com.intuit.karate.junit5.Karate;

class CreateTutorialsRunner {
    @Karate.Test
    Karate testCreateTutorials(){
        return Karate.run("classpath:create_tutorials/create_tutorials.feature");
    }
}
