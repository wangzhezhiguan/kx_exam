var radar_check = function() {
    $("#radar_check").on("click", function () {
        $("#radarResult").html('');
        that.radarCheck();
    });
    var that = this;

    this.checkData = {
        error:1,
        info:'',
        data:null
    };

    this.radarCheck = function () {
        var objForm = $('#radar_check_ifr');

        var sPhone = strTrim($('#phone').val());
        var sRealName = strTrim($('#real_name').val());
        var sIdCard = strTrim($('#id_card').val());

        var ErrorList = [];

        // if(IsN(sPhone)){
        //     ErrorList.push('请输入被查询者的手机号码');
        // }else if(!that.isPhone(sPhone)){
        //     ErrorList.push('手机号格式不正确');
        // }


        if(IsN(sRealName)){
            ErrorList.push('请输入被查询者的真实姓名');
        }

        var IdValidator = new IDValidator();
        if(IsN(sIdCard)){
            ErrorList.push('请输入被查询者的身份证号');
        }else if(!IdValidator.isValid(sIdCard)){
            ErrorList.push('身份证格式不正确');
        }

        if(!IsN(ErrorList)){
            AlertError(ErrorList.join('<br>'));
            return false;
        }

        var Params = {
            //phone: sPhone,
            real_name: sRealName,
            id_card: sIdCard
        };


        LockUI(objForm, '正在获取 “'+ sRealName +'” 的全景雷达报告结果');
        that.checkData.error = 1;
        that.getCheckData(Params, objForm);
    };

    this.getCheckData = function (Params, objForm) {
        $.ajax({
            type: "POST",
            url: '/admin/doUsercreditsearch',
            timeout: 40000,
            dataType: "json",
            data: Params,
            beforeSend: function (XMLHttpRequest) {
                XMLHttpRequest.setRequestHeader("request_type", "ajax");
            },
            success: function (response) {
            
                if(response.error){
                    UnLockUI(objForm);
                    that.checkData.info = response.retmsg;
                    that.radarCheckResponse();
                }else{
                    that.checkData.error = 0;
                    that.checkData.data = response.data;
                    that.radarCheckResponse();
                    UnLockUI(objForm);
                }
            },
            error: function () {
                UnLockUI(objForm);
                that.checkData.info = '请求超时';
                that.radarCheckResponse();
            }
        });
    };

    this.radarCheckResponse = function () {
        //全景雷达报告
        var radarHtml = that.getRadarHtml();
        $("#radarResult").html(radarHtml);

    };

    this.getRadarHtml = function () {
        console.log(that.checkData);

        if(that.checkData.error){
            var redClass = 'blact-red-sp';
            var noteInfo = '<div class="blact-p-left '+redClass+'"><h3>'+that.checkData.info+'</div>';
            return '<div class="row"><div class="col-sm-12">\n'+
                '            <div class="ibox float-e-margins">\n'+noteInfo+
                '            </div>'+
                '       </div></div>';
        }else {
            var radarData = that.checkData.data;
            var radarHtml = '<div class="row"><div class="col-sm-12">\n' +
                '            <div class="ibox float-e-margins">\n' +
                '                <table class="table table-bordered table-hover table-mg-tp">\n' +
                '                   <tbody>\n' +
                '                       <tr>\n' +
                '                           <th>姓名</th>\n' +
                '                           <td>'+radarData.id_name+'</td>\n' +
                '                           <th>报告编号</th>\n' +
                '                           <td>'+radarData.userid+'</td>\n' +
                '                       </tr>\n' +
                '                       <tr>\n' +
                '                           <th>身份证号</th>\n' +
                '                           <td>'+radarData.id_no+'</td>\n' +
                '                           <th>报告日期</th>\n' +
                '                           <td>'+formatDate((new Date()).valueOf())+'</td>\n' +
                '                       </tr>\n' +
                '                   </tbody>\n' +
                '               </table>\n' +
                '            </div>\n' +
                '        </div>';

            //申请雷达报告
           // var apply_report_detail = radarData.result_detail.apply_report_detail ? radarData.result_detail.apply_report_detail : {};
            radarHtml += '<div class="col-sm-12">\n' +
                '            <div class="ibox float-e-margins">\n' +
                '                <div class="ibox-title">\n' +
                '                    <h3>申请雷达报告(贷款申请行为评估)</h3>\n' +
                '                </div>\n' +
                '                <div class="ibox-content">\n' +
                // '                    <table class="table table-bordered">\n' +
                // '                        <tbody>\n' +
                // '                        <tr>\n' +
                // '                            <th>申请准入分</th>\n' +
                // '                            <td>'+(radarData.apply_score?radarData.apply_score:0)+'</td>\n' +
                // '                            <th>置信度</th>\n' +
                // '                            <td>'+(radarData.apply_credibility?radarData.apply_credibility:0)+'</td>\n' +
                // '                        </tr>\n' +
                // '                        </tbody>\n' +
                // '                    </table>\n' +
                '                    <table class="table table-bordered">\n' +
                '                        <thead>\n' +
                '                        <tr>\n' +
                '                            <th colspan="4">多头申请</th>\n' +
                '                        </tr>\n' +
                '                        </thead>\n' +
                '                        <tbody>\n' +
                '                        <tr>\n' +
                '                            <th>查询机构数</th>\n' +
                '                            <td>'+(radarData.query_org_count?radarData.query_org_count:0)+'</td>\n' +
                '                            <th>查询消费金融类机构数</th>\n' +
                '                            <td>'+(radarData.query_finance_count?radarData.query_finance_count:0)+'</td>\n' +
                '                        </tr>\n' +
                '                        <tr>\n' +
                '                            <th>查询网络贷款类机构数</th>\n' +
                '                            <td>'+(radarData.query_cash_count?radarData.query_cash_count:0)+'</td>\n' +
                '                            <th>总查询次数</th>\n' +
                '                            <td>'+(radarData.query_sum_count?radarData.query_sum_count:0)+'</td>\n' +
                '                        </tr>\n' +
                '                        <tr>\n' +
                '                            <th>最近查询时间</th>\n' +
                '                            <td>'+(radarData.latest_query_time?radarData.latest_query_time:'')+'</td>\n' +
                '                            <th></th>\n' +
                '                            <td></td>\n' +
                '                        </tr>\n' +
                '                        </tbody>\n' +
                '                    </table>\n' +
                '                    <table class="table table-bordered">\n' +
                '                        <thead>\n' +
                '                        <tr>\n' +
                '                            <th colspan="4">申请历史</th>\n' +
                '                        </tr>\n' +
                '                        </thead>\n' +
                '                        <tbody>\n' +
                '                        <tr>\n' +
                '                            <th>近1个月总查询笔数</th>\n' +
                '                            <td>'+(radarData.latest_one_month?radarData.latest_one_month:0)+'</td>\n' +
                '                            <th>近3个月总查询笔数</th>\n' +
                '                            <td>'+(radarData.latest_three_month?radarData.latest_three_month:0)+'</td>\n' +
                '                        </tr>\n' +
                '                        <tr>\n' +
                '                            <th>近6个月总查询笔数</th>\n' +
                '                            <td>'+(radarData.latest_six_month?radarData.latest_six_month:0)+'</td>\n' +
                '                            <th></th>\n' +
                '                            <td></td>\n' +
                '                        </tr>\n' +
                '                        </tbody>\n' +
                '                    </table>\n' +
                '                </div>\n' +
                '            </div>\n' +
                '        </div>';

            //行为雷达报告
           // var behavior_report_detail = radarData.result_detail.behavior_report_detail ? radarData.result_detail.behavior_report_detail : {};
            radarHtml += '<div class="col-sm-12">\n' +
                '            <div class="ibox float-e-margins">\n' +
                '                <div class="ibox-title">\n' +
                '                    <h3>行为雷达报告(贷款履约行为评估)</h3>\n' +
                '                </div>\n' +
                '                <div class="ibox-content">\n' +
                // '                    <table class="table table-bordered">\n' +
                // '                        <tbody>\n' +
                // '                        <tr>\n' +
                // '                            <th>贷款行为分</th>\n' +
                // '                            <td>'+(radarData.loans_score?radarData.loans_score:0)+'</td>\n' +
                // '                            <th>置信度</th>\n' +
                // '                            <td>'+(radarData.loans_credibility?radarData.loans_credibility:0)+'</td>\n' +
                // '                        </tr>\n' +
                // '                        </tbody>\n' +
                // '                    </table>\n' +
                '                    <table class="table table-bordered">\n' +
                '                        <thead>\n' +
                '                        <tr>\n' +
                '                            <th colspan="4">履约行为</th>\n' +
                '                        </tr>\n' +
                '                        </thead>\n' +
                '                        <tbody>\n' +
                '                        <tr>\n' +
                '                            <th>贷款放款总订单数</th>\n' +
                '                            <td>'+(radarData.loans_count?radarData.loans_count:0)+'</td>\n' +
                '                            <th>贷款已结清订单数</th>\n' +
                '                            <td>'+(radarData.loans_settle_count?radarData.loans_settle_count:0)+'</td>\n' +
                '                        </tr>\n' +
                '                        <tr>\n' +
                '                            <th>贷款逾期订单数(M0+)</th>\n' +
                '                            <td>'+(radarData.loans_overdue_count?radarData.loans_overdue_count:'')+'</td>\n' +
                '                            <th></th>\n' +
                '                            <td></td>\n' +
                '                        </tr>\n' +
                '                        </tbody>\n' +
                '                    </table>\n' +
                '                    <table class="table table-bordered">\n' +
                '                        <thead>\n' +
                '                        <tr>\n' +
                '                            <th colspan="4">多头贷款</th>\n' +
                '                        </tr>\n' +
                '                        </thead>\n' +
                '                        <tbody>\n' +
                '                        <tr>\n' +
                '                            <th>贷款机构数</th>\n' +
                '                            <td>'+(radarData.loans_org_count?radarData.loans_org_count:0)+'</td>\n' +
                '                            <th>消费金融类机构数</th>\n' +
                '                            <td>'+(radarData.consfin_org_count?radarData.consfin_org_count:0)+'</td>\n' +
                '                        </tr>\n' +
                '                        <tr>\n' +
                '                            <th>网络贷款类机构数</th>\n' +
                '                            <td>'+(radarData.loans_cash_count?radarData.loans_cash_count:0)+'</td>\n' +
                '                            <th></th>\n' +
                '                            <td></td>\n' +
                '                        </tr>\n' +
                '                        </tbody>\n' +
                '                    </table>\n' +
                '                    <table class="table table-bordered">\n' +
                '                        <thead>\n' +
                '                        <tr>\n' +
                '                            <th colspan="4">贷款历史</th>\n' +
                '                        </tr>\n' +
                '                        </thead>\n' +
                '                        <tbody>\n' +
                '                        <tr>\n' +
                '                            <th>近1个月贷款笔数</th>\n' +
                '                            <td>'+(radarData.latest_one_month?radarData.latest_one_month:0)+'</td>\n' +
                '                            <th>近3个月贷款笔数</th>\n' +
                '                            <td>'+(radarData.latest_three_month?radarData.latest_three_month:0)+'</td>\n' +
                '                        </tr>\n' +
                '                        <tr>\n' +
                '                            <th>近6个月贷款笔数</th>\n' +
                '                            <td>'+(radarData.latest_six_month?radarData.latest_six_month:0)+'</td>\n' +
                '                            <th>最近一次贷款时间</th>\n' +
                '                            <td>'+(radarData.loans_latest_time?radarData.loans_latest_time:'')+'</td>\n' +
                '                        </tr>\n' +
                '                        <tr>\n' +
                '                            <th>信用贷款时长</th>\n' +
                '                            <td>'+(radarData.loans_long_time?radarData.loans_long_time:0)+'</td>\n' +
                '                            <th></th>\n' +
                '                            <td></td>\n' +
                '                        </tr>\n' +
                '                        </tbody>\n' +
                '                    </table>\n' +
                '                    <table class="table table-bordered">\n' +
                '                        <thead>\n' +
                '                        <tr>\n' +
                '                            <th colspan="4">履约意愿</th>\n' +
                '                        </tr>\n' +
                '                        </thead>\n' +
                '                        <tbody>\n' +
                '                        <tr>\n' +
                '                            <th>历史贷款机构成功扣款笔数</th>\n' +
                '                            <td>'+(radarData.history_suc_fee?radarData.history_suc_fee:0)+'</td>\n' +
                '                            <th>历史贷款机构失败扣款笔数</th>\n' +
                '                            <td>'+(radarData.history_fail_fee?radarData.history_fail_fee:0)+'</td>\n' +
                '                        </tr>\n' +
                '                        <tr>\n' +
                '                            <th>近1个月贷款机构成功扣款笔数</th>\n' +
                '                            <td>'+(radarData.latest_one_month_suc?radarData.latest_one_month_suc:0)+'</td>\n' +
                '                            <th>近1个月贷款机构失败扣款笔数</th>\n' +
                '                            <td>'+(radarData.latest_one_month_fail?radarData.latest_one_month_fail:0)+'</td>\n' +
                '                        </tr>\n' +
                '                        </tbody>\n' +
                '                    </table>\n' +
                '                </div>\n' +
                '            </div>\n' +
                '        </div>';

            //信用现状报告
            //var current_report_detail = radarData.result_detail.current_report_detail ? radarData.result_detail.current_report_detail : {};
            radarHtml += '<div class="col-sm-12">\n' +
                '            <div class="ibox float-e-margins">\n' +
                '                <div class="ibox-title">\n' +
                '                    <h3>信用现状报告(授信额度评估)</h3>\n' +
                '                </div>\n' +
                '                <div class="ibox-content">\n' +
                '                    <table class="table table-bordered">\n' +
                '                        <thead>\n' +
                '                        <tr>\n' +
                '                            <th colspan="4">网贷额度</th>\n' +
                '                        </tr>\n' +
                '                        </thead>\n' +
                '                        <tbody>\n' +
                '                        <tr>\n' +
                '                            <th colspan="2">网贷建议授信额度</th>\n' +
                '                            <td colspan="2">'+(radarData.loans_credit_limit?radarData.loans_credit_limit:0)+'</td>\n' +
                '                        </tr>\n' +
                '                        </tbody>\n' +
                '                        <tbody>\n' +
                '                        <tr>\n' +
                '                            <th>网络贷款类机构数</th>\n' +
                '                            <td>'+(radarData.loans_org_count?radarData.loans_org_count:0)+'</td>\n' +
                '                            <th>网络贷款类产品数</th>\n' +
                '                            <td>'+(radarData.loans_product_count?radarData.loans_product_count:0)+'</td>\n' +
                '                        </tr>\n' +
                '                        <tr>\n' +
                '                            <th>网络贷款机构最大授信额度</th>\n' +
                '                            <td>'+(radarData.loans_max_limit?radarData.loans_max_limit:0)+'</td>\n' +
                '                            <th>网络贷款机构平均授信额度</th>\n' +
                '                            <td>'+(radarData.loans_avg_limit?radarData.loans_avg_limit:0)+'</td>\n' +
                '                        </tr>\n' +
                '                        </tbody>\n' +
                '                    </table>\n' +
                '                    <table class="table table-bordered">\n' +
                '                        <thead>\n' +
                '                        <tr>\n' +
                '                            <th colspan="4">消金额度</th>\n' +
                '                        </tr>\n' +
                '                        </thead>\n' +
                '                        <tbody>\n' +
                '                        <tr>\n' +
                '                            <th colspan="2">消金建议授信额度</th>\n' +
                '                            <td colspan="2">'+(radarData.consfin_credit_limit?radarData.consfin_credit_limit:0)+'</td>\n' +
                '                        </tr>\n' +
                '                        </tbody>\n' +
                '                        <tbody>\n' +
                '                        <tr>\n' +
                '                            <th>消金贷款类机构数</th>\n' +
                '                            <td>'+(radarData.consfin_org_count?radarData.consfin_org_count:0)+'</td>\n' +
                '                            <th>消金贷款类产品数</th>\n' +
                '                            <td>'+(radarData.consfin_product_count?radarData.consfin_product_count:0)+'</td>\n' +
                '                        </tr>\n' +
                '                        <tr>\n' +
                '                            <th>消金贷款机构最大授信额度</th>\n' +
                '                            <td>'+(radarData.consfin_max_limit?radarData.consfin_max_limit:0)+'</td>\n' +
                '                            <th>消金贷款机构平均授信额度</th>\n' +
                '                            <td>'+(radarData.consfin_avg_limit?radarData.consfin_avg_limit:0)+'</td>\n' +
                '                        </tr>\n' +
                '                        </tbody>\n' +
                '                    </table>\n' +
                '                </div>\n' +
                '            </div>\n' +
                '        </div>';

            radarHtml += '</div>';

            return radarHtml;
        }

    };

};