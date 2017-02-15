package ubtms.module.role.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ubtms.module.role.dao.PermissionMapper;
import ubtms.module.role.entity.Permission;
import ubtms.module.role.service.PermissionService;

import javax.websocket.server.ServerEndpoint;
import java.util.List;

/**
 * Created by jinzhany on 2017/2/12.
 */
@Service
public class PermissionServiceImpl implements PermissionService {
    @Autowired
    PermissionMapper permissionMapper;

    @Override
    public int saveAll(List<Permission> permissions) {
        for (Permission permission : permissions) {
            save(permission);
        }
        return permissions.size();
    }

    @Override
    public int save(Permission permission) {
        return permissionMapper.insert(permission);
    }
}
