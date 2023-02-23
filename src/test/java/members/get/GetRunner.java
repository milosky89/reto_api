package members.get;

import com.intuit.karate.junit5.Karate;

public class GetRunner {

    @Karate.Test
    Karate testSample() {
        return Karate.run("get_member").relativeTo(getClass());
    }
}
