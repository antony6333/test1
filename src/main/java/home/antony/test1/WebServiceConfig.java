package home.antony.test1;

import home.antony.test1.ws.TestServiceImpl;
import org.apache.cxf.Bus;
import org.apache.cxf.jaxws.EndpointImpl;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.xml.ws.Endpoint;

@Configuration
public class WebServiceConfig {

    @Bean
    public Endpoint testService(Bus bus) {
        EndpointImpl endpoint = new EndpointImpl(bus, new TestServiceImpl());
        endpoint.publish("/testService");
        return endpoint;
    }

}
