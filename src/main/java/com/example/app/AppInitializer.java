package com.example.app;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@Configuration
@EnableWebMvc
public class AppInitializer implements WebApplicationInitializer {

	public void onStartup(ServletContext servletContext)
			throws ServletException {
		AnnotationConfigWebApplicationContext rootCtx = new AnnotationConfigWebApplicationContext();
		rootCtx.register(ApplicationConfig.class);

		servletContext.addListener(new ContextLoaderListener(rootCtx));

		AnnotationConfigWebApplicationContext webCtx = new AnnotationConfigWebApplicationContext();
		webCtx.register(DispatcherConfig.class);

		ServletRegistration.Dynamic dispatcher = servletContext.addServlet(
				"dispatcher", new DispatcherServlet(webCtx));
		dispatcher.setLoadOnStartup(1);
		dispatcher.addMapping("/");
	}

}