<%--
  Created by IntelliJ IDEA.
  User: Noah
  Date: 2017/6/12
  Time: 21:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@page isELIgnored="false" %>
<form class="form-horizontal" role="form" action="/ghgh/workSync/edited.action" method="post">
    <div class="form-group hide">
        <label for="id" class="col-sm-2 control-label">ID</label>

        <div class="col-sm-10">
            <input type="text" class="form-control" id="id" name="id" value="${map.N_ID}"/>
        </div>
    </div>
    <div class="form-group">
        <label for="name" class="col-sm-2 control-label">NAME</label>

        <div class="col-sm-10">
            <input type="text" class="form-control" id="name" name="name" value="${map.VC_NAME}"/>
        </div>
    </div>
    <div class="form-group">
        <label for="like" class="col-sm-2 control-label">LIKE</label>

        <div class="col-sm-10">
            <input type="text" class="form-control" id="like" name="like" value="${map.VC_LIKE}"/>
        </div>
    </div>
    <div class="form-group">
        <label for="note" class="col-sm-2 control-label">NOTE</label>

        <div class="col-sm-10">
            <input type="text" class="form-control" id="note" name="note" value="${map.VC_NOTE}"/>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-primary">Save</button>
            <button type="button" id="cancel" class="btn btn-default">Cancel</button>
        </div>
    </div>
</form>
<script type="text/javascript">
    $(document).ready(function () {
        $("#cancel").on('click', function () {
            $("#myModal").modal('hide');

        });
    });
</script>