package ubtms.module.user.entity;

import ubtms.module.role.entity.Role;
import ubtms.module.role.service.RoleService;
import ubtms.module.role.service.impl.RoleServiceImpl;
import ubtms.module.school.entity.School;
import ubtms.module.school.service.SchoolService;
import ubtms.module.school.service.impl.SchoolServiceImpl;

/**
 * Created by jinzhany on 2017/2/19.
 */
public class UserDto extends User {
    private String schoolName;
    private String roleName;


    public UserDto(User user){
        RoleService roleService = new RoleServiceImpl();
        SchoolService schoolService = new SchoolServiceImpl();
        Role role = roleService.selectByPrimaryKey(user.getRoleId());
        this.roleName = role.getRoleName();
        this.schoolName = schoolService.selectOne(new School(role.getSchoolId())).getSchName();
    }

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }
}
