<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>小麦穗粒识别计数系统-注册</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/src/layui/layuimini/lib/layui-v2.5.4/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/src/css/main.css">
    <style type="text/css">
        .fly-docs-title {
            margin-bottom: 10px;
            padding-bottom: 10px;
            color: #000;
            border-bottom: 1px solid #e6e6e6;
        }
        .fly-docs-container .fly-md-text {
            padding: 20px 0;
        }

        .fly-md-text {
            line-height: 24px;
        }
        .layui-text {
            line-height: 22px;
            font-size: 14px;
            color: #666;
        }
        blockquote {
            display: block;
            margin-block-start: 1em;
            margin-block-end: 1em;
            margin-inline-start: 40px;
            margin-inline-end: 40px;
        }

    </style>
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <%@include file="../main/head.jsp" %>
</div>
<div class="layui-container">
    <div class="fly-docs-container">
        <h1 class="fly-docs-title">小麦穗粒识别用户服务条款</h1>
        <div class="layui-text fly-md-text" id="FLY-docs-preview">
            <p>欢迎您来到小麦穗粒识别系统（以下简称“本系统”）。</p>
            <blockquote>
                <p>请您仔细阅读以下条款，如果您对本协议的任何条款表示异议，您可以选择不进入本系统。当您注册成功，无论是进入本系统，还是在本系统上发布任何内容（即「内容」），均意味着您（即「用户」）完全接受本协议项下的全部条款。</p>
            </blockquote> <h2>使用规则</h2>
            <p>1、用户注册成功后，本站将给予每个用户一个用户帐号及相应的密码，该用户帐号和密码由用户负责保管，用户不应将账号或密码告知第三方，或者将其帐号、密码转让、出借予他人使用或与第三方共用。如用户发现其帐号遭他人非法使用，应立即通知本站，因黑客行为或用户的保管疏忽等非本站原因导致帐号、密码遭他人非法使用或无法正常使用的，本站不承担任何责任；用户应当对以其用户帐号进行的所有活动和事件负法律责任。</p>
            <p>2、用户应提供及时、详尽及准确的个人资料，并不断更新注册资料，用户须对在本站的注册信息的真实性、合法性、有效性承担全部责任，用户不得冒充他人；不得利用他人的名义发布任何信息；不得恶意使用注册帐号导致其他用户误认；否则Fly社区有权立即停止提供服务，收回其帐号并由用户独自承担由此而产生的一切法律责任。</p>
            <p>3、用户直接或通过各类方式（如 RSS 源和站外 API 引用等）间接使用本站服务和数据的行为，都将被视作已无条件接受本协议全部内容；若用户对本协议的任何条款存在异议，请停止使用Fly社区所提供的全部服务。</p> <p>4、本站是一个信息分享、传播及获取的平台，用户通过Fly社区发表的信息为公开的信息，其他第三方均可以通过本站获取用户发表的信息，用户对任何信息的发表即认可该信息为公开的信息，并单独对此行为承担法律责任；任何用户不愿被其他第三人获知的信息都不应该在本站上进行发表。</p>
            <p>5、用户承诺不得以任何方式利用本站直接或间接从事违反中国法律以及社会公德的行为，本站有权对违反上述承诺的内容予以删除。</p>
            <p>6、用户不得利用Fly社区服务制作、上载、复制、发布、传播或者转载如下内容：</p>
            <ul>
                <li>反对宪法所确定的基本原则的；</li>
                <li>危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的；</li>
                <li>损害国家荣誉和利益的；</li> <li>煽动民族仇恨、民族歧视，破坏民族团结的；</li>
                <li>破坏国家宗教政策，宣扬邪教和封建迷信的；</li>
                <li>散布谣言，扰乱社会秩序，破坏社会稳定的；</li>
                <li>散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的；</li>
                <li>侮辱或者诽谤他人，侵害他人合法权益的；</li>
                <li>含有法律、行政法规禁止的其他内容的信息。</li>
            </ul>

        </div>
        <div class="layui-form-item">
            <button class="layui-btn"   id ="formDemo"  >返回</button>
        </div>
    </div>
</div>
<%@include file="../main/footer.jsp" %>

</div>
<script src="${pageContext.request.contextPath}/src/layui/layuimini/lib/layui-v2.5.4/layui.all.js"></script>
<script src="${pageContext.request.contextPath}/src/layui/layuimini/lib/jquery-3.4.1/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/src/js/sliderVerify/sliderVerify.js"></script>
<script>
    //一般直接写在一个js文件中
    layui.config({
        base: '${pageContext.request.contextPath}/src/js/sliderVerify/'
    }).use(['sliderVerify', 'jquery', 'form'], function () {
        var sliderVerify = layui.sliderVerify,
            form = layui.form;
        var slider = sliderVerify.render({
            elem: '#slider'
        })
        console.log("save111111--");
        var flag = true;

        $("#formDemo").click(function () {
            alert();
            window.history.go(-1)
        });



    })




</script>
</body>
</html>