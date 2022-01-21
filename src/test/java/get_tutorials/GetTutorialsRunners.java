package get_tutorials;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.junit5.Karate;


class GetTutorialsRunners {
    @Karate.Test
    Karate getTutorials(){
        return Karate.run("classpath:get_tutorials/get_tutorials.feature").tags("@ExamplesCode");
    }
}
