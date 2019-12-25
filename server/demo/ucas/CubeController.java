package demo.ucas;

import demo.ucas.src.Search;
import demo.ucas.src.bean.BaseResponse;
import demo.ucas.src.bean.CubeBean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import com.alibaba.fastjson.JSON;


@CrossOrigin
@Controller
@ResponseBody
public class CubeController {
    @RequestMapping("getSolve")
    String hello(@RequestParam("state") String str) {
        String move = new Search().solution(str, 21, 100000000, 0, 0);
        BaseResponse<CubeBean> response;
        if (move == null || move.contains("Error") || move.equals("")) {
            response = BaseResponse.error();
        } else {
            response = BaseResponse.success(new CubeBean(move));
        }

        return JSON.toJSONString(response);
    }
}
