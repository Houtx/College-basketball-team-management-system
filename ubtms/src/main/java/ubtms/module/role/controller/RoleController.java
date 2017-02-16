package ubtms.module.role.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import ubtms.basic.dto.MngResult;
import ubtms.basic.entity.LimitObjet;
import ubtms.basic.util.PermissionUtil;
import ubtms.module.role.entity.*;
import ubtms.module.role.service.RoleService;
import ubtms.module.school.entity.School;
import ubtms.module.school.service.SchoolService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by jinzhany on 2017/1/10.
 */
@Controller
@RequestMapping("/role")
public class RoleController {
    @Autowired
    RoleService roleService;
    @Autowired
    SchoolService schoolService;

    @RequestMapping("/roleMngPage")
    public String roleMngPage(HttpServletRequest request, Model model) {
        String loginUser = (String) request.getSession().getAttribute("loginUser");
        if (!loginUser.equals("admin")) {
            School school = (School) request.getSession().getAttribute("loginSchool");
             model.addAttribute("loginSchoolName",school.getSchName());
        }else {
            model.addAttribute("loginSchoolName","系统");
        }
        if (request.getSession().getAttribute("roleEditP") == null) {
            List<Menu> menus = (List<Menu>) request.getSession().getAttribute("menus");
            int[] perssions = PermissionUtil.getPermission(menus, "角色管理");
            request.getSession().setAttribute("roleEditP", perssions[3]);
        }
        return "/role/roleMng";
    }
    
    @RequestMapping("/roleGetAction")
    @ResponseBody
    public MngResult<List<Role>> getSchools(int limit, int offset, String roleName, String state,String schoolName) {
        RoleExample roleExample = new RoleExample();
        roleExample.setLimit(limit);
        roleExample.setOffset(offset);
        try {
            roleName = new String(roleName.getBytes("ISO-8859-1"), "UTF-8");
            schoolName = new String(schoolName.getBytes("ISO-8859-1"), "UTF-8");

            School school = schoolService.selectOne(new School(schoolName));
            if (!schoolName.isEmpty() && school==null) {
                return new MngResult<List<Role>>(true, new ArrayList<Role>(),0);
            }

            int schId=0;
            if (school != null) {
                schId=school.getSchId();
            }

            roleExample.createCriteria();
            if (schId > 0) {
                roleExample.getOredCriteria().get(0).andSchoolIdEqualTo(schId);
            }
            if (!state.equals("2")){
                roleExample.getOredCriteria().get(0).andStatedEqualTo(new Byte(state));
            }
            if (!roleName.isEmpty()) {
                roleExample.getOredCriteria().get(0).andRoleNameEqualTo(roleName);
            }
            List<Role> roles = roleService.selectByExample(roleExample);

            roleExample.setLimit(null);
            roleExample.setOffset(null);
            MngResult<List<Role>> result = new MngResult<List<Role>>(true, roles, roleService.countByExample(roleExample));
            return result;
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return new MngResult<List<Role>>(false,"系统异常");
        }
    }


    @RequestMapping("/permissionMngPage")
    public String permissionMngPage(HttpServletRequest request, Model model) {
        model.addAttribute("type", request.getParameter("type"));
        model.addAttribute("roleId", request.getParameter("id"));
        return "/role/permissionMng";
    }

    @RequestMapping(value = "/savePermissionsAction")
    @ResponseBody
    public Map<String, Object> savePermissionsAction(@RequestBody List<Menu> menus) {
        roleService.updatePermissionCascade(menus);
        return null;
    }

    @RequestMapping("/getPermissionsAction")
    @ResponseBody
    public Map<String,Object> getPermissions(HttpServletRequest request, HttpServletResponse response, Model model) {
        Map<String, Object> map = new HashMap<String, Object>();
        String roleId = request.getParameter("roleId");
        Role role = roleService.selectByPrimaryKey(Integer.valueOf(roleId));
        List<Menu> menus = role.getMenus();
        for (Menu menu : menus) {
            menu.setRole(null);
            for (SubMenu subMenu:menu.getSubMenus()) {
                subMenu.setMenu(null);
                for (Permission permission:subMenu.getPermissions()){
                    permission.setSubMenu(null);
                }
            }
        }
        map.put("success", true);
        map.put("data", menus);
        //response.setCharacterEncoding("utf-8");
        return map;
    }
}
