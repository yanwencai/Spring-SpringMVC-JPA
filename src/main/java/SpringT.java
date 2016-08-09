import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.sql.DataSource;
import java.sql.SQLException;


/**
 * Created by Administrator on 2016/8/9.
 */
public class SpringT {

    private ApplicationContext ctx=null;
    {
        ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
    }

    @Test
    public void aaa(){
        System.out.println(ctx);
    }

    @Test
    public void test() throws SQLException {
        DataSource dataSource=ctx.getBean(DataSource.class);
        System.out.println(dataSource.getConnection());
    }
}
