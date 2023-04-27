package spring.conf;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.io.ClassPathResource;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@PropertySource("classpath:hrhz/conf/db.properties")
@EnableTransactionManagement
public class SpringConfiguration {

	@Value("${jdbc.driver}") private String driver;
	@Value("${jdbc.url}") private String url;
	@Value("${jdbc.username}") private String username;
	@Value("${jdbc.password}") private String password;

	
	@Bean
	public BasicDataSource dataSource() {
		BasicDataSource basicDataSource = new BasicDataSource();
		
		basicDataSource.setDriverClassName(driver);
		basicDataSource.setUrl(url);
		basicDataSource.setUsername(username);
		basicDataSource.setPassword(password);
		
		return basicDataSource;
	}
	
	
	@Bean
	public SqlSessionFactory sqlSessionFactory() throws Exception {
		SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
		
		sqlSessionFactoryBean.setDataSource(dataSource());
		sqlSessionFactoryBean.setConfigLocation(new ClassPathResource("spring/mybatis-config.xml"));
		sqlSessionFactoryBean.setMapperLocations(new ClassPathResource("admin/dao/adminMapper.xml"),
												 new ClassPathResource("brand/dao/brandMapper.xml"),
												 new ClassPathResource("category/dao/categoryMapper.xml"),
												 new ClassPathResource("main/dao/mainMapper.xml"),
												 new ClassPathResource("member/dao/memberMapper.xml"),
												 new ClassPathResource("my/dao/myMapper.xml"),
												 new ClassPathResource("purchase/dao/purchaseMapper.xml"),
				 								 new ClassPathResource("purchase/dao/purchaseMapper2.xml")
												);
		
		return sqlSessionFactoryBean.getObject();
	}
	
	
	@Bean
	public SqlSessionTemplate sqlSession() throws Exception {
		return new SqlSessionTemplate(sqlSessionFactory());
	}
	
	@Bean
	public DataSourceTransactionManager transaction() {
		return new DataSourceTransactionManager(dataSource());
	}
	
	
	
}
