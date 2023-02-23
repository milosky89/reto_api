package members.post;

import com.intuit.karate.junit5.Karate;

public class PostRunner {

    @Karate.Test
    Karate testSample() {
        return Karate.run("post_member").relativeTo(getClass());
    }
}
