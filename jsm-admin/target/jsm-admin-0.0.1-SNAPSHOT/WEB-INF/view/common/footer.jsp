<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 			</div>
 			</div>
        </div>
    </div>
    <script src="${path }/static/js/jquery.min.js-v=2.1.4"></script>
    <script src="${path }/static/js/bootstrap.min.js-v=3.3.5"></script>
    <script src="${path }/static/js/plugins/peity/jquery.peity.min.js"></script>
    <script src="${path }/static/js/content.min.js-v=1.0.0"></script>
    <script src="${path }/static/js/demo/peity-demo.min.js"></script>
    <script src="${path }/static/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
    <script src="${path }/static/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
    <script src="${path }/static/js/plugins/layer/layer.js"></script>
    <script src="${path }/static/js/tools.js"></script>
    <script src="${path }/static/js/plugins/treeview/bootstrap-treeview.js"></script>
    <script src="${path }/static/js/demo/treeview-demo.min.js"></script>
	<script src="${path }/static/plugins/laydate/laydate.js"></script>
	<script src="${path }/static/js/jquery.jqprint-0.3.js"></script>
    <script type="text/javascript">
    
    var file_upload_url = "http://120.78.143.53/file/upload/";
    
    Date.prototype.format = function(format) {
        var date = {
               "M+": this.getMonth() + 1,
               "d+": this.getDate(),
               "h+": this.getHours(),
               "m+": this.getMinutes(),
               "s+": this.getSeconds(),
               "q+": Math.floor((this.getMonth() + 3) / 3),
               "S+": this.getMilliseconds()
        };
        if (/(y+)/i.test(format)) {
               format = format.replace(RegExp.$1, (this.getFullYear() + '').substr(4 - RegExp.$1.length));
        }
        for (var k in date) {
               if (new RegExp("(" + k + ")").test(format)) {
                      format = format.replace(RegExp.$1, RegExp.$1.length == 1
                             ? date[k] : ("00" + date[k]).substr(("" + date[k]).length));
               }
        }
        return format;
 	}
    var notNull = function(val){
    	if(val==null || $.trim(val)=='') return false;
    	return true;
    }
    
    var showImgInfo = function(img){
    	window.open(img);
    };
	</script>
</body>
</html>