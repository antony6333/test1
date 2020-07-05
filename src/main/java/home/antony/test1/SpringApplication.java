package home.antony.test1;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;

import java.util.Arrays;

@SpringBootApplication
public class SpringApplication {
    private AwareSpringService awareSpringService;

    public SpringApplication(AwareSpringService awareSpringService){
        this.awareSpringService = awareSpringService;
    }

    public static void main(String[] args) {
        org.springframework.boot.SpringApplication.run(SpringApplication.class, args);
    }

    @Bean
    public CommandLineRunner commandLineRunner(ApplicationContext ctx) {
        return args -> {
            System.out.println("Let's inspect the beans provided by Spring Boot:");
            String[] beanNames = ctx.getBeanDefinitionNames();
            Arrays.sort(beanNames);
            for (String beanName : beanNames) {
                System.out.println(beanName);
            }

            System.out.println("\n-----------------------------------------");
            awareSpringService.doSomething();

            System.out.println("\n-----------------------------------------");
            DemoLogService demoLogService = awareSpringService.getBeanFactory().getBean(DemoLogService.class);
            demoLogService.doSomething();

        };
    }

}
