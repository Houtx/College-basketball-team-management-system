var bsTree = {
	treeData: null,

	setTreeData: function() {
		var menus = bsTree.treeData;
		var tree = new Array();
		for(var i = 0; i < menus.length; i++) {
			var menu = menus[i];
			var menuNode = new Object();
			menuNode.myId = menu.id;
			menuNode.text = menu.name;
			menuNode.state = new Object();
			if(menu.state == 1) {
				menuNode.state.checked = true;
			} else {
				menuNode.state.checked = false;
			}
			var subMenuArray = new Array();
			menuNode.nodes = subMenuArray;
			for(var j = 0; j < menu.subMenus.length; j++) {
				var subMenu = menu.subMenus[j];
				var subMenuNode = new Object();
				subMenuNode.myId = subMenu.id;
				subMenuNode.text = subMenu.name;
				subMenuNode.state = new Object();
				if(subMenu.state == 1) {
					subMenuNode.state.checked = true;
				} else {
					subMenuNode.state.checked = false;
				}
				var permissionArray = new Array();
				subMenuNode.nodes = permissionArray;
				for(var k = 0; k < subMenu.permissions.length; k++) {
					var permission = subMenu.permissions[k];
					var permissionNode = new Object();
					permissionNode.myId = permission.id;
					permissionNode.type = permission.type;
					switch(permission.type) {
						case 1:
							permissionNode.text = "增";
							break;
						case 2:
							permissionNode.text = "删";
							break;
						case 3:
							permissionNode.text = "查";
							break;
						case 4:
							permissionNode.text = "改";
							break;
					}
					permissionNode.state = new Object();
					if(permission.state == 1) {
						permissionNode.state.checked = true;
					} else {
						permissionNode.state.checked = false;
					}
					permissionArray.push(permissionNode);
				}
				subMenuArray.push(subMenuNode);
			}
			tree.push(menuNode);
		}
		bsTree.treeData = tree;
	},
	changeData: function(nodeArray) {
		var newMenus = new Array();
		for(var i = 0; i < nodeArray.length; i++) {
			var menu = nodeArray[i];
			var newMenu = new Object();
			var newSubMenus = new Array();
			for(var j = 0; j < menu.list.length; j++) {
				var subMenu = menu.list[j];
				var newSubMenu = new Object();
				newSubMenu.id = subMenu.id;
				newSubMenu.state = subMenu.state;
				newSubMenu.permissions = subMenu.list;
				newSubMenus.push(newSubMenu);
				for(var k = 0; k < newSubMenu.permissions.length; k++) {
					delete newSubMenu.permissions[k].list;
				}
			}
			newMenu.id = menu.id;
			newMenu.state = menu.state;
			newMenu.subMenus = newSubMenus;
			newMenus.push(newMenu);
		}
		return newMenus;
	},
	getTreeData: function(nodeArray) {
		if(nodeArray == null) {
			return null;
		}
		var backDataList = new Array();
		for(var i = 0; i < nodeArray.length; i++) {
			var data = nodeArray[i];
			var backData = new Object();
			backData.id = data.myId;
			backData.state = data.state.checked == true ? 1 : 0;
			backData.list = bsTree.getTreeData(data.nodes);
			backDataList.push(backData);
		}
		return backDataList;
	},
	getPostData: function() {
		var parent1 = $('#treeview-checkable').treeview('getNode', 0);
		var nodeArray = $('#treeview-checkable').treeview('getSiblings', 0);
		nodeArray.unshift(parent1);
		debugger;
		var backDataList = bsTree.getTreeData(nodeArray);
		return bsTree.changeData(backDataList);
	},
	getNodeIdArr: function(node) {
		var ts = [];
		if(node.nodes) {
			for(x in node.nodes) {
				ts.push(node.nodes[x].nodeId)
				if(node.nodes[x].nodes) {
					var getNodeDieDai = bsTree.getNodeIdArr(node.nodes[x]);
					for(j in getNodeDieDai) {
						ts.push(getNodeDieDai[j]);
					}
				}
			}
		}
		return ts;
	},
	setParentChecked: function(node) {
		var parentNodeId = node.parentId;
		if(typeof(parentNodeId) == "undefined")
			return;
		var parentNode = $('#treeview-checkable').treeview('getParent', node);
		$('#treeview-checkable').treeview('checkNode', [parentNode, {
			silent: true
		}]);
		bsTree.setParentChecked(parentNode);
	},
	setParentUnchecked: function(node) {
		var parentNode = $('#treeview-checkable').treeview('getParent', node);
		if(typeof(parentNode) == "undefined")
			return;
		var siblings = $('#treeview-checkable').treeview('getSiblings', node);
		var allUnchecked = true;
		for(var i = 0; i < siblings.length; i++) {
			if(siblings[i].state.checked == true) {
				allUnchecked = false;
				break;
			}
		}
		if(allUnchecked == false) {
			return;
		}

		$('#treeview-checkable').treeview('uncheckNode', [parentNode, {
			silent: true
		}]);
		bsTree.setParentUnchecked(parentNode);
	},
	init: function(data) {
		bsTree.treeData = data;
		bsTree.setTreeData();
		var $checkableTree = $('#treeview-checkable').treeview({
			data: bsTree.treeData, //数据
			showIcon: false,
			showCheckbox: true,
			levels: 2,
			onNodeChecked: function(event, node) { //选中节点
				if(typeof(node.type) != "undefined" && node.type != "1") {
					var siblings = $('#treeview-checkable').treeview('getSiblings', node.nodeId);
					for(sibing in siblings) {
						if(sibling.type == "1") {
							$('#treeview-checkable').treeview('checkNode', [sibling.nodeId, {
								silent: true
							}]);
							break;
						}
					}
				}

				var selectNodes = bsTree.getNodeIdArr(node); //获取所有子节点
				if(selectNodes) { //子节点不为空，则选中所有子节点
					$('#treeview-checkable').treeview('checkNode', [selectNodes, {
						silent: true
					}]);
				}
				//设置所有父节点为选中状态
				bsTree.setParentChecked(node);
			},
			onNodeUnchecked: function(event, node) { //取消选中节点
				if(typeof(node.type) != "undefined" && node.type == "1") {
					var siblings = $('#treeview-checkable').treeview('getSiblings', node.nodeId);
					$('#treeview-checkable').treeview('uncheckNode', [siblings, {
						silent: true
					}]);
				}

				var selectNodes = bsTree.getNodeIdArr(node); //获取所有子节点
				if(selectNodes) { //子节点不为空，则取消选中所有子节点
					$('#treeview-checkable').treeview('uncheckNode', [selectNodes, {
						silent: true
					}]);
				}
				//设置所有父节点为取消勾选状态
				bsTree.setParentUnchecked(node);
			}
		});
	}
}

var permissionMng = {
	url: {
		getPermissions: 'role/getPermissionsAction',
		savePermissions: 'role/savePermissionsAction'
	},

	savePerssion: function() {
		var menus = bsTree.getPostData();
		debugger;
		$.ajax({
			type: "post",
			url: permissionMng.url.savePermissions,
			dataType: "json",
			contentType: "application/json;charset=utf-8",
			data: JSON.stringify(menus),
			success: function(data, status) {
				debugger;
			}

		});

		// $.post(permissionMng.url.savePermissions,JSON.stringify(menus),function (res) {
		// 	debugger;
		// 	if(res.success){
		// 		alert("保存成功");
		// 	}else{
		//
		// 	}
		// },'json');
	}
}

$(function() {
	//ajax返回时调用
	$.post(permissionMng.url.getPermissions, {
		roleId: $('#roleId').val()
	}, function(res) {
		if(res.success) {
			bsTree.init(res.data);
		} else {

		}
	}, 'json');
});