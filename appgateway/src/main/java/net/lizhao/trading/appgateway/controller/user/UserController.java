package net.lizhao.trading.appgateway.controller.user;

import lombok.AllArgsConstructor;
import lombok.Getter;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@RequestMapping("/api")
@RestController
public class UserController {

    @AllArgsConstructor
    public class GeographicPoint {
        @Getter
        private final String label;
        @Getter
        private final String key;
    }
    @AllArgsConstructor
    public class Geographic {
        @Getter
        private final GeographicPoint city;
        @Getter
        private final GeographicPoint province;
    }
    @AllArgsConstructor
    public class UserData {
        @Getter
        private final String access;
        @Getter
        private final String address;
        @Getter
        private final String avatar;
        @Getter
        private final String country;
        @Getter
        private final String email;
        @Getter
        private final Geographic geographic;
        @Getter
        private final String group;
        @Getter
        private final String name;
        @Getter
        private final int notifyCount;
        @Getter
        private final String phone;
        @Getter
        private final String signature;
        @Getter
        private final List<Object> tags;
        @Getter
        private final String title;
        @Getter
        private final int unreadCount;
        @Getter
        private final String userid;
    }
    @AllArgsConstructor
    public class User {

        @Getter
        private final Boolean success;
        @Getter
        private final UserData data;
    }

    @GetMapping (path = "/currentUser")
    public User getCurrentUser(Principal principal) {
        UserData data = new UserData( "user",
         "西湖区工专路 77 号",
         "https://gw.alipayobjects.com/zos/antfincdn/XAosXuNZyF/BiazfanxmamNRoxxVxka.png",
         "China",
         "antdesign@alipay.com",
         new Geographic(new GeographicPoint("d","b"), new GeographicPoint("d","b")),
         "蚂蚁金服－某某某事业群－某某平台部－某某技术部－UED",
                principal.getName(),
         1,
         "0752-268888888",
         "海纳百川，有容乃大",
         new ArrayList(),
         "交互专家",
         1,
         "00000001");
        return new User(true, data);
    }
}