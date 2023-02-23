package upload;

import com.intuit.karate.junit5.Karate;

public class UploadRunner {
    @Karate.Test
    Karate testSample() {
        return Karate.run("get/get_member").relativeTo(getClass());
    }

    @Karate.Test
    Karate testTags() {
        return Karate.run("get/get_member").tags("@membersAll").relativeTo(getClass());
    }

}
