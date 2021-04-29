<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>발주 등록 페이지</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

<!-- css 파일 삽입 -->
<link rel="stylesheet" href="/bono/assets/css/header.css">
<link rel="stylesheet" href="/bono/assets/css/orderRegister.css">

</head>
<body>
		
		<div id="wrap" class="wrap">
        <div class="content">
            <div class="aside bg-gradient-sidebar">
                <ul class="sidebar-nav">
                    <li class="sidebar-brand">
                        <a href="#">BONO MART</a>
                    </li>
                    <hr>
                    <li>
                        <a href="#">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-house-fill" viewBox="0 0 16 16">
                                <path fill-rule="evenodd"
                                    d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6zm5-.793V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z" />
                                <path fill-rule="evenodd"
                                    d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z" />
                            </svg>
                            &nbsp; 메인페이지
                            <hr class="sidebar-divider">
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-puzzle-fill" viewBox="0 0 16 16">
                                <path
                                    d="M3.112 3.645A1.5 1.5 0 0 1 4.605 2H7a.5.5 0 0 1 .5.5v.382c0 .696-.497 1.182-.872 1.469a.459.459 0 0 0-.115.118.113.113 0 0 0-.012.025L6.5 4.5v.003l.003.01c.004.01.014.028.036.053a.86.86 0 0 0 .27.194C7.09 4.9 7.51 5 8 5c.492 0 .912-.1 1.19-.24a.86.86 0 0 0 .271-.194.213.213 0 0 0 .036-.054l.003-.01v-.008a.112.112 0 0 0-.012-.025.459.459 0 0 0-.115-.118c-.375-.287-.872-.773-.872-1.469V2.5A.5.5 0 0 1 9 2h2.395a1.5 1.5 0 0 1 1.493 1.645L12.645 6.5h.237c.195 0 .42-.147.675-.48.21-.274.528-.52.943-.52.568 0 .947.447 1.154.862C15.877 6.807 16 7.387 16 8s-.123 1.193-.346 1.638c-.207.415-.586.862-1.154.862-.415 0-.733-.246-.943-.52-.255-.333-.48-.48-.675-.48h-.237l.243 2.855A1.5 1.5 0 0 1 11.395 14H9a.5.5 0 0 1-.5-.5v-.382c0-.696.497-1.182.872-1.469a.459.459 0 0 0 .115-.118.113.113 0 0 0 .012-.025L9.5 11.5v-.003l-.003-.01a.214.214 0 0 0-.036-.053.859.859 0 0 0-.27-.194C8.91 11.1 8.49 11 8 11c-.491 0-.912.1-1.19.24a.859.859 0 0 0-.271.194.214.214 0 0 0-.036.054l-.003.01v.002l.001.006a.113.113 0 0 0 .012.025c.016.027.05.068.115.118.375.287.872.773.872 1.469v.382a.5.5 0 0 1-.5.5H4.605a1.5 1.5 0 0 1-1.493-1.645L3.356 9.5h-.238c-.195 0-.42.147-.675.48-.21.274-.528.52-.943.52-.568 0-.947-.447-1.154-.862C.123 9.193 0 8.613 0 8s.123-1.193.346-1.638C.553 5.947.932 5.5 1.5 5.5c.415 0 .733.246.943.52.255.333.48.48.675.48h.238l-.244-2.855z" />
                            </svg>
                            &nbsp; 상품관리
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-journal-bookmark-fill" viewBox="0 0 16 16">
                                <path fill-rule="evenodd"
                                    d="M6 1h6v7a.5.5 0 0 1-.757.429L9 7.083 6.757 8.43A.5.5 0 0 1 6 8V1z" />
                                <path
                                    d="M3 0h10a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-1h1v1a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v1H1V2a2 2 0 0 1 2-2z" />
                                <path
                                    d="M1 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1z" />
                            </svg>
                            &nbsp; 판매관리
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-chat-square-text" viewBox="0 0 16 16">
                                <path
                                    d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1h-2.5a2 2 0 0 0-1.6.8L8 14.333 6.1 11.8a2 2 0 0 0-1.6-.8H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h2.5a1 1 0 0 1 .8.4l1.9 2.533a1 1 0 0 0 1.6 0l1.9-2.533a1 1 0 0 1 .8-.4H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z" />
                                <path
                                    d="M3 3.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM3 6a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9A.5.5 0 0 1 3 6zm0 2.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5z" />
                            </svg>
                            &nbsp; 발주관리
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-basket2-fill" viewBox="0 0 16 16">
                                <path
                                    d="M5.929 1.757a.5.5 0 1 0-.858-.514L2.217 6H.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h.623l1.844 6.456A.75.75 0 0 0 3.69 15h8.622a.75.75 0 0 0 .722-.544L14.877 8h.623a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1.717L10.93 1.243a.5.5 0 1 0-.858.514L12.617 6H3.383L5.93 1.757zM4 10a1 1 0 0 1 2 0v2a1 1 0 1 1-2 0v-2zm3 0a1 1 0 0 1 2 0v2a1 1 0 1 1-2 0v-2zm4-1a1 1 0 0 1 1 1v2a1 1 0 1 1-2 0v-2a1 1 0 0 1 1-1z" />
                            </svg>
                            &nbsp; 재고관리
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-diagram-3-fill" viewBox="0 0 16 16">
                                <path fill-rule="evenodd"
                                    d="M6 3.5A1.5 1.5 0 0 1 7.5 2h1A1.5 1.5 0 0 1 10 3.5v1A1.5 1.5 0 0 1 8.5 6v1H14a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-1 0V8h-5v.5a.5.5 0 0 1-1 0V8h-5v.5a.5.5 0 0 1-1 0v-1A.5.5 0 0 1 2 7h5.5V6A1.5 1.5 0 0 1 6 4.5v-1zm-6 8A1.5 1.5 0 0 1 1.5 10h1A1.5 1.5 0 0 1 4 11.5v1A1.5 1.5 0 0 1 2.5 14h-1A1.5 1.5 0 0 1 0 12.5v-1zm6 0A1.5 1.5 0 0 1 7.5 10h1a1.5 1.5 0 0 1 1.5 1.5v1A1.5 1.5 0 0 1 8.5 14h-1A1.5 1.5 0 0 1 6 12.5v-1zm6 0a1.5 1.5 0 0 1 1.5-1.5h1a1.5 1.5 0 0 1 1.5 1.5v1a1.5 1.5 0 0 1-1.5 1.5h-1a1.5 1.5 0 0 1-1.5-1.5v-1z" />
                            </svg>
                            &nbsp; 거래처관리
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-person-fill" viewBox="0 0 16 16">
                                <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
                            </svg>
                            &nbsp; 회원관리
                        </a>
                    </li>

                </ul>
            </div>
            <div class="main-wrapper">
                <div id="main">
                    <div class="header bg-gradient-topbar">
                        <p id="headerUserName"><b>관리자</b></p>
                        <span id="headerIconWrapper">
                            <i class="fa fa-user-circle" aria-hidden="true" id="headerIcon"></i>
                        </span>
                    </div>
                </div>

                <!-- 데이터 입력 -->
                <div class="wrapper">
                    <div class="container sub-contents">
                        <h3>발주 관리</h3>

                        <!-- 발주 등록을 위한 폼 -->
                        <div class="product_select">
                            <form action="" type="POST">
                                <div class="select">
                                    <div class="item">
                                        <div>
                                            발주 번호 <div class="col-sm-8"><input type="text" class="form-control"></div>
                                        </div>
                                        <div>
                                            발주상품코드 <div class="col-sm-8"><input type="text" class="form-control"></div>
                                        </div>
                                        <div>
                                            거래처 코드 <div class="col-sm-8"><input type="text" class="form-control"></div>
                                        </div>
                                        <div>
                                            담당자명 <div class="col-sm-8"><input type="text" class="form-control"></div>
                                        </div>
                                    </div>

                                    <div class="item" id="ss">
                                        <div>
                                            발주 수량 <div class="col-sm-8"><input type="number" class="form-control"></div>
                                        </div>
                                        <div>
                                            발주 일자 <div class="col-sm-8"><input type="date" class="form-control"></div>
                                        </div>
                                        <div>
                                            총 금액 <div class="col-sm-8"><input type="number" class="form-control"></div>
                                        </div>
                                    </div>
                                </div>
                            </form>

                            <!-- 상품 하단 리스트 등록 버튼 및 하단 리스트에 원하는 상품 검색할 수 있는 검색버튼 -->
                            <div class="submit_btn">
                                <!-- 검색버튼 -->
                                <div class="search">
                                    <button type="button" class="btn btn-secondary">검색하기</button>
                                </div>

                                <!-- 등록버튼 -->
                                <div class="plus">
                                    <button type="button" class="btn btn-primary">추가하기</button>
                                </div>
                            </div>
                        </div>
                        <p></p>

                        <!-- 추가한 상품들을 나열하여 보여주는 테이블 -->
                        <div class="scrollable">
                            <table class="table table-hover text-center">

                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>발주번호</th>
                                        <th>발주상품 코드</th>
                                        <th>거래처 코드</th>
                                        <th>발주 수량</th>
                                        <th>발주 일자</th>
                                        <th>총 금액</th>
                                        <th>담당자</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>No.12321</td>
                                        <td>A203</td>
                                        <td>B203</td>
                                        <td>1,000</td>
                                        <td>2021-04-26</td>
                                        <td>400,000,000</td>
                                        <td>마진석</td>
                                    </tr>

                                    <tr>
                                        <td>1</td>
                                        <td>No.12321</td>
                                        <td>A203</td>
                                        <td>B203</td>
                                        <td>1,000</td>
                                        <td>2021-04-26</td>
                                        <td>400,000,000</td>
                                        <td>마진석</td>
                                    </tr>

                                    <tr>
                                        <td>1</td>
                                        <td>No.12321</td>
                                        <td>A203</td>
                                        <td>B203</td>
                                        <td>1,000</td>
                                        <td>2021-04-26</td>
                                        <td>400,000,000</td>
                                        <td>마진석</td>
                                    </tr>

                                    <tr>
                                        <td>1</td>
                                        <td>No.12321</td>
                                        <td>A203</td>
                                        <td>B203</td>
                                        <td>1,000</td>
                                        <td>2021-04-26</td>
                                        <td>400,000,000</td>
                                        <td>마진석</td>
                                    </tr>

                                    <tr>
                                        <td>1</td>
                                        <td>No.12321</td>
                                        <td>A203</td>
                                        <td>B203</td>
                                        <td>1,000</td>
                                        <td>2021-04-26</td>
                                        <td>400,000,000</td>
                                        <td>마진석</td>
                                    </tr>

                                    <tr>
                                        <td>1</td>
                                        <td>No.12321</td>
                                        <td>A203</td>
                                        <td>B203</td>
                                        <td>1,000</td>
                                        <td>2021-04-26</td>
                                        <td>400,000,000</td>
                                        <td>마진석</td>
                                    </tr>

                                    <tr>
                                        <td>1</td>
                                        <td>No.12321</td>
                                        <td>A203</td>
                                        <td>B203</td>
                                        <td>1,000</td>
                                        <td>2021-04-26</td>
                                        <td>400,000,000</td>
                                        <td>마진석</td>
                                    </tr>

                                    <tr>
                                        <td>1</td>
                                        <td>No.12321</td>
                                        <td>A203</td>
                                        <td>B203</td>
                                        <td>1,000</td>
                                        <td>2021-04-26</td>
                                        <td>400,000,000</td>
                                        <td>마진석</td>
                                    </tr>

                                    <tr>
                                        <td>1</td>
                                        <td>No.12321</td>
                                        <td>A203</td>
                                        <td>B203</td>
                                        <td>1,000</td>
                                        <td>2021-04-26</td>
                                        <td>400,000,000</td>
                                        <td>마진석</td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>No.12321</td>
                                        <td>A203</td>
                                        <td>B203</td>
                                        <td>1,000</td>
                                        <td>2021-04-26</td>
                                        <td>400,000,000</td>
                                        <td>마진석</td>
                                    </tr>

                                    <tr>
                                        <td>1</td>
                                        <td>No.12321</td>
                                        <td>A203</td>
                                        <td>B203</td>
                                        <td>1,000</td>
                                        <td>2021-04-26</td>
                                        <td>400,000,000</td>
                                        <td>마진석</td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>No.12321</td>
                                        <td>A203</td>
                                        <td>B203</td>
                                        <td>1,000</td>
                                        <td>2021-04-26</td>
                                        <td>400,000,000</td>
                                        <td>마진석</td>
                                    </tr>

                                    <tr>
                                        <td>1</td>
                                        <td>No.12321</td>
                                        <td>A203</td>
                                        <td>B203</td>
                                        <td>1,000</td>
                                        <td>2021-04-26</td>
                                        <td>400,000,000</td>
                                        <td>마진석</td>
                                    </tr>
                                </tbody>

                            </table>
                        </div>

                        <!-- 실제 DB에 저장하는 등록버튼 및 등록 전 수정할 수 있는 수정버튼 -->
                        <div class="final_btn">
                            <div class="submit_btn">
                                <button type="button" class="btn btn-success" data-target=".modal"
                                    data-toggle="modal">등록하기</button>
                            </div>

                            <!-- 모달창을 화면에 띄움 -->
                            <div class="modify_btn">
                                <button type="button" class="btn btn-warning" id="modal_btn">수정하기</button>

                                <!-- 삭제 버튼 클릭 시, 팝업될 모달창 -->
                                <div class="modal" tabindex="-1">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title">발주 데이터 등록</h5>
                                                <button type="button" class="close" data-dismiss="modal"
                                                    aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <p>정말 등록하시겠습니까??</p>
                                                <p>등록 후, 조회 페이지로 이동합니다.</p>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-primary"
                                                    onclick="location.href='http://127.0.0.1:5500/views/orderList.html'">등록</button>
                                                <button type="button" class="btn btn-secondary"
                                                    data-dismiss="modal">취소</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- 모달 끝 -->
                            </div>
                        </div>
                    </div>

                    <script>
                        $('#modal_btn').on('click', function () {
                            $('##modify_product').modal();
                        });
                    </script>
                    <!-- 게시판 끝 -->
                </div>
            </div>
        </div>

        <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
            crossorigin="anonymous"></script>

</body>
</html>