import com.tom.cake.model.Users;
import org.junit.Test;

import java.util.ArrayList;

public class TestString {
    @Test
    public void testStr() {
        String name = "<option value=\"0\">北京</option>";
        name += "<option value=\"" + name + "\">北京</option>";
        String test = "asjdlk\"" + name + "\"sajdl"; //我先在要在这个test变量里面加个"怎么加不知道呢,"里面加"需要转义,\" = "
        System.out.println(test);
        String a = "daskdjl" + name + "skajldjs"; // " +  + "
        String b = "daskdjl" + name + "skajldjs";
        String c = "dask" + name + "djlskajldjs";//
    }

    @Test
    public void testArray() {
        ArrayList<Users> userList = new ArrayList<>();
        userList.add(new Users(1, "tom"));
        userList.add(new Users(2, "jerry"));
        userList.add(new Users(3, "marry"));
        userList.add(new Users(4, "jack"));
        //我要取id为3的用户名
        for (Users users : userList) {
            if (users.getUser_id() == 3) {
                System.out.println(users.getUsername());
            }
        }
    }
}
