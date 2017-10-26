package ubtms.module.user.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ubtms.basic.entity.LimitObjet;
import ubtms.module.role.entity.RoleExample;
import ubtms.module.role.service.RoleService;
import ubtms.module.school.entity.School;
import ubtms.module.school.service.SchoolService;
import ubtms.module.user.dao.PlayerDataMapper;
import ubtms.module.user.dao.RivalPlayerDataMapper;
import ubtms.module.user.dao.UserMapper;
import ubtms.module.user.dto.PlayerDataDto;
import ubtms.module.user.entity.*;
import ubtms.module.user.service.UserService;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

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
    private RivalPlayerDataMapper rivalPlayerDataMapper;
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
    public Map<String, Object> userLoginValidate(User user) {
        Map<String, Object> map = new HashMap<String, Object>();
        if (!isUserAccountExist(user.getPhone())) {
            map.put("success", false);
            map.put("msg", "账号或密码错误");
            return map;
        }

        user = selectOne(user);
        if (user == null) {
            map.put("success", false);
            map.put("msg", "账号或密码错误");
            return map;
        }
        if (user.getState() == 0) {
            map.put("success", false);
            map.put("msg", "账号已被禁用");
            return map;
        }

        map.put("success", true);
        map.put("msg", "验证成功");
        return map;
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
        return 1;
    }

    @Override
    public int updateUser(String userId, String headPic, String sex, String userName, String grade, String height, String weight, String shirtNum, String duty) {

        Byte dutyB = null;
        if (duty != null) {
            dutyB = Byte.valueOf(duty);
        }
        Byte shirtNumB = null;
        if (shirtNum != null && !shirtNum.isEmpty()) {
            shirtNumB = new Byte(shirtNum);
        }
        Float heightF = 0f;
        if (height != null && !height.isEmpty()) {
            heightF = Float.valueOf(height);
        }
        Float weightF = 0f;
        if (weight != null && !weight.isEmpty()) {
            weightF = Float.valueOf(weight);
        }
        User user = new User();
        user.setHeadPic(headPic);
        user.setRealName(userName);
        user.setDuty(dutyB);
        user.setShirtNum(shirtNumB);
        user.setHeight(heightF);
        user.setWeight(weightF);
        user.setId(Integer.valueOf(userId));
        user.setSex(new Byte(sex));
        userMapper.updateByPrimaryKeySelective(user);
        return 1;
    }

    @Override
    public int[] getTeamScore(Integer gameId) {
        int[] teamScore = new int[2];
        Integer team1 = playerDataMapper.sumMySchoolScore(gameId);
        Integer team2 = playerDataMapper.sumRivalScore(gameId);
        teamScore[0] = (team1 == null ? 0 : team1);
        teamScore[1] = (team2 == null ? 0 : team2);
        return teamScore;
    }

    @Override
    public PlayerData getLastData() {
        return playerDataMapper.selectLastData();
    }

    @Override
    public PlayerDataDto getAVGDataDetail(String userId) {
        PlayerDataQuery playerDataQuery = new PlayerDataQuery();
        playerDataQuery.setUserId(Integer.valueOf(userId));
        return playerDataMapper.selectAVGData(playerDataQuery).get(0);
    }

    @Override
    public int countAVGData(String schName, String userName) {
        PlayerDataQuery playerDataQuery = new PlayerDataQuery();
        if (!schName.isEmpty()) {
            playerDataQuery.setSchName(schName);
        }
        if (!userName.isEmpty()) {
            playerDataQuery.setUserName(userName);
        }
        return playerDataMapper.countAVGData(playerDataQuery);
    }

    @Override
    public List<PlayerDataDto> getAVGDataMng(int limit, int offset, String schName, String userName) {
        PlayerDataQuery playerDataQuery = new PlayerDataQuery();
        playerDataQuery.setLimit(limit);
        playerDataQuery.setOffset(offset);
        if (!schName.isEmpty()) {
            playerDataQuery.setSchName(schName);
        }
        if (!userName.isEmpty()) {
            playerDataQuery.setUserName(userName);
        }
        return playerDataMapper.selectAVGData(playerDataQuery);
    }

    @Override
    public int savePlayData(PlayerData playerData) {
        return playerDataMapper.insert(playerData);
    }

    @Override
    public int updateMySchoolPlayerData(List<PlayerDataDto> playerDatas) {
        for (PlayerData playerData : playerDatas) {
            playerDataMapper.updateByPrimaryKey(playerData);
        }
        return playerDatas.size();
    }

    @Override
    public int updateRivalPlayerData(Integer gameId, List<PlayerDataDto> playerDataDtos) {
        //Rival_player_data删除
        RivalPlayerDataExample rivalPlayerDataExample = new RivalPlayerDataExample();
        rivalPlayerDataExample.createCriteria().andGameIdEqualTo(gameId);
        List<RivalPlayerData> rivalPlayerDataList = rivalPlayerDataMapper.selectByExample(rivalPlayerDataExample);

        for (RivalPlayerData rivalPlayerData : rivalPlayerDataList) {
            playerDataMapper.deleteByPrimaryKey(rivalPlayerData.getDataId());
            rivalPlayerDataMapper.deleteByPrimaryKey(rivalPlayerData.getId());
        }

        for (PlayerDataDto playerDataDto : playerDataDtos) {
            RivalPlayerData rivalPlayerData = new RivalPlayerData();
            rivalPlayerData.setPlayerName(playerDataDto.getPlayerName());
            rivalPlayerData.setDuty(playerDataDto.getDuty());
            rivalPlayerData.setShirtNum(playerDataDto.getShirtNum());
            rivalPlayerData.setGameId(gameId);
            PlayerData playerData = playerDataDto;
            playerDataMapper.insert(playerData);
            int dataId = playerDataMapper.selectLastData().getId();
            rivalPlayerData.setDataId(dataId);
            rivalPlayerDataMapper.insert(rivalPlayerData);
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
    public List<PlayerDataDto> getPlayerDataLineData(String userId, String time) throws ParseException {
            PlayerDataQuery playerDataQuery = new PlayerDataQuery();
            playerDataQuery.setUserId(Integer.valueOf(userId));
            if (!time.isEmpty()) {
                Calendar ca = Calendar.getInstance();
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
                ca.setTime(sdf.parse(time));   //设置时间为当前时间
                ca.add(Calendar.YEAR, 1); //年份增减
                Date endTime = ca.getTime(); //结果
                playerDataQuery.setStartTime(sdf.parse(time));
                playerDataQuery.setEndTime(endTime);
            }
        List<PlayerDataDto> playerDataList = playerDataMapper.selectByUserIdAndTime(playerDataQuery);
        return playerDataList;
    }

    @Override
    public int delUser(List<User> users) {
        for (User user : users) {
            userMapper.deleteByPrimaryKey(user.getId());
        }
        return users.size();
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
    public Map<String, Object> updatePsw(String userId, String oldPsw, String newPsw) {
        Map<String, Object> map = new HashMap<String, Object>();
        User oldeUser = this.selectOne(new User(Integer.valueOf(userId)));
        if (!oldeUser.getPassword().equals(oldPsw)) {
            map.put("success", false);
            map.put("msg", "原始密码错误");
            return map;
        }
        User user = new User();
        user.setId(Integer.valueOf(userId));
        user.setPassword(newPsw);
        userMapper.updateByPrimaryKeySelective(user);
        map.put("success", true);
        map.put("msg", "修改成功");
        return map;
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
    public List<UserDto> selectByUserQueryMng(UserQuery userQuery) {
        return userMapper.selectByUserQueryMng(userQuery);
    }

    @Override
    public List<User> selectBySchoolName(String schoolName) {
        return userMapper.selectBySchoolName(schoolName);
    }

    @Override
    public int countUserMng(UserQuery userQuery) {
        return userMapper.countByUserQueryMng(userQuery);
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
