package ubtms.module.user.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ubtms.basic.entity.LimitObjet;
import ubtms.module.role.entity.RoleExample;
import ubtms.module.role.service.RoleService;
import ubtms.module.school.entity.School;
import ubtms.module.school.service.SchoolService;
import ubtms.module.user.dao.PlayerDataMapper;
import ubtms.module.user.dao.UserMapper;
import ubtms.module.user.dto.PlayerDataDto;
import ubtms.module.user.entity.PlayerData;
import ubtms.module.user.entity.User;
import ubtms.module.user.entity.UserExample;
import ubtms.module.user.entity.UserQuery;
import ubtms.module.user.service.UserService;

import java.util.List;

/**
 * Created by jinzhany on 2016/12/8.
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private PlayerDataMapper playerDataMapper;
    @Autowired
    private RoleService roleService;
    @Autowired
    private SchoolService schoolService;

    @Override
    public int updateByPrimaryKey(List<User> users) {
        for (User user : users) {
            userMapper.updateByPrimaryKeySelective(user);
        }
        return users.size();
    }

    @Override
    public boolean isUserAccountExist(String account) {
        UserExample userExample = new UserExample();
        userExample.createCriteria().andPhoneEqualTo(account);
        List<User> users = userMapper.selectByExample(userExample);
        if (users.size() > 0) {
            return true;
        }
        return false;
    }

    @Override
    public int saveUser(String headPic, String sex, String userType, String userName, String schoolName, String account, String password, String grade, String height, String weight, String shirtNum, String duty) {
        Integer schId = schoolService.selectOne(new School(schoolName)).getSchId();
        RoleExample roleExample = new RoleExample();
        roleExample.createCriteria().andSchoolIdEqualTo(schId).andRoleNameEqualTo(userType);
        Integer roleId = roleService.selectByExample(roleExample).get(0).getId();
        Byte dutyB = null;
        if (duty != null) {
            dutyB = Byte.valueOf(duty);
        }
        Byte shirtNumB = null;
        if (!shirtNum.isEmpty()) {
            shirtNumB = new Byte(shirtNum);
        }
        Float heightF = null;
        if (!height.isEmpty()) {
            heightF = Float.valueOf(height);
        }
        Float weightF = null;
        if (!weight.isEmpty()) {
            weightF = Float.valueOf(weight);
        }

        User user = new User(account, password, userName, Byte.valueOf(sex), new Byte("1"), heightF, weightF, grade, shirtNumB, dutyB, roleId, headPic);
        userMapper.insert(user);
        return 0;
    }

    @Override
    public int[] getTeamScore(Integer gameId) {
        int[] teamScore = new int[2];
        Integer team1 = playerDataMapper.sumMySchoolScore(gameId);
        Integer team2 = playerDataMapper.sumRivalScore(gameId);
        teamScore[0] = (team1==null?0:team1);
        teamScore[1] = (team2==null?0:team2);
        return teamScore;
    }

    @Override
    public PlayerData getLastData() {
        return playerDataMapper.selectLastData();
    }

    @Override
    public int savePlayData(PlayerData playerData) {
        return playerDataMapper.insert(playerData);
    }

    @Override
    public int updateMySchoolPlayerData(List<PlayerData> playerDatas) {
        for (PlayerData playerData : playerDatas) {
            playerDataMapper.updateByPrimaryKey(playerData);
        }
        return playerDatas.size();
    }

    @Override
    public int updateRivalPlayerData(Integer gameId, List<PlayerDataDto> playerDataDtos) {
        //Rival_player_data删除
        for (PlayerData playerData : playerDataDtos) {
            playerDataMapper.insert(playerData);
            int id = playerDataMapper.selectLastData().getId();
            //构建Rival_player_data数据
        }
        return playerDataDtos.size();
    }

    @Override
    public List<PlayerDataDto> getMySchoolPlayerData(Integer gameId) {
        return playerDataMapper.selectMySchoolPlayerData(gameId);
    }

    @Override
    public List<PlayerDataDto> getRivalPlayerData(Integer gameId) {
        return playerDataMapper.selectRivalPlayerData(gameId);
    }

    @Override
    public User selectOne(User user) {
        List<User> users = select(user);
        if (users.size() > 0) {
            return users.get(0);
        }
        return null;
    }

    @Override
    public List<User> select(User user) {
        return userMapper.select(user);
    }

    //根据schoolId或人员姓名查出人员
    @Override
    public List<User> selectWithRelative(LimitObjet<User> user) {
        return userMapper.selectWithRelative(user);
    }

    @Override
    public List<User> selectByUserQuery(UserQuery userQuery) {
        return userMapper.selectByUserQuery(userQuery);
    }

    @Override
    public List<User> selectBySchoolName(String schoolName) {
        return null;
    }


    @Override
    public int countWithRelative(User user) {
        return userMapper.countWithRelative(user);
    }

    @Override
    public List<User> selectByExample(UserExample userExample) {
        return userMapper.selectByExample(userExample);
    }

    @Override
    public int countByExample(UserExample userExample) {
        return userMapper.countByExample(userExample);
    }
}
