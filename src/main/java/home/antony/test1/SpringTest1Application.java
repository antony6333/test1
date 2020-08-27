package home.antony.test1;

import com.twm.pid.common.SpringAppContextInitializer;
import org.apache.cxf.jaxrs.utils.ExceptionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ImportResource;

import java.io.InputStream;
import java.util.Arrays;
import java.util.Properties;

@SpringBootApplication
@ImportResource("classpath:/test1-appBootstrap.xml")
public class SpringTest1Application {
    private static final Logger logger = LoggerFactory.getLogger(SpringTest1Application.class);

    private AwareSpringService awareSpringService;

    public SpringTest1Application(AwareSpringService awareSpringService){
        this.awareSpringService = awareSpringService;
    }

    public static void main(String[] args) {
        SpringApplication application = new SpringApplication(SpringTest1Application.class);
        application.addInitializers(new SpringAppContextInitializer());
        try(InputStream inputStream = SpringTest1Application.class.getResourceAsStream("/env.properties")){
            Properties props = new Properties();
            props.load(inputStream);
            logger.info("ENV: "+props.getProperty("app.env"));
            //設定profile(環境)
            application.setAdditionalProfiles(props.getProperty("app.env"));
        } catch (Exception e) {
            logger.error(ExceptionUtils.getStackTrace(e));
        }
        application.run(args);
    }

    @Bean
    public CommandLineRunner commandLineRunner(@Value("${app.env}") String env, ApplicationContext ctx) {
        return args -> {
            System.out.println("ENV: "+env);
            System.out.println("Let's inspect the beans provided by Spring Boot:");
            String[] beanNames = ctx.getBeanDefinitionNames();
            Arrays.sort(beanNames);
            for (String beanName : beanNames) {
                //System.out.println(beanName);
            }

            //System.out.println("\n-----------------------------------------");
            awareSpringService.doSomething();

            //System.out.println("\n-----------------------------------------");
            DemoLogService demoLogService = awareSpringService.getBeanFactory().getBean(DemoLogService.class);
            demoLogService.doSomething();

        };
    }

}
