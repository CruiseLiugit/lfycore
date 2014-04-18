<%@ page pageEncoding="UTF-8"%>


    <div region="center" style="width: 500px; height: 300px; padding: 1px;overflow-y: hidden">
        <div id="grid" fit="true">
        </div>
    </div>
    <div id="edit-window" title="编辑窗口" style="width: 900px; height: 800px;">
       
    </div>
    <div id="search-window" title="查询窗口" style="width: 350px; height: 200px;">
        <div style="padding: 20px 20px 40px 80px;">
        <form method="post">
            <table>
                <tr>
                    <td>登录名：</td>
                    <td>
                        <input name="s_title" id="s_title" style="width: 150px;" />
                    </td>
                </tr>
            </table>
            </form>
        </div>
        <div style="text-align: center; padding: 5px;">
        	<a href="javascript:void(0)" onclick="SearchOK()" id="btn-search" icon="icon-ok">确定</a>
        	<a href="javascript:void(0)" onclick="closeSearchWindow()" id="btn-search-cancel" icon="icon-cancel">取消</a>
        </div>
    </div>

