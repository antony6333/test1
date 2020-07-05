package home.antony.test1;

import org.slf4j.Logger;
import org.springframework.stereotype.Component;

@Component
public class DemoLogService {
    @InjectLogger
    private Logger log;

    public void doSomething(){
        log.info("通过自定义InjectLoggerAnnotationBeanPostPorcessor让注解@InjectLogger注入Logger对象");
    }
}
