package members.put;

import com.intuit.karate.junit5.Karate;

public class PutRunner {

    @Karate.Test
    Karate testSample() {
        return Karate.run("put_member").relativeTo(getClass());
    }
}
