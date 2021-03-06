<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Fashi Template">
    <meta name="keywords" content="Fashi, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>RestFuLL | 회원가입</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/themify-icons.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>
     <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Header Section Begin -->
    <header class="header-section">
        <div class="header-top">
            <div class="container">
                <div class="ht-right">
                <button type="button" class="login-panel">
                 <a href="./rs-loginpage.jsp">로그인</a>  
                 </button>
                </div>
            </div>
         </div>
 
        <div class="container">
                <div class="inner-header">
                    <div class="row">
                        <div class="col-lg-2 col-md-2">
                            <div class="logo">
                                <a href="./rs-mainpage.jsp">
                                    <img src="img/LOGOsmall.png" alt="">
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-8 col-md-7 search-top">
                            <div class="advanced-search">
                                <div class="input-group">
                                    <input type="text" placeholder="어느 지역으로 여행을 가시나요?">
                                    <button type="button"><i class="ti-search"></i></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
        <div class="nav-item">
            <div class="container">
                <nav class="nav-menu mobile-menu">
                    <ul>
                        <li class="active"><a href="./rs-mainpage.jsp">Home</a></li>
                        <li><a href="${pageContext.request.contextPath}/write_view">글작성</a></li>
                        <li><a href="#">여행코스작성</a></li>
                        <li><a href="./rs-Servicecenter.jsp">공지사항</a></li>
                        <li><a href="#">이벤트</a></li>
                        <li><a href="./rs-Servicecenter_faq.jsp">자주하는질문</a></li>
                        <!--<li><a href="#">로그인</a></li>-->
                    </ul>
                </nav>
                <div id="mobile-menu-wrap"></div>
            </div>
        </div>
    </header>
    <!-- Header End -->

    <!-- Register Section Begin -->
    <div class="register-login-section spad">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-4" style="float: none; margin: 0 auto;">
                    <div class="register-form">
                        <h2>회 원 가 입</h2>
                        <form action="#">
                            <!--아이디 입력창-->
                            <div class="group-input">
                                <label for="username">아이디</label>
                                <input type="text" id="username" style="height: 40px; padding-left:  12px;" >
                            </div>
                            <!--비밀번호 입력창-->
                            <div class="form-group">
                                <label for="exampleInputPassword1">비밀번호</label>
                                <input type="password" class="form-control" id="exampleInputPassword1" placeholder="비밀번호 입력">
                            </div>
                            <!--비밀번호 재확인 입력창-->
                            <div class="form-group">
                                <label for="exampleInputPassword1">비밀번호 재확인</label>
                                <input type="password" class="form-control" id="exampleInputPassword1" placeholder="비밀번호 재입력">
                            </div>
                            <!--이름 입력창-->
                            <div class="group-input">
                                <label for="con-pass">이름</label>
                                <input type="text" id="con-pass" style="height: 40px; padding-left:  12px">
                            </div>
                            <!--생년월일 입력창-->
                            <div class="form-group">
                                <div class="row">
                                    <div class="col">
                                        <label for="year">년도</label>
                                        <select class="form-control" id="year" style="width: 86px">
                                            <option>1990</option>
                                            <option>1991</option>
                                            <option>1992</option>
                                            <option>1993</option>
                                            <option>1994</option>
                                            <option>1995</option>
                                            <option>1996</option>
                                            <option>1997</option>
                                            <option>1998</option>
                                            <option>1999</option>
                                        </select>
                                    </div>
                                    <div class="col">
                                        <label for="month" style="width: 50px">월</label>
                                        <select class="form-control" id="month">
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                            <option>4</option>
                                            <option>5</option>
                                            <option>6</option>
                                            <option>7</option>
                                            <option>8</option>
                                            <option>9</option>
                                            <option>10</option>
                                            <option>11</option>
                                            <option>12</option>
                                        </select>
                                    </div>
                                    <div class="col">
                                        <label for="date" style="width: 50px">일</label>
                                        <select class="form-control" id="date">
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                            <option>4</option>
                                            <option>5</option>
                                            <option>6</option>
                                            <option>7</option>
                                            <option>8</option>
                                            <option>9</option>
                                            <option>10</option>
                                            <option>11</option>
                                            <option>12</option>
                                            <option>13</option>
                                            <option>14</option>
                                            <option>15</option>
                                            <option>16</option>
                                            <option>17</option>
                                            <option>18</option>
                                            <option>19</option>
                                            <option>20</option>
                                            <option>21</option>
                                            <option>22</option>
                                            <option>23</option>
                                            <option>24</option>
                                            <option>25</option>
                                            <option>26</option>
                                            <option>27</option>
                                            <option>28</option>
                                            <option>29</option>
                                            <option>30</option>
                                            <option>31</option>
                                        </select>
                                    </div>
                                </div>
                                <!--성별 입력창-->
                                <br />
                                <div class="row">
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <div class="form-check col" style="width: 100px">
                                        <input class="form-check-input" type="radio" name="gender" id="exampleRadios1" value="man" checked>
                                        <label class="form-check-label" for="exampleRadios1">
                                            남자
                                        </label>
                                    </div>
                                    <div class="form-check col">
                                        <input class="form-check-input" type="radio" name="gender" id="exampleRadios2" value="woman">
                                        <label class="form-check-label" for="exampleRadios2">
                                            여자
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <!--이메일 입력창-->
                            <div class="form-group">
                                <label for="exampleInputEmail1">이메일</label>
                                <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="이메일주소 입력">
                                <small id="emailHelp" class="form-text text-muted">이메일 공유하지 마세요~</small>
                            </div>
                            <!--휴대폰 번호 입력창-->
                            <div class="group-input">
                                <label for="con-pass">핸드폰 번호</label>
                                <input type="text" id="con-pass" style="height: 40px; padding-left: 12px; margin-bottom: 10px">
                                <div class="row">
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <div class="col-xs-3">
                                        <input type="text" id="con-pass" style="height: 40px; padding-left: 12px">
                                    </div>
                                    <div class="col-xs-1"></div>
                                </div>
                            </div>
                           <button type="submit" class="site-btn register-btn"><a href="./rs-registerFinish.jsp">회원가입</a></button>
                        </form>


                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Register Form Section End -->
    

    <!-- Footer Section Begin -->
    <footer class="footer-section" >
        <div class="container">
            <div class="row">
                <div class="col-lg-1">
                </div>
                <div class="col-lg-3">
                    <div class="footer-left">
                        <div class="footer-logo">
                            <a href="#"><img src="img/LOGOsmall.png" alt=""></a>
                        </div>
                        <ul>
                            <li>Address: 60-49 Road 11378 New York</li>
                            <li>Phone: +65 11.188.888</li>
                            <li>Email: hello.colorlib@gmail.com</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-2 offset-lg-1">
                    <div class="footer-widget">
                        <h5>Information</h5>
                        <ul>
                            <li><a href="./rs-comapnyinfo.jsp">회사소개</a></li>
                            <li><a href="#">이용약관</a></li>
                            <li><a href="#">여행지등록</a></li>
                            <li><a href="./rs-Servicecenter.jsp">고객센터</a></li>
                            <li><a href="./rs-Servicecenter_personal.jsp"><b>개인정보처리방침</b></a></li>
                            <li><a href="#">위치기반서비스이용약관</a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-lg-4">
                    <div class="newslatter-item">
                        <h5>새로운 소식 받기</h5>
                        <p>Get E-mail updates about our latest shop and special offers.</p>
                        <form action="#" class="subscribe-form">
                            <input type="text" placeholder="Enter Your Mail">
                            <button type="button">Subscribe</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="copyright-reserved">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="copyright-text">
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            Copyright &copy;<script>
                                document.write(new Date().getFullYear());
                            </script> 2020 RestFuLL. All rights reserved.
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        </div>
                        <div class="payment-pic">
                            <img src="img/payment-method.png" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.countdown.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery.zoom.min.js"></script>
    <script src="js/jquery.dd.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>
</body>
</html>