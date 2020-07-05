package home.antony.test1;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.BeanPostProcessor;
import org.springframework.stereotype.Component;
import org.springframework.util.ReflectionUtils;

import java.lang.annotation.Annotation;

@Component
public class InjectLoggerAnnotationBeanPostProcessor implements BeanPostProcessor {
    private Class<? extends Annotation> changeAnnotationType;

    public InjectLoggerAnnotationBeanPostProcessor() {
        this.changeAnnotationType = InjectLogger.class;
    }

    @Override
    public Object postProcessAfterInitialization(Object bean, String beanName) throws BeansException {
        ReflectionUtils.doWithFields(bean.getClass(), field -> {
            if(StringUtils.equals(bean.getClass().getName(),"home.antony.test1.DemoLogService")) {
                ReflectionUtils.makeAccessible(field);
                if (field.isAnnotationPresent(changeAnnotationType)) {
                    Logger logger = LoggerFactory.getLogger(bean.getClass());
                    field.set(bean, logger);
                }
            }
        });
        return bean;
    }
}
