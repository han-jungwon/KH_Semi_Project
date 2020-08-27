<%--
  Created by IntelliJ IDEA.
  User: dkask
  Date: 2020-08-14
  Time: 오전 12:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>C4U 너만의 기사</title>
    <link rel="stylesheet" href="css/semi_main.css?ver=1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script language="JavaScript">
        //  제이쿼리 사용
        $(document).ready(function() {
            var $banner = $(".banner").find("ul");

            var $bannerWidth = $banner.children().outerWidth();//이미지의 폭
            var $bannerHeight = $banner.children().outerHeight(); // 높이
            var $length = $banner.children().length;//이미지의 갯수
            var rollingId;

            var $btnprev = $(".banner .btn_prev");
            var $btnnext = $(".banner .btn_next");
            $banner.css("left",-$bannerWidth)


            //정해진 초마다 함수 실행
            rollingId = setInterval(function() { rollingStart(); }, 5000);//다음 이미지로 롤링 애니메이션 할 시간차

            function prevItem(){
                clearInterval(rollingId);
                $banner.css("width", $bannerWidth * $length + "px");
                $banner.css("height", $bannerHeight + "px");



                $banner.animate({left: 0 + "px"}, 1500, function() { //숫자는 롤링 진행되는 시간이다.
                    $(this).prepend("<li>" + $(this).find("li:last").html() + "</li>");
                    $(this).find("li:last").remove();
                    $(this).css("left", -$bannerWidth);
                    -5610601310301.3
                02.31465235684623});

                rollingId = setInterval(function() { rollingStart(); }, 5000);


            }

            function nextItem(){
                clearInterval(rollingId);
                $banner.css("width", $bannerWidth * $length + "px");
                $banner.css("height", $bannerHeight + "px");

                $banner.animate({left: - ($bannerWidth*2) + "px"}, 1500, function() { //숫자는 롤링 진행되는 시간이다.

                    $(this).append("<li>" + $(this).find("li:first").html() + "</li>");
                    //뒤로 복사된 첫번재 이미지는 필요 없으니 삭제한다.
                    $(this).find("li:first").remove();
                    //다음 움직임을 위해서 배너 좌측의 위치값을 초기화 한다.
                    $(this).css("left", -$bannerWidth);
                    //이 과정을 반복하면서 계속 롤링하는 배너를 만들 수 있다.
                });

                rollingId = setInterval(function() { rollingStart(); }, 5000);
            }

            $btnnext.on('click',nextItem);
            $btnprev.on('click',prevItem);





            function rollingStart() {
                $banner.css("width", $bannerWidth * $length + "px");
                $banner.css("height", $bannerHeight + "px");
                //배너의 좌측 위치를 옮겨 준다.
                $banner.animate({left: - ($bannerWidth*2) + "px"}, 1500, function() { //숫자는 롤링 진행되는 시간이다.
                    //첫번째 이미지를 마지막 끝에 복사(이동이 아니라 복사)해서 추가한다.
                    $(this).append("<li>" + $(this).find("li:first").html() + "</li>");
                    //뒤로 복사된 첫번재 이미지는 필요 없으니 삭제한다.
                    $(this).find("li:first").remove();
                    //다음 움직임을 위해서 배너 좌측의 위치값을 초기화 한다.
                    $(this).css("left", -$bannerWidth);
                    //이 과정을 반복하면서 계속 롤링하는 배너를 만들 수 있다.
                });
            }
        });

    </script>




</head>
<body>
<div id="main-header">
    <div class="main-header-logo"><a href="#"><img src="./images/semiLogosize.png" /></a></div>
    <ul class="main-header-navi">
        <li><a href="#">기사</a></li>
        <li>
             href="#">산업기사</a></li>
        <li>
            <a href="#">기능사</a></li>
    </ul>
    <ul id='BeforeLogin' class="main-header-login">
        <li><a href="/#">로그인</a></li>
        <li><span>|</span><a href="semi_SignupForm.html">회원가입</a></li>
        <li><span>|</span><a href="/#">고객센터</a></li>
    </ul>


</div>



<div class="contents">
    <div class="banner">
        <ul>
            <li><img src="./images/배너1.png" width="1200" height="210px"></li>
            <li><img src="./images/배너2.png" width="1200" height="210px"></li>
            <li><img src="./images/배너3.png" width="1200" height="210px"></li>
            <li><img src="./images/배너4.png" width="1200" height="210px"></li>
        </ul>
        <a class="btn_prev" href="#">◀</a>
        <a class="btn_next" href="#">▶</a>
    </div>
</div>

<div id="main-box1">
    <ul class="main-box1-qiuck-menu">
        <li><a href="#">커뮤니티</a></li>
        <li><a href="#">장터</a></li>
        <li><a href="#">고객센터</a></li>
        <li><a href="#">공지사항</a></li>
    </ul>

</div>

<div id="contents1">
    <div id="notice">
        <div id="notice_text">공지사항<a href="#" class="more">+ 더보기</a></div>

    </div>
    <div id="calendar">
        <div id="calendar_text">시험일정안내<a href="#" class="more">+ 더보기</a></div>
        <div id="iframe_cal"><iframe id="cc"
                                     src="https://calendar.google.com/calendar/embed?showTitle=0&amp;showPrint=0&amp;height=650&amp;wkst=1&amp;bgcolor=%23ffffff&amp;src=m6ih94dtq04h0i45ur1rn6hvt8%40group.calendar.google.com&amp;color=%236B3304&amp;src=5gsalduefsj7roasfti859g82o%40group.calendar.google.com&amp;color=%23691426&amp;src=6cq637rqsoadcs8eoc75itotds%40group.calendar.google.com&amp;color=%23711616&amp;src=9sij3eua2e24hkf3stckc9iqq8%40group.calendar.google.com&amp;color=%235F6B02&amp;src=56pah2la1md2khklufd54vcjng%40group.calendar.google.com&amp;color=%23B1440E&amp;src=ijglbc2dp91sseiulmnju2rmoc%40group.calendar.google.com&amp;color=%23853104&amp;src=hk4nkgpv0pbgbj12e314rjbrf4%40group.calendar.google.com&amp;color=%238C500B&amp;src=cbtn1hn3g20mpb2ucceec9hn40%40group.calendar.google.com&amp;color=%230F4B38&amp;src=grcpro202gu8ilb0prai9rneio%40group.calendar.google.com&amp;color=%23125A12&amp;src=l05h34sh7ukedrhi3c7nn38a5o%40group.calendar.google.com&amp;color=%232F6309&amp;src=cr4mca33a8tscc6lj8grvhkge4%40group.calendar.google.com&amp;color=%235F6B02&amp;src=vdl8iuerel5pqc8sfkl6qk79fg%40group.calendar.google.com&amp;color=%23AB8B00&amp;src=1vdo00veen0i6k404hkvrlsfc4%40group.calendar.google.com&amp;color=%23875509&amp;src=bmbnmlau0en31sqnnpnaq9fvok%40group.calendar.google.com&amp;color=%2328754E&amp;src=b2191asnmnusdajndpf676cg34%40group.calendar.google.com&amp;color=%231B887A&amp;src=di9hlr3tkbl7894qcqb4ek14ak%40group.calendar.google.com&amp;color=%232952A3&amp;src=mmd97qhb2slvg23tefbd973il0%40group.calendar.google.com&amp;color=%23182C57&amp;src=9g0v0obf22rn7kq3d9rtv4v954%40group.calendar.google.com&amp;color=%2329527A&amp;src=u4q1957c2ri0vvo0bmuubm7p7c%40group.calendar.google.com&amp;color=%235229A3&amp;src=hqp4di24o4bevi7t2fl8s8kok8%40group.calendar.google.com&amp;color=%23333333&amp;src=fcqv73flcjil3h1mkgng619dh8%40group.calendar.google.com&amp;color=%238D6F47&amp;src=e8d93pd87sdq6gdf6n9iq49iv4%40group.calendar.google.com&amp;color=%23865A5A&amp;src=390e5cpracftqgtqm0fqtq916o%40group.calendar.google.com&amp;color=%23B1365F&amp;src=3f76iaacs3f49m0cj9apham3a4%40group.calendar.google.com&amp;color=%2342104A&amp;src=89s8b2a22f844gk5raetnrmr4o%40group.calendar.google.com&amp;color=%2323164E&amp;src=2lcdhgaoufuouiud79j4h841ek%40group.calendar.google.com&amp;color=%23865A5A&amp;src=ag9sob18dopt6442ht5nd4behs%40group.calendar.google.com&amp;color=%236B3304&amp;src=8nop3jvv6799tgq6jsr89hvlc8%40group.calendar.google.com&amp;color=%23691426&amp;src=a6kf01bm9n38jh595el7g0782c%40group.calendar.google.com&amp;color=%23711616&amp;src=5n5mpbo5r43mhmgthd5a3qn8pc%40group.calendar.google.com&amp;color=%23B1440E&amp;src=vh8qbihaln6d25e7u7rdnr10rk%40group.calendar.google.com&amp;color=%23853104&amp;src=2j2te7f1bnf4qhe21igsbe36m8%40group.calendar.google.com&amp;color=%238C500B&amp;src=am22r45g3tkddfrl4lh94vdges%40group.calendar.google.com&amp;color=%230F4B38&amp;src=6175ijtj107qvcq6ju3bfrhkks%40group.calendar.google.com&amp;color=%23125A12&amp;ctz=Asia%2FSeoul"
                                     frameborder="0"
                                     width="100%"
                                     height="100%"
                                     scrolling="no"
        ></iframe>
        </div>

    </div>
</div>

<div class="div-title"><div><span>최신자료</span></div></div>

<div id="con
nts2">
    <div id="Exam">
        <div id="Exam_text">기출문제<a href="#" class="more">+ 더보기</a></div>

    </div>
    <div id="new_post">
        <div id="new_post_text">새로운 게시글<a href="#" class="more">+ 더보기</a></div>

    </div>
</div>

<div id="main-footer">
    <div class="main-footer-wrap">
        <div><img src="./images/semiLogosize.png"/></div>
        <div>
            <ul>
                <li>고객센터 1644 – 2940 (평일 9:00 ~ 12:30, 13:30 ~ 18:00)  help@exam4you.com</li>
                <li><span>㈜합격하조</span>   <span>대표이사 유승제</span>   <span>사업자 등록번호 1004-1004</span> </li>
                <li>서울시 강남구 역삼대로</li>
            </ul>
        </div>
    </div>
</div>
<!-- yn -->
<!-- 17:07 -->
<!--호-->
<!-- 성호쓰 -->
</body>

</html>

