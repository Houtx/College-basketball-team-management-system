//存放主要交互逻辑的js代码
// javascript 模块化(package.类.方法)

var schoolDetail = {

	URL: {
		add: function() {
			return 'school/addSchool/';
		}
	},

	validator: {
		validateAll: function() {
			this.validateSchoolName();
			return true;
		},

		validateSchoolName: function(schoolName) {
			console.log("validateSchoolName");
		},

	},

	schoolAdd: {
		init: function() {
			//加载标题
		},
		fileChange: function() {
			//因为可以一次上传多个文件所以要写file.files[0]表示第一个文件
			var url = window.URL.createObjectURL(file.files[0]);
			$(imgDiv).css("background", "url(" + url + ")");
			//参考文档  https://developer.mozilla.org/en-US/docs/Using_files_from_web_applications          
			$("#headImgForm").submit();
		},

		submitForm: function() {
			$("#schoolForm").valid();
			//          if (!schoolDetail.validator.validateAll()) {
			//              //提示信息
			//              return;
			//          };
			//          $.post('school/addSchool/', $('#schoolForm').serialize(), function(result) {
			//              if (result.success) {
			//                  alert("添加成功");
			//              } else {
			//
			//              }
			//          }, 'json');
		}
	}

}