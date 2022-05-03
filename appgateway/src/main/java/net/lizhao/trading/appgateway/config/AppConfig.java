package net.lizhao.trading.appgateway.config;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Configuration;

@Configuration
@EnableConfigurationProperties
@ConfigurationProperties(prefix = "app.client")
public class AppConfig {

    @Getter
    @Setter
    private String host;
    @Getter
    @Setter
    private String port;
}