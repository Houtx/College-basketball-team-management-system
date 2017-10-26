package ubtms.basic.util;

import ubtms.module.role.entity.Menu;
import ubtms.module.role.entity.Permission;
import ubtms.module.role.entity.SubMenu;

import java.util.List;

/**
 * Created by jinzhany on 2017/2/11.
 */
public class PermissionUtil {
    public static int[]  getPermission(List<Menu> menus,String subMenuName){
        int[] perssionArray =new int[5];
        for (int i=0;i<menus.size();i++) {
            Menu menu = menus.get(i);
            List<SubMenu> subMenus = menu.getSubMenus();
            for (int j=0;j < subMenus.size();j++) {
                SubMenu subMenu = subMenus.get(j);
                if(subMenu.getName().equals(subMenuName)){
                    List<Permission> permissions = subMenu.getPermissions();
                    for (int k=0;k < permissions.size();k++) {
                        Permission permission = permissions.get(k);
                        perssionArray[permission.getType()]=permission.getState();
                    }
                }
            }
        }
        return perssionArray;
    }
}
