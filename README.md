# HH_SHOP 쇼핑몰 프로젝트
## 환경
+ Spring
+ Windows 10
+ JDK 1.8
+ Tomcat 9.0
+ Eclipse
+ Oracle
+ Encoding: UTF-8

## 사용 API
+ 다음 API 주소찾기

## Oracle 테이블 생성
```
CREATE TABLE S_MEMBER(
  memberId VARCHAR2(50), --아이디
  memberPw VARCHAR2(100) NOT NULL, --비밀번호
  memberName VARCHAR2(30) NOT NULL,--이름
  memberMail VARCHAR2(100) NOT NULL, --메일
  memberAddr1 VARCHAR2(100) NOT NULL, -- 우편번호
  memberAddr2 VARCHAR2(100) NOT NULL, -- 사는 지역
  memberAddr3 VARCHAR2(100) NOT NULL, --상세주소
  adminCk NUMBER NOT NULL, -- 관리자 여부 , 0=일반 1=관리자
  regDate DATE NOT NULL, -- 등록 날짜
  money number NOT NULL, --회원 돈
  point number NOT NULL, --회원 포인트
  PRIMARY KEY(memberId)
);
```
```
CREATE TABLE product(
    product_id NUMBER NOT NULL,
    product_name VARCHAR2(200) NOT NULL,
    product_price NUMBER(10) NOT NULL,
    product_size VARCHAR2(50) NOT NULL,
    product_color VARCHAR2(50) NOT NULL,
    product_main_img VARCHAR2(500) NOT NULL,
    product_detail_img VARCHAR2(500) NOT NULL,
    product_detail VARCHAR2(500),
    product_category VARCHAR2(20) NOT NULL,
    product_url VARCHAR2(100) NOT NULL,
    product_stock NUMBER(10),
    product_new number(3),
    hit number default 0,
    regDate DATE DEFAULT SYSDATE,
   updateDate DATE DEFAULT SYSDATE,
    PRIMARY KEY(product_id)
);
```
```
create table qna_reply (
    product_id number not null,
    qna_rno number not null,
    qna varchar2(1000) not null,
    writer varchar2(50) not null,
    regdate date default sysdate,
    primary key(product_id, qna_rno)
);
```
```
create table review_reply (         --리뷰
    product_id number not null,
    review_rno number not null,
    review varchar2(1000) not null,
    writer varchar2(50) not null,
    regdate date default sysdate,
    primary key(product_id, review_rno)
);
```
```
create table card(
    cardNumber number not null, -- 카드번호 (primary key)
    memberId  VARCHAR2(50) not null, -- 소유한 회원 아이디 (카드 정보 조회, 분실신고시)
    ano number not null, -- 계좌 번호 (연결된 계좌 비밀번호 확인)
    CVCNumber varchar2(50) not null, -- CVC번호
    cardCompany varchar2(50) not null, -- 카드사
    cardValidityPeriod varchar2(50) not null, -- 유효기간
    primary key(cardNumber)
);
```
```
create table payment(
    pno number not null, -- 결제 정보 고유번호 (primary key)
    memberId  VARCHAR2(50) not null, -- 회원 아이디 (로그인 계정을 확인하기 위해)
    product_id number not null, -- 구매한 상품 (ProductVO를 받아오기 위해)
    payDate DATE not null, -- 구매 날짜
    shippingFee number, -- 배송비 (상품 사이즈, 배송지 위치에 따라 달라지게 할지?)
    payMoney number not null, -- 결제 금액
    payPoint number, -- 적립 포인트 (회원만)
    primary key(pno)
);
```
```
create table Notice(
    adminCk number,                                 -- 관리자 체크
    bno number generated always as IDENTITY,        -- 게시판 번호
    title varchar2(150) not null,                   -- 게시판 제목
    content varchar2(2000) not null,                -- 게시판 내용
    writer varchar2(50) not null,                   -- 게시판 작성자
    regDate date default sysdate,                   -- 게시판 등록날짜
    constraint pk_notice PRIMARY key(bno)
);
```
```
create table delivery_view(
    deliveryNumber number not null, -- 송장 번호 (primary key)
    pno number, -- 배송조회할 상품 결제내역
    memberName varchar2(50) not null, -- 받는 분
    memberAddr1 varchar2(100) not null, -- 배송주소
    memberAddr2 varchar2(100) not null, -- 배송주소
    memberAddr3 varchar2(100), -- 배송주소
    deliveryMemo varchar2(300), -- 배송 요청사항
    deliveryReceive varchar2(100), -- 상품수령방법
    primary key(deliveryNumber)
);
```
## 구현한 기능
### 1. 회원가입
+ 아이디 중복 검사
![화면 캡처 2021-09-19 142905](https://user-images.githubusercontent.com/81894310/133916562-a453ab82-ba76-491b-98a6-6c864da39686.jpg)

+ BCrypt를 이용한 비밀번호 암호화
![화면 캡처 2021-09-19 142146](https://user-images.githubusercontent.com/81894310/133916459-8f8c1603-5631-4781-9976-5c74f7f78027.jpg)

+ 이메일 인증
![화면 캡처 2021-09-19 142212](https://user-images.githubusercontent.com/81894310/133916489-305e5051-b5cf-44e1-ab4a-ddfa8fc546aa.jpg)

+ 다음 API를 이용한 주소 찾기
![화면 캡처 2021-09-19 142228](https://user-images.githubusercontent.com/81894310/133916497-2ff38a73-1c00-494f-8d95-0789eb193bea.jpg)
### 2. 로그인
+ 로그인 및 로그아웃
![화면 캡처 2021-09-19 143254](https://user-images.githubusercontent.com/81894310/133916648-839e31e3-db0b-4acb-9de4-2b7c90b000db.jpg)

+ 아이디 찾기
![화면 캡처 2021-09-19 143315](https://user-images.githubusercontent.com/81894310/133916654-b26aec73-1684-4a8b-bacc-bcc525ab4bad.jpg)

+ 비밀번호 찾기(변경)
![화면 캡처 2021-09-19 143333](https://user-images.githubusercontent.com/81894310/133916668-b4bb17df-57a8-4da8-ba52-c7be2f7537c9.jpg)

+ 마이페이지
![화면 캡처 2021-09-19 143351](https://user-images.githubusercontent.com/81894310/133916687-18ee409a-6a71-44bb-a457-5a369c2e5b6e.jpg)

+ 회원 탈퇴
![화면 캡처 2021-09-19 143419](https://user-images.githubusercontent.com/81894310/133916698-705c5f26-55c1-4fd3-b7e3-9bcc8d50ed4b.jpg)

### 3. 메인페이지
+ 메인 화면
![화면 캡처 2021-09-19 143942](https://user-images.githubusercontent.com/81894310/133916793-53a94e87-0a7e-4f67-8316-9c254d6ba82e.jpg)

+ 상품 목록
![화면 캡처 2021-09-19 144058](https://user-images.githubusercontent.com/81894310/133916824-d27004dc-f560-4e65-bc3a-4a352f02e3a0.jpg)

+ 상품 등록 (관리자)
![화면 캡처 2021-09-19 144112](https://user-images.githubusercontent.com/81894310/133916828-88356015-13ec-422f-bdaf-3e57c1624351.jpg)

+ 상세 페이지
![화면 캡처 2021-09-19 144302](https://user-images.githubusercontent.com/81894310/133916855-2bdc54b3-d477-4463-8537-da7cdccdb8da.jpg)

+ 리뷰 및 Q&A
![화면 캡처 2021-09-19 144426](https://user-images.githubusercontent.com/81894310/133916870-c24e6f26-6a0d-4d1c-a0d0-b79e3422990d.jpg)

### 4. 게시판
+ 회원 게시판 
![화면 캡처 2021-09-19 144911](https://user-images.githubusercontent.com/81894310/133916991-2ad96c25-bfe2-4b9b-81ee-2b9806959147.jpg)

+ 관리자 게시판 화면
![화면 캡처 2021-09-19 144721](https://user-images.githubusercontent.com/81894310/133917000-fbc28dca-12fb-49ee-bc23-3b074a122b01.jpg)

+ 관리자 게시판(공지) 글쓰기
![화면 캡처 2021-09-19 145105](https://user-images.githubusercontent.com/81894310/133917029-cea1d623-0036-4866-9416-fda54f8a4d20.jpg)



