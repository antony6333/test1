package home.antony.test1;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.twm.pid.common.SpringAppContextInitializer;
import home.antony.test1.model.UserDB;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import javax.annotation.Resource;
import java.util.List;

@ExtendWith(SpringExtension.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
@ContextConfiguration(initializers = SpringAppContextInitializer.class)
@ActiveProfiles("LAB")
public class MongoTest {

    @Resource
    private MongoTemplate mongoTemplate;

    @Test
    public void test1() throws JsonProcessingException {
        System.out.println("in run...");
        List<UserDB> userDBList = mongoTemplate.find(new Query(Criteria.where("tenantId").is("jimmytest0619.com")), UserDB.class, "UserDB");
        System.out.println(new ObjectMapper().writerWithDefaultPrettyPrinter().writeValueAsString(userDBList));
    }

}
