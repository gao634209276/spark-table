

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@page isELIgnored="false" %>
<html lang="zh-CN">
<head>
    <!--bootstrap.min.css 3.2.0
        bootstrap.min.js 3.2.0
        jquery 1.11.3
        ...
     -->
    <title>data list</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/ghgh/mycss/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="/ghgh/mycss/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
    <link href="/ghgh/mycss/bootstrapValidator.min.css" rel="stylesheet" media="screen">
    <link href="/ghgh/mycss/bootstrap-table.min.css" rel="stylesheet" media="screen">

    <script type="text/javascript" src="/ghgh/myjs/modal.js"></script>
</head>
<style type="text/css">
    .ml10 {
        margin-left: 10px;
    }
</style>
<body>
<script type="text/javascript">
</script>
<div class="container">
    <div class="alert alert-success" role="alert">
        <a href="#" class="alert-link">${logStr}</a>
    </div>
    <!-- toolbar-->
    <div id="toolbar" class="btn-group">
        <button type="button" class="btn btn-default" id="save">
            <i class="glyphicon glyphicon-plus"></i>
        </button>
        <button type="button" class="btn btn-default">
            <i class="glyphicon glyphicon-trash"></i>
        </button>
    </div>
    <!-- table list-->
    <table id="table"
           data-toggle="table"
           data-height="550"
           data-url="/ghgh/workSync/getJson.action"
           data-search="true"
           data-pagination="true"
           data-show-refresh="true"
           data-show-toggle="true"
           data-show-columns="true"
           data-striped="true"
           data-toolbar="#toolbar">
        <thead>
        <tr>
            <th data-field="N_ID">ID</th>
            <th data-field="VC_NAME">NAME</th>
            <th data-field="VC_LIKE">LIKE</th>
            <th data-field="VC_NOTE">NOTE</th>
            <th data-field="N_ID" data-events="actionEvents" data-formatter="actionFormatter">ACTION</th>
        </tr>
        </thead>
    </table>
    <!-- table list-->

    <!-- edit modal-->
    <div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content" id="content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="exampleModalLabel">Edit Data</h4>
                </div>
                <div class="modal-body" id="editBody">
                </div>
            </div>
        </div>
    </div>
    <!-- edit modal-->
    <!-- save modal-->
    <div id="saveModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content" id="content1">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="exampleModalLabel1">Edit Data</h4>
                </div>
                <div class="modal-body" id="editBody1">
                </div>
            </div>
        </div>
    </div>
    <!-- save modal-->
</div>
<script type="text/javascript" src="/ghgh/myjs/jquery-1.11.3.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="/ghgh/myjs/bootstrap.min.js"></script>
<script type="text/javascript" src="/ghgh/myjs/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="/ghgh/myjs/bootstrapValidator.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="/ghgh/myjs/locales/bootstrap-datetimepicker.zh-CN.js"
        charset="UTF-8"></script>

<script type="text/javascript" src="/ghgh/myjs/bootstrap-table.js"></script>
<script type="text/javascript" src="/ghgh/myjs/bootstrap-table-export.js"></script>
<script type="text/javascript" src="/ghgh/myjs/tableExport.js"></script>
<script type="text/javascript" src="/ghgh/myjs/jquery.base64.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#save").on('click', function () {
            $("#editBody1").load("/ghgh/workSync/edit.action?id=null", function (response, status, xhr) {
                $("#saveModal").modal('show');
            });
        });
    });
</script>
<script>
    function actionFormatter(value, row, index) {
        return ['<a class="edit ml10" href="javascript:void(0)" title="Edit">',
            '<i class="glyphicon glyphicon-edit"></i>',
            '</a>',
            '<a class="remove ml10" href="javascript:void(0)" title="Remove">',
            '<i class="glyphicon glyphicon-remove"></i>',
            '</a>'
        ].join('');
    }

    window.actionEvents = {
        'click .edit': function (e, value, row, index) {
            //edit
            var id = value;
            $("#editBody").load('/ghgh/workSync/edit.action?id=' + id, function (response, status, xhr) {
                $('#myModal').modal('show');
            });
        },
        'click .remove': function (e, value, row, index) {
            //remove
            if (confirm("You sure remove it?")) {
                $.ajax({
                    type: "POST",
                    url: "/ghgh/workSync/remove.action",
                    data: {id: value}
                }).done(function (msg) {
                    if (msg == 1) {
                        alert("Data Removed Success");
                        $('#table').bootstrapTable('refresh');
                    } else {
                        alert("Data Removed Error");
                    }
                });
            }
        },
    };
</script>
</body>
</html>