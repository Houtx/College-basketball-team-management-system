var bsTree = {
	treeData: null,
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
				newSubMenu.perssions = subMenu.list;
				newSubMenus.push(newSubMenu);
				for(var k = 0; k < subMenu.list.length; k++) {
					delete subMenu.nodes[i].list;
				}
			}
			newMenu.id = menu.id;
			newMenu.state = menu.state;
			newMenu.subMenus = newSubMenus;
			newMenus.push(newMenu);
		}
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
			backData.list = getPostTreeData(data.nodes);
			backDataList.push(backData);
		}
		return backDataList;
	},
	getPostData: function() {
		var parent1 = $('#treeview-checkable').treeview('getNode', 0);
		var nodeArray = $('#treeview-checkable').treeview('getSiblings', 0);
		nodeArray.unshift(parent1);
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
	setParentUnchecked: function() {
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
		setParentUnchecked(parentNode);
	},
	init: function() {
		var $checkableTree = $('#treeview-checkable').treeview({
			data: bsTree.treeData, //数据
			showIcon: false,
			showCheckbox: true,
			levels: 4,
			onNodeChecked: function(event, node) { //选中节点
				var selectNodes = bsTree.getNodeIdArr(node); //获取所有子节点
				debugger;
				if(selectNodes) { //子节点不为空，则选中所有子节点
					$('#treeview-checkable').treeview('checkNode', [selectNodes, {
						silent: true
					}]);
				}
				//设置所有父节点为选中状态
				bsTree.setParentChecked(node);
			},
			onNodeUnchecked: function(event, node) { //取消选中节点
				var selectNodes = bsTree.getNodeIdArr(node); //获取所有子节点
				if(selectNodes) { //子节点不为空，则取消选中所有子节点
					$('#treeview-checkable').treeview('uncheckNode', [selectNodes, {
						silent: true
					}]);
				}
				//设置所有父节点为选中状态
				bsTree.setParentUnchecked(node);
			}
		});
	}
}

var permissionMng={
	url:{
		getPermissions:'role/getPermissionsAction',
		savePermissions:'role/savePermissionsAction'
	}

}

$(function() {
	//ajax返回时调用
	$.post(permissionMng.url.getPermissions,{roleId:$('#roleId').val()},function (res) {
		debugger;
		if(res.success){
			debugger;
			bsTree.treeData = res.data;
			bsTree.init();
		}else{

		}
	},'json');
});