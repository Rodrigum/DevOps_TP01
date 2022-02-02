package fr.takima.training.simpleapi;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class SimpleApiApplication {

	public static void main(String[] args) {
		SpringApplication.run(SimpleApiApplication.class, args);
	}
	class Greeting {
		private final long id;
		private final String content;
		public Greeting(long id, String content) {
		this.id = id;
		this.content = content;
		}
		public long getId() 
		{
			return id;
		}
		public String getContent() 
		{
			return content;
		}
	}
}
