define(["jquery", "tableSelect", "ckeditor"], function () {

    let $ = layui.jquery,
        tableSelect = layui.tableSelect,
        form = layui.form,
        layer = layui.layer,
        table = layui.table,
        laydate = layui.laydate,
        upload = layui.upload,
        element = layui.element,
        laytpl = layui.laytpl,
        util = layui.util;

    layer.config({
        skin: 'layui-layer-easy'
    });

    let init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        upload_url: 'ajax/upload',
        upload_exts: 'doc|gif|ico|icon|jpg|mp3|mp4|p12|pem|png|rar',
    };

    let admin = {
        config: {
            shade: [0.02, '#000'],
        },
        url: function (url) {
            return '/' + window.CONFIG.ADMIN + '/' + url;
        },
        headers: function () {
            return {'X-CSRF-TOKEN': window.CONFIG.CSRF_TOKEN};
        },
        //js版empty，判断变量是否为空
        empty: function (r) {
            let n, t, f = [void 0, null, !1, 0, "", "0"], e = f.length;
            for (t = 0; t < e; t++) if (r === f[t]) return !0;
            if (typeof r === 'object') {
                for (n in r) if (r.hasOwnProperty(n)) return !1;
                return !0
            }
            return !1
        },
        checkAuth: function (node, elem) {
            return window.CONFIG.IS_SUPER_ADMIN || $(elem).attr('data-auth-' + node) === '1';
        },
        param: function (param, defaultParam) {
            return param !== undefined ? param : defaultParam;
        },
        request: {
            post: function (option, ok, no, ex) {
                return admin.request.ajax('post', option, ok, no, ex);
            },
            get: function (option, ok, no, ex) {
                return admin.request.ajax('get', option, ok, no, ex);
            },
            ajax: function (type, option, ok, no, ex) {
                type = type || 'get';
                let defaultOption = {
                    url: '',
                    data: {},
                    prefix: false,
                    statusName: 'code',
                    statusCode: 1,
                    ok: function (res) {
                    },
                    no: function (res) {
                        let msg = res.msg === undefined ? '返回数据格式有误' : res.msg
                        admin.msg.error(msg)
                        return false
                    },
                    ex: function (res) {
                    }
                }
                option = Object.assign({}, defaultOption, option || {})
                if (option.url === '') {
                    admin.msg.error('请求地址不能为空');
                    return false;
                }
                if (!!option.prefix) {
                    option.url = admin.url(option.url);
                }
                let index = admin.msg.loading('加载中');
                $.ajax({
                    url: option.url,
                    type: type,
                    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                    dataType: "json",
                    headers: admin.headers(),
                    data: option.data,
                    timeout: 60000,
                    success: function (res) {
                        admin.msg.close(index);
                        return eval('res.' + option.statusName) === option.statusCode ? ok(res) : no(res)
                    },
                    error: function (xhr, textstatus, thrown) {
                        admin.msg.error('Status:' + xhr.status + '，' + xhr.statusText + '，请稍后再试！', function () {
                            ex(this);
                        });
                        return false;
                    },
                    complete: function () {
                        // @todo 刷新csrf-token
                    }
                });
            }
        },
        common: {
            parseNodeStr: function (node) {
                let array = node.split('/');
                $.each(array, function (key, val) {
                    if (key === 0) {
                        val = val.split('.');
                        $.each(val, function (i, v) {
                            val[i] = admin.common.humpToLine(v.replace(v[0], v[0].toLowerCase()));
                        });
                        val = val.join(".");
                        array[key] = val;
                    }
                });
                return array.join("/");
            },
            lineToHump: function (name) {
                return name.replace(/\_(\w)/g, function (all, letter) {
                    return letter.toUpperCase();
                });
            },
            humpToLine: function (name) {
                return name.replace(/([A-Z])/g, "_$1").toLowerCase();
            },
        },
        msg: {
            // 成功消息
            success: function (msg, callback) {
                return layer.msg(msg, {
                    icon: 1,
                    shade: admin.config.shade,
                    scrollbar: false,
                    time: 2000,
                    shadeClose: true
                }, callback);
            },
            // 失败消息
            error: function (msg, callback) {
                return layer.msg(msg, {
                    icon: 2,
                    shade: admin.config.shade,
                    scrollbar: false,
                    time: 3000,
                    shadeClose: true
                }, callback);
            },
            // 警告消息框
            alert: function (msg, callback) {
                return layer.alert(msg, {end: callback, scrollbar: false});
            },
            // 对话框
            confirm: function (msg, ok, no) {
                return layer.confirm(msg, {title: '操作确认', btn: ['确认', '取消']}, function (index) {
                    typeof ok === 'function' && ok.call(this);
                    layer.close(index)
                }, function (index) {
                    typeof no === 'function' && no.call(this);
                    layer.close(index);
                });
            },
            // 消息提示
            tips: function (msg, time, callback) {
                return layer.msg(msg, {
                    time: (time || 3) * 1000,
                    shade: admin.config.shade,
                    end: callback,
                    shadeClose: true
                });
            },
            // 加载中提示
            loading: function (msg, callback) {
                return msg ? layer.msg(msg, {
                    icon: 16,
                    scrollbar: false,
                    shade: admin.config.shade,
                    time: 0,
                    end: callback
                }) : layer.load(2, {time: 0, scrollbar: false, shade: admin.config.shade, end: callback});
            },
            // 关闭消息框
            close: function (index) {
                return layer.close(index);
            }
        },
        table: {
            render: function (options) {
                let defaultSearch = true, defaultInit = options.init || init, defaultOption = {
                    init: defaultInit,
                    modifyReload: true,
                    elem: defaultInit.table_elem,
                    id: defaultInit.table_render_id,
                    layFilter: defaultInit.table_render_id + '_LayFilter',
                    url: admin.url(defaultInit.index_url),
                    headers: admin.headers(),
                    page: true,
                    search: defaultSearch,
                    skin: 'line',
                    limit: 15,
                    limits: [10, 15, 20, 25, 50, 100],
                    cols: [],
                    toolbar: ['refresh', 'add', 'delete', 'export'],
                }

                options = Object.assign({}, defaultOption, options)
                options.defaultToolbar = (options.defaultToolbar === undefined && !options.search) ? ['filter', 'print', 'exports'] : ['filter', 'print', 'exports', {
                    title: '搜索',
                    layEvent: 'TABLE_SEARCH',
                    icon: 'layui-icon-search',
                    extend: 'data-table-id="' + options.id + '"'
                }];

                // 判断是否为移动端
                if (admin.checkMobile()) {
                    options.defaultToolbar = !options.search ? ['filter'] : ['filter', {
                        title: '搜索',
                        layEvent: 'TABLE_SEARCH',
                        icon: 'layui-icon-search',
                        extend: 'data-table-id="' + options.id + '"'
                    }];
                }

                // 判断元素对象是否有嵌套的
                options.cols = admin.table.formatCols(options.cols, options.init);

                // 初始化表格lay-filter
                $(options.elem).attr('lay-filter', options.layFilter);

                // 初始化表格搜索
                if (options.search) {
                    admin.table.renderSearch(options.cols, options.elem, options.id);
                }

                // 初始化表格左上方工具栏
                options.toolbar = admin.table.renderToolbar(options.toolbar, options.elem, options.id, options.init);

                // 判断是否有操作列表权限
                options.cols = admin.table.renderOperat(options.cols, options.elem);

                // 初始化表格
                let newTable = table.render(options);

                // 监听表格搜索开关显示
                admin.table.listenToolbar(options.layFilter, options.id);

                // 监听表格开关切换
                admin.table.renderSwitch(options.cols, options.init, options.id, options.modifyReload);

                // 监听表格开关切换
                admin.table.listenEdit(options.init, options.layFilter, options.id, options.modifyReload);

                return newTable;
            },
            renderToolbar: function (data, elem, tableId, init) {
                data = data || [];
                let toolbarHtml = '';
                $.each(data, function (i, v) {
                    if (typeof v === "object") {
                        $.each(v, function (ii, vv) {
                            vv.class = vv.class || '';
                            vv.icon = vv.icon || '';
                            vv.auth = vv.auth || '';
                            vv.url = vv.url || '';
                            vv.method = vv.method || 'open';
                            vv.title = vv.title || vv.text;
                            vv.text = vv.text || vv.title;
                            vv.extend = vv.extend || '';
                            vv.checkbox = vv.checkbox || false;
                            if (admin.checkAuth(vv.auth, elem)) {
                                toolbarHtml += admin.table.buildToolbarHtml(vv, tableId);
                            }
                        });
                    } else {
                        switch (v) {
                            case 'refresh':
                                toolbarHtml += '<button class="layui-btn layui-btn-sm layuimini-btn-primary" data-table-fresh="' + tableId + '"><i class="fa fa-refresh"></i> 刷新</button>';
                                break;

                            case 'add':
                                if (admin.checkAuth('add', elem)) {
                                    toolbarHtml += '<button class="layui-btn layui-btn-normal layui-btn-sm" data-open="' + init.add_url + '" data-title="添加"><i class="fa fa-plus"></i> 添加</button>';
                                }
                                break;

                            case 'delete':
                                if (admin.checkAuth('delete', elem)) {
                                    toolbarHtml += '<button class="layui-btn layui-btn-sm layui-btn-danger" data-url="' + init.delete_url + '" data-table-delete="' + tableId + '"><i class="fa fa-trash-o"></i> 删除</button>';
                                }
                                break;

                            case 'export':
                                if (admin.checkAuth('export', elem)) {
                                    toolbarHtml += '<button class="layui-btn layui-btn-sm layui-btn-success easyadmin-export-btn" data-url="' + init.export_url + '" data-table-export="' + tableId + '"><i class="fa fa-file-excel-o"></i> 导出</button>';
                                }
                        }
                    }
                });
                return '<div>' + toolbarHtml + '</div>';
            },
            renderSearch: function (cols, elem, tableId) {
                // TODO 只初始化第一个table搜索字段，如果存在多个(绝少数需求)，得自己去扩展
                cols = cols[0] || [];
                let newCols = [];
                let formHtml = '';
                $.each(cols, function (i, d) {
                    let defaultOption = {
                        field: false,
                        fieldAlias: false,
                        title: '',
                        selectList: {},
                        search: true,
                        searchTip: '',
                        searchValue: '',
                        searchOp: '%*%',
                        timeType: 'datetime',
                    }
                    d = Object.assign({}, defaultOption, d)
                    d.title = d.title || d.field
                    d.searchTip = d.searchTip || '请输入' + d.title
                    d.fieldAlias = d.fieldAlias || d.field
                    if (d.field !== false && d.search !== false) {
                        switch (d.search) {
                            case true:
                                formHtml += '\t<div class="layui-form-item layui-inline">\n' +
                                    '<label class="layui-form-label">' + d.title + '</label>\n' +
                                    '<div class="layui-input-inline">\n' +
                                    '<input id="c-' + d.fieldAlias + '" name="' + d.fieldAlias + '" data-search-op="' + d.searchOp + '" value="' + d.searchValue + '" placeholder="' + d.searchTip + '" class="layui-input">\n' +
                                    '</div>\n' +
                                    '</div>';
                                break;
                            case  'select':
                                d.searchOp = '=';
                                let selectHtml = '';
                                $.each(d.selectList, function (sI, sV) {
                                    let selected = '';
                                    if (sI === d.searchValue) {
                                        selected = 'selected=""';
                                    }
                                    selectHtml += '<option value="' + sI + '" ' + selected + '>' + sV + '</option>/n';
                                });
                                formHtml += '\t<div class="layui-form-item layui-inline">\n' +
                                    '<label class="layui-form-label">' + d.title + '</label>\n' +
                                    '<div class="layui-input-inline">\n' +
                                    '<select class="layui-select" id="c-' + d.fieldAlias + '" name="' + d.fieldAlias + '"  data-search-op="' + d.searchOp + '" >\n' +
                                    '<option value="">- 全部 -</option> \n' +
                                    selectHtml +
                                    '</select>\n' +
                                    '</div>\n' +
                                    '</div>';
                                break;
                            case 'range':
                                d.searchOp = 'range';
                                formHtml += '\t<div class="layui-form-item layui-inline">\n' +
                                    '<label class="layui-form-label">' + d.title + '</label>\n' +
                                    '<div class="layui-input-inline">\n' +
                                    '<input id="c-' + d.fieldAlias + '" name="' + d.fieldAlias + '"  data-search-op="' + d.searchOp + '"  value="' + d.searchValue + '" placeholder="' + d.searchTip + '" class="layui-input">\n' +
                                    '</div>\n' +
                                    '</div>';
                                break;
                            case 'time':
                                d.searchOp = '=';
                                formHtml += '\t<div class="layui-form-item layui-inline">\n' +
                                    '<label class="layui-form-label">' + d.title + '</label>\n' +
                                    '<div class="layui-input-inline">\n' +
                                    '<input id="c-' + d.fieldAlias + '" name="' + d.fieldAlias + '"  data-search-op="' + d.searchOp + '"  value="' + d.searchValue + '" placeholder="' + d.searchTip + '" class="layui-input">\n' +
                                    '</div>\n' +
                                    '</div>';
                                break;
                        }
                        newCols.push(d);
                    }
                });
                if (formHtml !== '') {
                    $(elem).before('<fieldset id="searchFieldset_' + tableId + '" class="table-search-fieldset layui-hide">\n' +
                        '<legend>条件搜索</legend>\n' +
                        '<form class="layui-form layui-form-pane form-search">\n' +
                        formHtml +
                        '<div class="layui-form-item layui-inline" style="margin-left: 115px">\n' +
                        '<button type="submit" class="layui-btn layui-btn-normal" data-type="tableSearch" data-table="' + tableId + '" lay-submit lay-filter="' + tableId + '_filter"> 搜 索</button>\n' +
                        '<button type="reset" class="layui-btn layui-btn-primary" data-table-reset="' + tableId + '"> 重 置 </button>\n' +
                        ' </div>' +
                        '</form>' +
                        '</fieldset>');

                    admin.table.listenTableSearch(tableId);

                    // 初始化form表单
                    form.render();
                    $.each(newCols, function (ncI, ncV) {
                        if (ncV.search === 'range') {
                            laydate.render({range: true, type: ncV.timeType, elem: '[name="' + ncV.fieldAlias + '"]'});
                        }
                        if (ncV.search === 'time') {
                            laydate.render({type: ncV.timeType, elem: '[name="' + ncV.fieldAlias + '"]'});
                        }
                    });
                }
            },
            renderSwitch: function (cols, tableInit, tableId, modifyReload) {
                tableInit.modify_url = tableInit.modify_url || false;
                cols = cols[0] || {};
                tableId = tableId || init.table_render_id;
                if (cols.length > 0) {
                    $.each(cols, function (i, v) {
                        v.filter = v.filter || false;
                        if (v.filter !== false && tableInit.modify_url !== false) {
                            admin.table.listenSwitch({
                                filter: v.filter,
                                url: tableInit.modify_url,
                                tableId: tableId,
                                modifyReload: modifyReload
                            });
                        }
                    });
                }
            },
            renderOperat(data, elem) {
                for (let dk in data) {
                    let col = data[dk];
                    let operat = col[col.length - 1].operat;
                    if (operat !== undefined) {
                        let check = false;
                        for (let key in operat) {
                            let item = operat[key];
                            if (typeof item === 'string') {
                                if (admin.checkAuth(item, elem)) {
                                    check = true;
                                    break;
                                }
                            } else {
                                for (let k in item) {
                                    let v = item[k];
                                    if (v.auth !== undefined && admin.checkAuth(v.auth, elem)) {
                                        check = true;
                                        break;
                                    }
                                }
                            }
                        }
                        if (!check) {
                            data[dk].pop()
                        }
                    }
                }
                return data;
            },
            buildToolbarHtml: function (toolbar, tableId) {
                toolbar.class = toolbar.class || '';
                toolbar.icon = toolbar.icon || '';
                toolbar.auth = toolbar.auth || '';
                toolbar.url = toolbar.url || '';
                toolbar.extend = toolbar.extend || '';
                toolbar.method = toolbar.method || 'open';
                toolbar.field = toolbar.field || 'id';
                toolbar.title = toolbar.title || toolbar.text;
                toolbar.text = toolbar.text || toolbar.title;
                toolbar.checkbox = toolbar.checkbox || false;

                let formatToolbar = toolbar;
                formatToolbar.icon = formatToolbar.icon !== '' ? '<i class="' + formatToolbar.icon + '"></i> ' : '';
                formatToolbar.class = formatToolbar.class !== '' ? 'class="' + formatToolbar.class + '" ' : '';
                if (toolbar.method === 'open') {
                    formatToolbar.method = formatToolbar.method !== '' ? 'data-open="' + formatToolbar.url + '" data-title="' + formatToolbar.title + '" ' : '';
                } else if (toolbar.method === 'none') { // 常用于与extend配合，自定义监听按钮
                    formatToolbar.method = '';
                } else {
                    formatToolbar.method = formatToolbar.method !== '' ? 'data-request="' + formatToolbar.url + '" data-title="' + formatToolbar.title + '" ' : '';
                }
                formatToolbar.checkbox = toolbar.checkbox ? ' data-checkbox="true" ' : '';
                formatToolbar.tableId = tableId !== undefined ? ' data-table="' + tableId + '" ' : '';
                return '<button ' + formatToolbar.class + formatToolbar.method + formatToolbar.extend + formatToolbar.checkbox + formatToolbar.tableId + '>' + formatToolbar.icon + formatToolbar.text + '</button>';
            },
            buildOperatHtml: function (operat) {
                operat.class = operat.class || '';
                operat.icon = operat.icon || '';
                operat.auth = operat.auth || '';
                operat.url = operat.url || '';
                operat.extend = operat.extend || '';
                operat.method = operat.method || 'open';
                operat.field = operat.field || 'id';
                operat.title = operat.title || operat.text;
                operat.text = operat.text || operat.title;

                let formatOperat = operat;
                formatOperat.icon = formatOperat.icon !== '' ? '<i class="' + formatOperat.icon + '"></i> ' : '';
                formatOperat.class = formatOperat.class !== '' ? 'class="' + formatOperat.class + '" ' : '';
                if (operat.method === 'open') {
                    formatOperat.method = formatOperat.method !== '' ? 'data-open="' + formatOperat.url + '" data-title="' + formatOperat.title + '" ' : '';
                } else if (operat.method === 'none') { // 常用于与extend配合，自定义监听按钮
                    formatOperat.method = '';
                } else {
                    formatOperat.method = formatOperat.method !== '' ? 'data-request="' + formatOperat.url + '" data-title="' + formatOperat.title + '" ' : '';
                }
                return '<a ' + formatOperat.class + formatOperat.method + formatOperat.extend + '>' + formatOperat.icon + formatOperat.text + '</a>';
            },
            toolSpliceUrl(url, field, data) {
                return url?.indexOf("?") !== -1 ? url + '&' + field + '=' + data[field] : url + '?' + field + '=' + data[field];
            },
            formatCols: function (cols, init) {
                for (let i in cols) {
                    let col = cols[i];
                    for (let index in col) {
                        let val = col[index];

                        // 判断是否包含初始化数据
                        if (val.init === undefined) {
                            cols[i][index]['init'] = init;
                        }

                        // 格式化列操作栏
                        if (val.templet === admin.table.tool && val.operat === undefined) {
                            cols[i][index]['operat'] = ['edit', 'delete'];
                        }

                        // 判断是否包含开关组件
                        if (val.templet === admin.table.switch && val.filter === undefined) {
                            cols[i][index]['filter'] = val.field;
                        }

                        // 判断是否含有搜索下拉列表
                        if (val.selectList !== undefined && val.search === undefined) {
                            cols[i][index]['search'] = 'select';
                        }

                        // 判断是否初始化对齐方式
                        if (val.align === undefined) {
                            cols[i][index]['align'] = 'center';
                        }

                        // 部分字段开启排序
                        let sortDefaultFields = ['id', 'sort'];
                        if (val.sort === undefined && sortDefaultFields.indexOf(val.field) >= 0) {
                            cols[i][index]['sort'] = true;
                        }

                        // 初始化图片高度
                        if (val.templet === admin.table.image && val.imageHeight === undefined) {
                            cols[i][index]['imageHeight'] = 40;
                        }

                        // 判断是否多层对象
                        if (val.field !== undefined && val.field.split(".").length > 1) {
                            if (val.templet === undefined) {
                                cols[i][index]['templet'] = admin.table.value;
                            }
                        }

                        // 判断是否列表数据转换
                        if (val.selectList !== undefined && val.templet === undefined) {
                            cols[i][index]['templet'] = admin.table.list;
                        }

                    }
                }
                return cols;
            },
            tool: function (data) {
                let option = data.LAY_COL;
                option.operat = option.operat || ['edit', 'delete'];
                let elem = option.init?.table_elem || init.table_elem;
                let html = '';
                $.each(option.operat, function (i, item) {
                    if (typeof item === 'string') {
                        let operat = {}
                        switch (item) {
                            case 'edit':
                                operat = {
                                    class: 'layui-btn layui-btn-success layui-btn-xs',
                                    method: 'open',
                                    field: 'id',
                                    icon: '',
                                    text: '编辑',
                                    title: '编辑信息',
                                    auth: 'edit',
                                    url: option.init?.edit_url,
                                    extend: ""
                                };
                                operat.url = admin.table.toolSpliceUrl(operat.url, operat.field, data);
                                if (admin.checkAuth(operat.auth, elem)) {
                                    html += admin.table.buildOperatHtml(operat);
                                }
                                break;
                            case 'delete':
                                operat = {
                                    class: 'layui-btn layui-btn-danger layui-btn-xs',
                                    method: 'get',
                                    field: 'id',
                                    icon: '',
                                    text: '删除',
                                    title: '确定删除？',
                                    auth: 'delete',
                                    url: option.init?.delete_url,
                                    extend: ""
                                };
                                operat.url = admin.table.toolSpliceUrl(operat.url, operat.field, data);
                                if (admin.checkAuth(operat.auth, elem)) {
                                    html += admin.table.buildOperatHtml(operat);
                                }
                                break;
                        }

                    } else if (typeof item === 'object') {
                        $.each(item, function (i, operat) {
                            operat.class = operat.class || '';
                            operat.icon = operat.icon || '';
                            operat.auth = operat.auth || '';
                            operat.url = operat.url || '';
                            operat.method = operat.method || 'open';
                            operat.field = operat.field || 'id';
                            operat.title = operat.title || operat.text;
                            operat.text = operat.text || operat.title;
                            operat.extend = operat.extend || '';

                            // 自定义表格opreat按钮的弹窗标题风格，extra是表格里的欲加入标题中的字段
                            operat.extra = operat.extra || '';
                            if (data[operat.extra] !== undefined) {
                                operat.title = data[operat.extra] + ' - ' + operat.title;
                            }

                            operat.url = admin.table.toolSpliceUrl(operat.url, operat.field, data);
                            if (admin.checkAuth(operat.auth, elem)) {
                                html += admin.table.buildOperatHtml(operat);
                            }
                        });
                    }
                });
                return html;
            },
            list: function (data) {
                let option = data.LAY_COL
                option.selectList = option.selectList || {};
                let value = undefined;
                try {
                    value = eval("data." + option.field);
                } catch (e) {
                }
                if (option.selectList[value] === undefined || option.selectList[value] === '' || option.selectList[value] === null) {
                    return value;
                } else {
                    return option.selectList[value];
                }
            },
            image: function (data) {
                let option = data.LAY_COL
                option.imageWidth = option.imageWidth || 200;
                option.imageHeight = option.imageHeight || 40;
                option.imageSplit = option.imageSplit || '|';
                option.imageJoin = option.imageJoin || '<br>';
                option.title = option.title || option.field;
                let title = data[option.title], value = undefined;
                try {
                    value = eval("data." + option.field);
                } catch (e) {
                }
                if (value === undefined || value === null) {
                    return '<img style="max-width: ' + option.imageWidth + 'px; max-height: ' + option.imageHeight + 'px;" src="' + value + '" data-image="' + title + '">';
                } else {
                    let values = value.split(option.imageSplit),
                        valuesHtml = [];
                    values.forEach((value, index) => {
                        valuesHtml.push('<img style="max-width: ' + option.imageWidth + 'px; max-height: ' + option.imageHeight + 'px;" src="' + value + '" data-image="' + title + '">');
                    });
                    return valuesHtml.join(option.imageJoin);
                }
            },
            url: function (data) {
                let value = undefined, option = data.LAY_COL;
                try {
                    value = eval("data." + option.field);
                } catch (e) {
                }
                return '<a class="layuimini-table-url" href="' + value + '" target="_blank" class="label bg-green">' + value + '</a>';
            },
            switch: function (data) {
                let value = undefined, checked = '', option = data.LAY_COL;
                option.filter = option.filter || option.field || null;
                option.tips = option.tips || '开|关';
                option.checked = option.checked || 1;
                try {
                    value = eval("data." + option.field);
                } catch (e) {
                }
                checked = value === option.checked && 'checked';
                return laytpl('<input type="checkbox" name="' + option.field + '" value="' + data.id + '" lay-skin="switch" lay-text="' + option.tips + '" lay-filter="' + option.filter + '" ' + checked + ' >').render(data);
            },
            price: function (data) {
                let value = undefined, option = data.LAY_COL;
                try {
                    value = eval("data." + option.field);
                } catch (e) {
                }
                return '<span>￥' + value + '</span>';
            },
            percent: function (data) {
                let value = undefined, option = data.LAY_COL;
                try {
                    value = eval("data." + option.field);
                } catch (e) {
                }
                return '<span>' + value + '%</span>';
            },
            icon: function (data) {
                let value = undefined, option = data.LAY_COL;
                try {
                    value = eval("data." + option.field);
                } catch (e) {
                }
                return '<i class="' + value + '"></i>';
            },
            text: function (data) {
                let value = undefined, option = data.LAY_COL;
                try {
                    value = eval("data." + option.field);
                } catch (e) {
                }
                return '<span class="line-limit-length">' + value + '</span>';
            },
            value: function (data) {
                let value = undefined, option = data.LAY_COL;
                try {
                    value = eval("data." + option.field);
                } catch (e) {
                }
                return '<span>' + value + '</span>';
            },
            //时间戳转日期
            date: function (data) {
                let value = '', option = data.LAY_COL;
                try {
                    value = eval("data." + option.field);
                } catch (e) {
                }
                if (!admin.empty(value)) {
                    value = util.toDateString(value * 1000, option.format || 'yyyy-MM-dd HH:mm:ss');
                }
                return '<span>' + value + '</span>';
            },
            listenTableSearch: function (tableId) {
                form.on('submit(' + tableId + '_filter)', function (data) {
                    let dataField = data.field;
                    let formatFilter = {},
                        formatOp = {};
                    $.each(dataField, function (key, val) {
                        if (val !== '') {
                            formatFilter[key] = val;
                            let op = $('#c-' + key).attr('data-search-op');
                            op = op || '%*%';
                            formatOp[key] = op;
                        }
                    });
                    table.reload(tableId, {
                        page: {
                            curr: 1
                        }
                        , where: {
                            filter: JSON.stringify(formatFilter),
                            op: JSON.stringify(formatOp)
                        }
                    }, 'data');
                    return false;
                });
            },
            listenSwitch: function (option, ok) {
                option.filter = option.filter || '';
                option.url = option.url || '';
                option.field = option.field || option.filter || '';
                option.tableId = option.tableId || init.table_render_id;
                option.modifyReload = option.modifyReload || false;
                form.on('switch(' + option.filter + ')', function (obj) {
                    let checked = obj.elem.checked ? 1 : 0;
                    if (typeof ok === 'function') {
                        return ok({
                            id: obj.value,
                            checked: checked,
                        });
                    } else {
                        let data = {
                            id: obj.value,
                            field: option.field,
                            value: checked,
                        };
                        admin.request.post({
                            url: option.url,
                            prefix: true,
                            data: data,
                        }, function (res) {
                            if (option.modifyReload) {
                                table.reload(option.tableId);
                            }
                        }, function (res) {
                            admin.msg.error(res.msg, function () {
                                table.reload(option.tableId);
                            });
                        }, function () {
                            table.reload(option.tableId);
                        });
                    }
                });
            },
            listenToolbar: function (layFilter, tableId) {
                table.on('toolbar(' + layFilter + ')', function (obj) {

                    // 搜索表单的显示
                    switch (obj.event) {
                        case 'TABLE_SEARCH':
                            let searchFieldsetId = 'searchFieldset_' + tableId;
                            let _that = $("#" + searchFieldsetId);
                            if (_that.hasClass("layui-hide")) {
                                _that.removeClass('layui-hide');
                            } else {
                                _that.addClass('layui-hide');
                            }
                            break;
                    }
                });
            },
            listenEdit: function (tableInit, layFilter, tableId, modifyReload) {
                tableInit.modify_url = tableInit.modify_url || false;
                tableId = tableId || init.table_render_id;
                if (tableInit.modify_url !== false) {
                    table.on('edit(' + layFilter + ')', function (obj) {
                        let value = obj.value,
                            data = obj.data,
                            id = data.id,
                            field = obj.field;
                        let _data = {
                            id: id,
                            field: field,
                            value: value,
                        };
                        admin.request.post({
                            url: tableInit.modify_url,
                            prefix: true,
                            data: _data,
                        }, function (res) {
                            if (modifyReload) {
                                table.reload(tableId);
                            }
                        }, function (res) {
                            admin.msg.error(res.msg, function () {
                                table.reload(tableId);
                            });
                        }, function () {
                            table.reload(tableId);
                        });
                    });
                }
            },
        },
        checkMobile: function () {
            let userAgentInfo = navigator.userAgent;
            let mobileAgents = ["Android", "iPhone", "SymbianOS", "Windows Phone", "iPad", "iPod"];
            let mobile_flag = false;
            //根据userAgent判断是否是手机
            for (let v = 0; v < mobileAgents.length; v++) {
                if (userAgentInfo.indexOf(mobileAgents[v]) > 0) {
                    mobile_flag = true;
                    break;
                }
            }
            let screen_width = window.screen.width;
            let screen_height = window.screen.height;
            //根据屏幕分辨率判断是否是手机
            if (screen_width < 600 && screen_height < 800) {
                mobile_flag = true;
            }
            return mobile_flag;
        },
        open: function (title, url, width, height, isResize, shadeClose = false) {
            isResize = isResize === undefined ? true : isResize;
            let index = layer.open({
                title: title,
                type: 2,
                area: [width, height],
                content: url,
                maxmin: true,
                moveOut: true,
                shadeClose: shadeClose,
                success: function (layero, index) {
                    let body = layer.getChildFrame('body', index);
                    if (body.length > 0) {
                        $.each(body, function (i, v) {

                            // todo 优化弹出层背景色修改
                            $(v).before('<style>\n' +
                                'html, body {\n' +
                                '    background: #ffffff;\n' +
                                '}\n' +
                                '</style>');
                        });
                    }
                },
                end: function () {
                    index = null
                }
            });
            if (admin.checkMobile() || width === undefined || height === undefined) {
                layer.full(index);
            }
            if (isResize) {
                $(window).on("resize", function () {
                    index && layer.full(index);
                })
            }
        },
        listen: function (preposeCallback, ok, no, ex) {

            // 监听表单是否为必填项
            admin.api.formRequired();

            // 监听表单提交事件
            admin.api.formSubmit(preposeCallback, ok, no, ex);

            // 初始化图片显示以及监听上传事件
            admin.api.upload();

            // 监听富文本初始化
            admin.api.editor();

            // 监听下拉选择生成
            admin.api.select();

            // 监听时间控件生成
            admin.api.date();

            // 初始化layui表单
            form.render();

            // 表格修改
            $("body").on("mouseenter", ".table-edit-tips", function () {
                let openTips = layer.tips('点击行内容可以进行修改', $(this), {tips: [2, '#e74c3c'], time: 4000});
            });

            // 监听弹出层的打开
            $('body').on('click', '[data-open]', function () {

                let clienWidth = $(this).attr('data-width'),
                    clientHeight = $(this).attr('data-height'),
                    dataFull = $(this).attr('data-full'),
                    checkbox = $(this).attr('data-checkbox'),
                    url = $(this).attr('data-open'),
                    external = $(this).attr('data-external') || false,
                    tableId = $(this).attr('data-table');

                if (checkbox === 'true') {
                    tableId = tableId || init.table_render_id;
                    let checkStatus = table.checkStatus(tableId),
                        data = checkStatus.data;
                    if (data.length <= 0) {
                        admin.msg.error('请勾选需要操作的数据');
                        return false;
                    }
                    let ids = [];
                    $.each(data, function (i, v) {
                        ids.push(v.id);
                    });
                    if (url.indexOf("?") === -1) {
                        url += '?id=' + ids.join(',');
                    } else {
                        url += '&id=' + ids.join(',');
                    }
                }

                if (clienWidth === undefined || clientHeight === undefined) {
                    let width = document.body.clientWidth,
                        height = document.body.clientHeight;
                    if (width >= 800 && height >= 600) {
                        clienWidth = '800px';
                        clientHeight = '600px';
                    } else {
                        clienWidth = '100%';
                        clientHeight = '100%';
                    }
                }
                if (dataFull === 'true') {
                    clienWidth = '100%';
                    clientHeight = '100%';
                }

                admin.open(
                    $(this).attr('data-title'),
                    external ? url : admin.url(url),
                    clienWidth,
                    clientHeight,
                );
            });

            // 放大图片
            $('body').on('click', '[data-image]', function () {
                let title = $(this).attr('data-image'),
                    src = $(this).attr('src'),
                    alt = $(this).attr('alt');
                let photos = {
                    "title": title,
                    "id": Math.random(),
                    "data": [
                        {
                            "alt": alt,
                            "pid": Math.random(),
                            "src": src,
                            "thumb": src
                        }
                    ]
                };
                layer.photos({
                    photos: photos,
                    anim: 5
                });
                return false;
            });

            // 放大一组图片
            $('body').on('click', '[data-images]', function () {
                let title = $(this).attr('data-images'),
                    // 从当前元素向上找layuimini-upload-show找到第一个后停止, 再找其所有子元素li
                    doms = $(this).closest(".layuimini-upload-show").children("li"),
                    // 被点击的图片地址
                    now_src = $(this).attr('src'),
                    alt = $(this).attr('alt'),
                    data = [];
                $.each(doms, function (key, value) {
                    let src = $(value).find('img').attr('src');
                    if (src != now_src) {
                        // 压入其他图片地址
                        data.push({
                            "alt": alt,
                            "pid": Math.random(),
                            "src": src,
                            "thumb": src
                        });
                    } else {
                        // 把当前图片插入到头部
                        data.unshift({
                            "alt": alt,
                            "pid": Math.random(),
                            "src": now_src,
                            "thumb": now_src
                        });
                    }
                });
                let photos = {
                    "title": title,
                    "id": Math.random(),
                    "data": data,
                };
                layer.photos({
                    photos: photos,
                    anim: 5
                });
                return false;
            });


            // 监听动态表格刷新
            $('body').on('click', '[data-table-refresh]', function () {
                let tableId = $(this).attr('data-table-refresh');
                if (tableId === undefined || tableId === '' || tableId == null) {
                    tableId = init.table_render_id;
                }
                table.reload(tableId);
            });

            // 监听搜索表格重置
            $('body').on('click', '[data-table-reset]', function () {
                let tableId = $(this).attr('data-table-reset');
                if (tableId === undefined || tableId === '' || tableId == null) {
                    tableId = init.table_render_id;
                }
                table.reload(tableId, {
                    page: {
                        curr: 1
                    }
                    , where: {
                        filter: '{}',
                        op: '{}'
                    }
                }, 'data');
            });

            // 监听请求
            $('body').on('click', '[data-request]', function () {
                let title = $(this).attr('data-title'),
                    url = $(this).attr('data-request'),
                    tableId = $(this).attr('data-table'),
                    addons = $(this).attr('data-addons'),
                    checkbox = $(this).attr('data-checkbox'),
                    direct = $(this).attr('data-direct'),
                    field = $(this).attr('data-field') || 'id';

                title = title || '确定进行该操作？';

                if (direct === 'true') {
                    admin.msg.confirm(title, function () {
                        window.location.href = url;
                    });
                    return false;
                }

                let postData = {};
                if (checkbox === 'true') {
                    tableId = tableId || init.table_render_id;
                    let checkStatus = table.checkStatus(tableId),
                        data = checkStatus.data;
                    if (data.length <= 0) {
                        admin.msg.error('请勾选需要操作的数据');
                        return false;
                    }
                    let ids = [];
                    $.each(data, function (i, v) {
                        ids.push(v[field]);
                    });
                    postData[field] = ids;
                }

                if (addons !== true && addons !== 'true') {
                    url = admin.url(url);
                }
                tableId = tableId || init.table_render_id;
                admin.msg.confirm(title, function () {
                    admin.request.post({
                        url: url,
                        data: postData,
                    }, function (res) {
                        admin.msg.success(res.msg, function () {
                            table.reload(tableId);
                        });
                    })
                });
                return false;
            });

            // excel导出
            $('body').on('click', '[data-table-export]', function () {
                let tableId = $(this).attr('data-table-export'),
                    url = $(this).attr('data-url');
                let index = admin.msg.confirm('根据查询进行导出，确定导出？', function () {
                    window.location = admin.url(url);
                    layer.close(index);
                });
            });

            // 数据表格多删除
            $('body').on('click', '[data-table-delete]', function () {
                let tableId = $(this).attr('data-table-delete'),
                    url = $(this).attr('data-url');
                tableId = tableId || init.table_render_id;
                url = url !== undefined ? admin.url(url) : window.location.href;
                let checkStatus = table.checkStatus(tableId),
                    data = checkStatus.data;
                if (data.length <= 0) {
                    admin.msg.error('请勾选需要删除的数据');
                    return false;
                }
                let ids = [];
                $.each(data, function (i, v) {
                    ids.push(v.id);
                });
                admin.msg.confirm('确定删除？', function () {
                    admin.request.post({
                        url: url,
                        data: {
                            id: ids
                        },
                    }, function (res) {
                        admin.msg.success(res.msg, function () {
                            table.reload(tableId);
                        });
                    });
                });
                return false;
            });

        },
        api: {
            form: function (url, data, ok, no, ex, refreshTable) {
                if (refreshTable === undefined) {
                    refreshTable = true;
                }
                ok = ok || function (res) {
                    res.msg = res.msg || '';
                    admin.msg.success(res.msg, function () {
                        admin.api.closeCurrentOpen({
                            refreshTable: refreshTable
                        });
                    });
                    return false;
                };
                admin.request.post({
                    url: url,
                    data: data,
                }, ok, no, ex);
                return false;
            },
            closeCurrentOpen: function (option) {
                option = option || {};
                option.refreshTable = option.refreshTable || false;
                option.refreshFrame = option.refreshFrame || false;
                if (option.refreshTable === true) {
                    option.refreshTable = init.table_render_id;
                }
                let index = parent.layer.getFrameIndex(window.name);
                parent.layer.close(index);
                if (option.refreshTable !== false) {
                    parent.layui.table.reload(option.refreshTable);
                }
                if (option.refreshFrame) {
                    parent.location.reload();
                }
                return false;
            },
            refreshFrame: function () {
                parent.location.reload();
                return false;
            },
            refreshTable: function (tableName) {
                tableName = tableName || 'currentTable';
                table.reload(tableName);
            },
            formRequired: function () {
                let verifyList = document.querySelectorAll("[lay-verify]");
                if (verifyList.length > 0) {
                    $.each(verifyList, function (i, v) {
                        let verify = $(this).attr('lay-verify');

                        // todo 必填项处理
                        if (verify.includes('required')) {
                            let label = $(this).parent().prev();
                            if (label.is('label') && !label.hasClass('required')) {
                                label.addClass('required');
                            }
                            if ($(this).attr('lay-reqtext') === undefined && $(this).attr('placeholder') !== undefined) {
                                $(this).attr('lay-reqtext', $(this).attr('placeholder'));
                            }
                            if ($(this).attr('placeholder') === undefined && $(this).attr('lay-reqtext') !== undefined) {
                                $(this).attr('placeholder', $(this).attr('lay-reqtext'));
                            }
                        }

                    });
                }
            },
            formSubmit: function (preposeCallback, ok, no, ex) {
                let formList = document.querySelectorAll("[lay-submit]");

                // 表单提交自动处理
                if (formList.length > 0) {
                    $.each(formList, function (i, v) {
                        let filter = $(this).attr('lay-filter'),
                            type = $(this).attr('data-type'),
                            refresh = $(this).attr('data-refresh'),
                            url = $(this).attr('lay-submit');
                        // 表格搜索不做自动提交
                        if (type === 'tableSearch') {
                            return false;
                        }
                        // 判断是否需要刷新表格
                        if (refresh === 'false') {
                            refresh = false;
                        } else {
                            refresh = true;
                        }
                        // 自动添加layui事件过滤器
                        if (filter === undefined || filter === '') {
                            filter = 'save_form_' + (i + 1);
                            $(this).attr('lay-filter', filter)
                        }
                        if (url === undefined || url === '' || url === null) {
                            url = window.location.href;
                        } else {
                            url = admin.url(url);
                        }
                        form.on('submit(' + filter + ')', function (data) {
                            let dataField = data.field;

                            // 富文本数据处理
                            let editorList = document.querySelectorAll(".editor");
                            if (editorList.length > 0) {
                                $.each(editorList, function (i, v) {
                                    let name = $(this).attr("name");
                                    dataField[name] = CKEDITOR.instances[name].getData();
                                });
                            }

                            if (typeof preposeCallback === 'function') {
                                dataField = preposeCallback(dataField);
                            }
                            admin.api.form(url, dataField, ok, no, ex, refresh);

                            return false;
                        });
                    });
                }

            },
            upload: function () {
                let uploadList = document.querySelectorAll("[data-upload]");
                let uploadSelectList = document.querySelectorAll("[data-upload-select]");

                if (uploadList.length > 0) {
                    $.each(uploadList, function (i, v) {
                        let uploadExts = $(this).attr('data-upload-exts') || init.upload_exts,
                            uploadName = $(this).attr('data-upload'),
                            uploadNumber = $(this).attr('data-upload-number') || 'one',
                            uploadSign = $(this).attr('data-upload-sign') || '|',
                            uploadAccept = $(this).attr('data-upload-accept') || 'file',
                            uploadAcceptMime = $(this).attr('data-upload-mimetype') || '',
                            elem = "input[name='" + uploadName + "']",
                            uploadElem = this;

                        // 监听上传事件
                        upload.render({
                            elem: this,
                            url: admin.url(init.upload_url),
                            exts: uploadExts,
                            accept: uploadAccept,//指定允许上传时校验的文件类型
                            acceptMime: uploadAcceptMime,//规定打开文件选择框时，筛选出的文件类型
                            multiple: uploadNumber !== 'one',//是否多文件上传
                            headers: admin.headers(),
                            done: function (res) {
                                if (res.code === 1) {
                                    let url = res.data.url;
                                    if (uploadNumber !== 'one') {
                                        let oldUrl = $(elem).val();
                                        if (oldUrl !== '') {
                                            url = oldUrl + uploadSign + url;
                                        }
                                    }
                                    $(elem).val(url);
                                    $(elem).trigger("input");
                                    admin.msg.success(res.msg);
                                } else {
                                    admin.msg.error(res.msg);
                                }
                                return false;
                            }
                        });

                        // 监听上传input值变化
                        $(elem).bind("input propertychange", function (event) {
                            let urlString = $(this).val(),
                                urlArray = urlString.split(uploadSign),
                                uploadIcon = $(uploadElem).attr('data-upload-icon') || "file";

                            $('#bing-' + uploadName).remove();
                            if (urlString.length > 0) {
                                let parant = $(this).parent('div');
                                let liHtml = '';
                                $.each(urlArray, function (i, v) {
                                    liHtml += '<li><a><img src="' + v + '" data-image  onerror="this.src=\'' + BASE_URL + 'admin/images/upload-icons/' + uploadIcon + '.png\';this.onerror=null"></a><small class="uploads-delete-tip bg-red badge" data-upload-delete="' + uploadName + '" data-upload-url="' + v + '" data-upload-sign="' + uploadSign + '">×</small></li>\n';
                                });
                                parant.after('<ul id="bing-' + uploadName + '" class="layui-input-block layuimini-upload-show">\n' + liHtml + '</ul>');
                            }

                        });

                        // 非空初始化图片显示
                        if ($(elem).val() !== '') {
                            $(elem).trigger("input");
                        }
                    });

                    // 监听上传文件的删除事件
                    $('body').on('click', '[data-upload-delete]', function () {
                        let uploadName = $(this).attr('data-upload-delete'),
                            deleteUrl = $(this).attr('data-upload-url'),
                            sign = $(this).attr('data-upload-sign');
                        let confirm = admin.msg.confirm('确定删除？', function () {
                            let elem = "input[name='" + uploadName + "']";
                            let currentUrl = $(elem).val();
                            let url = '';
                            if (currentUrl !== deleteUrl) {
                                url = currentUrl.search(deleteUrl) === 0 ? currentUrl.replace(deleteUrl + sign, '') : currentUrl.replace(sign + deleteUrl, '');
                                $(elem).val(url);
                                $(elem).trigger("input");
                            } else {
                                $(elem).val(url);
                                $('#bing-' + uploadName).remove();
                            }
                            admin.msg.close(confirm);
                        });
                        return false;
                    });
                }

                if (uploadSelectList.length > 0) {
                    $.each(uploadSelectList, function (i, v) {
                        let uploadName = $(this).attr('data-upload-select'),
                            uploadNumber = $(this).attr('data-upload-number') || 'one',
                            uploadSign = $(this).attr('data-upload-sign') || '|';

                        let selectCheck = uploadNumber === 'one' ? 'radio' : 'checkbox';
                        let elem = "input[name='" + uploadName + "']",
                            uploadElem = $(this).attr('id');

                        tableSelect.render({
                            elem: "#" + uploadElem,
                            checkedKey: 'id',
                            searchType: 'more',
                            searchList: [
                                {searchKey: 'title', searchPlaceholder: '请输入文件名'},
                            ],
                            table: {
                                url: admin.url('ajax/getUploadFiles'),
                                cols: [[
                                    {type: selectCheck},
                                    {field: 'id', title: 'ID'},
                                    {
                                        field: 'url',
                                        minWidth: 80,
                                        search: false,
                                        title: '图片信息',
                                        imageHeight: 40,
                                        align: "center",
                                        templet: admin.table.image
                                    },
                                    {field: 'original_name', width: 150, title: '文件原名', align: "center"},
                                    {field: 'mime_type', width: 120, title: 'mime类型', align: "center"},
                                    {
                                        field: 'create_time',
                                        width: 200,
                                        title: '创建时间',
                                        align: "center",
                                        search: 'range'
                                    },
                                ]]
                            },
                            done: function (e, data) {
                                let urlArray = [];
                                $.each(data.data, function (index, val) {
                                    urlArray.push(val.url)
                                });
                                let url = urlArray.join(uploadSign);
                                admin.msg.success('选择成功', function () {
                                    $(elem).val(url);
                                    $(elem).trigger("input");
                                });
                            }
                        })

                    });

                }
            },
            editor: function () {
                CKEDITOR.tools.setCookie('ckCsrfToken', window.CONFIG.CSRF_TOKEN);

                let editorList = document.querySelectorAll(".editor");
                if (editorList.length > 0) {
                    $.each(editorList, function (i, v) {
                        CKEDITOR.replace(
                            $(this).attr("name"),
                            {
                                height: $(this).height(),
                                filebrowserImageUploadUrl: admin.url('ajax/uploadEditor'),
                            });
                    });
                }
            },
            select: function () {
                let selectList = document.querySelectorAll("[data-select]");
                $.each(selectList, function (i, v) {
                    let url = $(this).attr('data-select'),
                        selectFields = $(this).attr('data-fields'),
                        value = $(this).attr('data-value'),
                        that = this,
                        html = '<option value=""></option>';
                    let fields = selectFields.replace(/\s/g, "").split(',');
                    if (fields.length !== 2) {
                        return admin.msg.error('下拉选择字段有误');
                    }
                    admin.request.get(
                        {
                            url: url,
                            data: {
                                selectFields: selectFields
                            },
                        }, function (res) {
                            let list = res.data;
                            list.forEach(val => {
                                let key = val[fields[0]];
                                if (value !== undefined && key.toString() === value) {
                                    html += '<option value="' + key + '" selected="">' + val[fields[1]] + '</option>';
                                } else {
                                    html += '<option value="' + key + '">' + val[fields[1]] + '</option>';
                                }
                            });
                            $(that).html(html);
                            form.render();
                        }
                    );
                });
            },
            date: function () {
                let dateList = document.querySelectorAll("[data-date]");
                if (dateList.length > 0) {
                    $.each(dateList, function (i, v) {
                        let format = $(this).attr('data-date'),
                            type = $(this).attr('data-date-type'),
                            range = $(this).attr('data-date-range');
                        if (type === undefined || type === '' || type === null) {
                            type = 'datetime';
                        }
                        let options = {
                            elem: this,
                            type: type,
                        };
                        if (format !== undefined && format !== '' && format !== null) {
                            options['format'] = format;
                        }
                        if (range !== undefined) {
                            if (range === null || range === '') {
                                range = '-';
                            }
                            options['range'] = range;
                        }
                        laydate.render(options);
                    });
                }
            },
        },
    };
    return admin;
});
