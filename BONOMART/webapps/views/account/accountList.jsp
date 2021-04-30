<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>거래처 조회</title>
<script src="/bono/assets/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
        integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

<!-- css 파일 삽입 -->
<link rel="stylesheet" href="/bono/assets/css/header.css">
<link rel="stylesheet" href="/bono/assets/css/accountList.css">

<style>
      input-group mb-3 {
         margin-left : auto;
         margin-right : auto;
         width: 600px;
      }
</style>

</head>
<body>
<!-- 헤더 영역 추가 -->
<%@ include file="/views/common/header.jsp" %>

                <!-- header 영역과 게시판 영역 사이 공간 -->
                <div style="padding-top: 50px; padding-bottom: 50px;"></div>

                <h3 style="text-align: center;">거래처 조회</h3>
                
                <!-- 조회 페이지의 서치 바 -->
                <div class="input-group mb-3" style="margin-left : auto;
                  margin-right : auto; width: 600px;">
                    <input type="text" class="form-control" placeholder="검색할 데이터를 입력하세요.." aria-label="Recipient's username" aria-describedby="button-addon2">
                    <!-- 검색 버튼 -->
                    <div class="btn-group">
                       <button type="button" class="btn btn-primary">검색</button>
                       <button type="button" class="btn btn-primary dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                         <span class="sr-only">Toggle Dropdown</span>
                       </button>
                       <div class="dropdown-menu">
                               <a class="dropdown-item" href="#">거래처 코드 기준 정렬</a>
                               <div class="dropdown-divider"></div>
                               <a class="dropdown-item" href="#">거래처 명 기준 정렬</a>
                               <div class="dropdown-divider"></div>
                               <a class="dropdown-item" href="#">담당자명 기준 정렬</a>
                               <div class="dropdown-divider"></div>
                               <a class="dropdown-item" href="#">전화번호 기준 정렬</a>
                               <div class="dropdown-divider"></div>
                               <a class="dropdown-item" href="#">이체 정보 기준 정렬</a>
                        </div>
                  </div>
                  <!-- 검색 버튼 끝 -->
            </div>
            <!-- 서치 바 끝 -->
                
                 <!-- 추가한 상품들을 나열하여 보여주는 테이블 -->
                <table class="table table-hover text-center">
                    <thead>
                        <tr data-target=".modal" data-toggle="modal">
                            <th>#</th>
                            <th>거래처 코드</th>
                            <th>거래처 명</th>
                            <th>담당자 명</th>
                            <th>전화번호</th>
                            <th>거래처 주소</th>
                            <th>사용 처리</th>
                            <th>이체 정보</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr data-target=".modal" data-toggle="modal">
                            <td>1</td>
                            <td>No.12321</td>
                            <td>A203</td>
                            <td>B203</td>
                            <td>1,000</td>
                            <td>2021-04-26</td>
                            <td>400,000,000</td>
                            <td>마진석</td>
                        </tr>
                        <tr data-target=".modal" data-toggle="modal">
                            <td>2</td>
                            <td>No.12321</td>
                            <td>A203</td>
                            <td>B203</td>
                            <td>1,000</td>
                            <td>2021-04-26</td>
                            <td>400,000,000</td>
                            <td>마진석</td>
                        </tr>
                        <tr data-target=".modal" data-toggle="modal">
                            <td>3</td>
                            <td>No.12321</td>
                            <td>A203</td>
                            <td>B203</td>
                            <td>1,000</td>
                            <td>2021-04-26</td>
                            <td>400,000,000</td>
                            <td>마진석</td>
                        </tr>
                        <tr data-target=".modal" data-toggle="modal">
                            <td>4</td>
                            <td>No.12321</td>
                            <td>A203</td>
                            <td>B203</td>
                            <td>1,000</td>
                            <td>2021-04-26</td>
                            <td>400,000,000</td>
                            <td>마진석</td>
                        </tr>
                        <tr data-target=".modal" data-toggle="modal">
                            <td>5</td>
                            <td>No.12321</td>
                            <td>A203</td>
                            <td>B203</td>
                            <td>1,000</td>
                            <td>2021-04-26</td>
                            <td>400,000,000</td>
                            <td>마진석</td>
                        </tr>
                        <tr data-target=".modal" data-toggle="modal">
                            <td>6</td>
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
                <!-- 삭제 버튼 클릭 시, 팝업될 모달창 -->
                <div class="modal" tabindex="-1">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">등록한 거래처 데이터 삭제</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <p>정말 삭제하시겠습니까??</p>
                                <p>삭제 후, 다시 등록하셔야 합니다.</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary">삭제</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 모달 끝 -->

                </tbody>
                </table>
                <!-- 게시판 영역과 page nation 영역 사이 공간 -->
                <div style="padding-top: 30px; padding-bottom: 30px;"></div>

                <!-- 페이지 네이션 시작 -->
                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center">
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
                <!-- 페이지 네이션 끝 -->
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