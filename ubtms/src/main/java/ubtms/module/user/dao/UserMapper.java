package ubtms.module.user.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import ubtms.basic.entity.LimitObjet;
import ubtms.module.user.entity.User;
import ubtms.module.user.entity.UserExample;

public interface UserMapper {
    List<User> selectWithRelative(LimitObjet<User> user);
    int countWithRelative(User user);

    int countByExample(UserExample example);

    int deleteByExample(UserExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    List<User> selectByExampleWithBLOBs(UserExample example);

    List<User> selectByExample(UserExample example);

    User selectByPrimaryKey(Integer id);

    List<User> select(User user);

    int updateByExampleSelective(@Param("record") User record, @Param("example") UserExample example);

    int updateByExampleWithBLOBs(@Param("record") User record, @Param("example") UserExample example);

    int updateByExample(@Param("record") User record, @Param("example") UserExample example);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKeyWithBLOBs(User record);

    int updateByPrimaryKey(User record);
}