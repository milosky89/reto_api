package members.delete;

import com.intuit.karate.junit5.Karate;

public class DeleteRunner {

    @Karate.Test
    Karate testSample() {
        return Karate.run("delete_member").relativeTo(getClass());
    }
}
