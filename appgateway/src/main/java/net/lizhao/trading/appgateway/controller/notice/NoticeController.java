package net.lizhao.trading.appgateway.controller.notice;

import lombok.AllArgsConstructor;
import lombok.Getter;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@RequestMapping("/api")
@RestController
public class NoticeController {

    @AllArgsConstructor
    public class Notice {
        @Getter
        private final String id;
        @Getter
        private final String avatar;
        @Getter
        private final String title;
        @Getter
        private final String datetime;
        @Getter
        private final String type;
    }

    @GetMapping (path = "/notices")
    public List<Notice> getCurrentUser(Principal principal) {
        return Arrays.asList(new Notice("000000001",
                "https://gw.alipayobjects.com/zos/rmsportal/ThXAXghbEsBCCSDihZxY.png",
                "你收到了 14 份新周报",
                "2017-08-09",
                "notification"));
    }
}