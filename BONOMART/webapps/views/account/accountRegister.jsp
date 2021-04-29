<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>거래처 등록 페이지</title>
<script src="/bono/assets/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

<!-- css 파일 삽입 -->
<link rel="stylesheet" href="/bono/assets/css/header.css">
<link rel="stylesheet" href="/bono/assets/css/accountRegister.css">

</head>
<body>
<!-- 헤더 영역 추가 -->
<%@ include file="/views/common/header.jsp" %>

                <!-- 데이터 입력 -->
                <div class="wrapper">
                    <div class="container sub-contents">
                        <h3>거래처 관리</h3>

                        <!-- 거래처 등록을 위한 폼 -->
                        <div class="product_select">
                            <form action="" type="POST">
                                <div class="select">
                                    <div class="item">
                                        <div>
                                            담당자 명&nbsp;&nbsp;&nbsp;<div class="col-sm-8"><input type="text" class="form-control"></div>
                                        </div>
                                        <div>
                                            거래처 명&nbsp;&nbsp;&nbsp;<div class="col-sm-8"><input type="text" class="form-control"></div>
                                        </div>
                                        <div>
                                            거래처 코드 <div class="col-sm-8"><input type="text" class="form-control"></div>
                                        </div>
                                    </div>

                                    <div class="item" id="ss">
                                        <div>
                                            주소&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<div class="col-sm-8"><input type="text" class="form-control"></div>
                                        </div>
                                        <div>
                                            이체 정보 <div class="col-sm-8"><input type="text" class="form-control"></div>
                                        </div>
                                        <div>
                                            사용 처리 <div class="col-sm-8"><input type="number" class="form-control"></div>
                                        </div>
                                    </div>
                                </div>
                            </form>

                            <!-- 상품 하단 리스트 등록 버튼 및 하단 리스트에 원하는 상품 검색할 수 있는 검색버튼 -->
                            <div class="submit_btn">
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
                                        <th>거래처 코드</th>
                                        <th>거래처 명</th>
                                        <th>담당자 명</th>
                                        <th>전화 번호</th>
                                        <th>주소</th>
                                        <th>사용 처리</th>
                                        <th>이체 정보</th>
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
                           
                                <!-- 등록 버튼 클릭 시, 팝업될 모달창 -->
                                <div class="modal" tabindex="-1">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title">거래처 데이터 등록</h5>
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
                                                    onclick="location.href='http://127.0.0.1:5500/views/accountList.html'">등록</button>
                                                <button type="button" class="btn btn-secondary"
                                                    data-dismiss="modal">취소</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <script>
                        $('#modal_btn').on('click', function () {
                            $('##modify_product').modal();
                        });
                    </script>
                    <!-- 게시판 끝 -->
                    <!-- 푸터 영역 추가 -->
					<%@ include file="../common/footer.jsp" %>
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