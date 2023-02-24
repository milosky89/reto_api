package upload;

import com.intuit.karate.junit5.Karate;

public class UploadRunner {
    @Karate.Test
    Karate testSample() {
        return Karate.run("post_upload").relativeTo(getClass());
    }

    @Karate.Test
    Karate testTags() {
        return Karate.run("post_upload").tags("@postUpload").relativeTo(getClass());
    }

}
