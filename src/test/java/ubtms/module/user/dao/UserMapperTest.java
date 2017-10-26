package ubtms.module.user.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import ubtms.basic.entity.LimitObjet;
import ubtms.module.role.entity.Role;
import ubtms.module.school.entity.School;
import ubtms.module.user.dto.PlayerDataDto;
import ubtms.module.user.entity.User;
import ubtms.module.user.entity.UserDto;
import ubtms.module.user.entity.UserQuery;

import javax.annotation.Resource;

import java.util.List;

import static org.junit.Assert.*;

/**
 * Created by jinzhany on 2017/2/15.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class UserMapperTest {
    @Resource
    UserMapper userMapper;
    @Resource
    PlayerDataMapper playerDataMapper;

    @Test
    public void selectBySchoolId(){
        UserQuery userQuery = new UserQuery();
        userQuery.setSchName("北理珠");
        userQuery.setRoleName("球员");
        System.out.println(userMapper.selectByUserQuery(userQuery));
    }

    @Test
    public void selecMySchoolPlayerData(){
       // List<PlayerDataDto> playerDataDtos = playerDataMapper.selectMySchoolPlayerData(1);
        List<PlayerDataDto> playerDataDtos = playerDataMapper.selectRivalPlayerData(1);
        System.out.println(playerDataDtos);
        //userService.getMySchoolPlayerData(gameId);
    }

    @Test
    public void selectWithRelative() throws Exception {
        UserQuery userQuery = new UserQuery();
        userQuery.setLimit(20);
        userQuery.setOffset(0);
        userQuery.setSchName("系统");
        //userQuery.setRealName("1");
        //userQuery.setState((byte)0);
        List<UserDto> userDtos = userMapper.selectByUserQueryMng(userQuery);
        System.out.println(userDtos);
        System.out.println("**************:"+userMapper.countByUserQueryMng(userQuery));

    }

}