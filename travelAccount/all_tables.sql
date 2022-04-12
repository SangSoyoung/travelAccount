-- 사용자 계정 생성(travel_ssy / travel_ssy)
CREATE USER travel_ssy IDENTIFIED BY travel_ssy
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;
-- 계정 LOCK 해제
ALTER USER travel_ssy ACCOUNT UNLOCK; 
-- 계정 패스워드 설정
ALTER USER travel_ssy IDENTIFIED BY travel_ssy; 
-- 사용자 권한 부여(접속권한, DBA 권한)
GRANT CONNECT, DBA TO travel_ssy;
SELECT * FROM ALL_USERS;
COMMIT;

-- 첨부파일 -----------------------------------
DROP TABLE tbl_attach;
SELECT * FROM tbl_attach;
CREATE TABLE tbl_attach (
    uuid varchar2(100) not null,
    uploadPath varchar2(200) not null,
    fileName varchar2(100) not null,
    filetype CHAR(1),
    boardNo number(10,0),
    travelNo number(10,0),
    accountNo number(10,0)
);
SELECT * FROM tbl_attach WHERE boardNo=206 AND rownum = 1;

ALTER TABLE tbl_attach ADD CONSTRAINT pk_attach PRIMARY KEY (uuid);
ALTER TABLE tbl_attach ADD CONSTRAINT fk_board_attach FOREIGN KEY(boardNo) REFERENCES tbl_board(boardNo);
ALTER TABLE tbl_attach ADD CONSTRAINT fk_travel_attach FOREIGN KEY(travelNo) REFERENCES tbl_travel(travelNo);
ALTER TABLE tbl_attach ADD CONSTRAINT fk_account_attach FOREIGN KEY(accountNo) REFERENCES tbl_account(accountNo);
commit;

-- 여행 프로필 -----------------------------------
DROP SEQUENCE sq_travel;
DROP TABLE tbl_travel;
CREATE SEQUENCE sq_travel;
CREATE TABLE tbl_travel(
    travelNo number(10,0), -- 여행번호
    id varchar2(30) NOT NULL, -- 아이디
    title varchar2(100) NOT NULL, -- 여행제목
    memo varchar2(300), -- 여행메모
    area varchar2(30), -- 지역
    startDate date, -- 시작일
    endDate date, -- 종료일
    regDate date DEFAULT SYSDATE, -- 등록일
    updateDate date DEFAULT SYSDATE, -- 수정일
    CONSTRAINT pk_travel PRIMARY KEY(travelNo),
    CONSTRAINT fk_travel_member FOREIGN KEY(id) 
        REFERENCES tbl_member(id) on delete cascade
);
ALTER TABLE tbl_travel DROP COLUMN photo;
DESC tbl_travel;
SELECT * FROM tbl_travel;

-- 입력
INSERT INTO tbl_travel 
(travelNo, id, title, memo, area, startDate, endDate)
VALUES
(SQ_TRAVEL.nextval, 'aaa', 'travel2', 'test', '전주', '2022-04-06', '2022-04-13');
COMMIT;


-- 가계부 -----------------------------------

CREATE SEQUENCE sq_account;
CREATE TABLE tbl_account(
    accountNo number(10,0), -- 등록번호
    travelNo number(10,0) NOT NULL, -- 여행번호
    type CHAR(1) NOT NULL, -- 유형(예산:0, 지출:1) 
    title varchar2(100) NOT NULL, -- 항목명
    memo varchar2(300), -- 메모
    money number(10) DEFAULT 0, -- 금액
    prepMoney CHAR(1) DEFAULT 0, -- 준비비용x:0, 준비비용o:1
    method CHAR(1), -- 지불방식(현금:0, 카드:1)
    category varchar2(30), -- 카테고리
    dateTime date, -- 일시
    plat varchar2(30), -- 위도(위치정보)
    plng varchar2(30), -- 경도(위치정보)
    regDate date DEFAULT SYSDATE, -- 등록일
    updateDate date DEFAULT SYSDATE, -- 수정일
    CONSTRAINT pk_account PRIMARY KEY(accountNo),
    CONSTRAINT fk_account_travel FOREIGN KEY(travelNo) 
        REFERENCES tbl_travel(travelNo) on delete cascade
);
DESC tbl_account;
SELECT * FROM tbl_account;

-- 등록
INSERT INTO tbl_account
    (accountNo, travelNo, type, title, memo, money, prepMoney, method, category, dateTime, plat, plng)
VALUES 
    (SQ_ACCOUNT.nextval, 1, 1, '점심', '김밥맛있네', 2000, 0, 0, '식비', '', '', '');
COMMIT;


-- 게시물 -----------------------------------
CREATE SEQUENCE sq_board;
CREATE TABLE tbl_board(
    boardNo number(10,0), 
    category varchar2(30) NOT NULL, 
    area varchar2(30), 
    title varchar2(100) NOT NULL, 
    content varchar2(1000) NOT NULL, 
    writer varchar2(30) NOT NULL, 
    plat varchar2(30), 
    plng varchar2(30), 
    regDate date DEFAULT SYSDATE, 
    updateDate date DEFAULT SYSDATE, 
    scrapCnt number(5) DEFAULT 0, 
    replyCnt number(5) DEFAULT 0, 
    CONSTRAINT pk_board PRIMARY KEY(boardNo)
);
COMMIT;

-- 댓글 -----------------------------------
DROP SEQUENCE sq_reply;
CREATE SEQUENCE sq_reply;
CREATE TABLE tbl_reply(
    replyNo number(5,0), 
    boardNo number(10,0) NOT NULL, 
    reply varchar2(1000) NOT NULL, 
    replyer varchar2(30) NOT NULL, 
    regDate date DEFAULT SYSDATE, 
    updateDate date DEFAULT SYSDATE, 
    CONSTRAINT pk_reply PRIMARY KEY(replyNo),
    CONSTRAINT fk_reply_board FOREIGN KEY(boardNo) 
        REFERENCES tbl_board(boardNo) on delete cascade
);
DESC tbl_reply;
SELECT * FROM tbl_reply;

COMMIT;

-- 스크랩
CREATE SEQUENCE sq_scrap;
CREATE TABLE tbl_scrap(
    scrapNo number(5,0), 
    boardNo number(10,0) NOT NULL,  
    scraper varchar2(30) NOT NULL, 
    scrapDate date DEFAULT SYSDATE, 
    CONSTRAINT pk_scrap PRIMARY KEY(scrapNo),
    CONSTRAINT fk_scrap_board FOREIGN KEY(boardNo) 
        REFERENCES tbl_board(boardNo) on delete cascade
);
DESC tbl_scrap;
SELECT * FROM tbl_scrap;

COMMIT;

-- 1:1문의 -----------------------------------
CREATE TABLE tbl_question(
    qNo number(5,0), 
    title varchar2(100) NOT NULL, 
    content varchar2(1000) NOT NULL, 
    writer varchar2(30) NOT NULL, 
    regDate date DEFAULT SYSDATE, 
    updateDate date DEFAULT SYSDATE, 
    CONSTRAINT pk_question PRIMARY KEY(qNo)
);
DESC tbl_question;
SELECT * FROM tbl_question;

COMMIT;

-- 1:1문의 답변
CREATE TABLE tbl_answer(
    aNo number(5,0),
    qNo number(5,0) NOT NULL, 
    reply varchar2(1000) NOT NULL, 
    replyer varchar2(30) NOT NULL, 
    regDate date DEFAULT SYSDATE, 
    updateDate date DEFAULT SYSDATE, 
    CONSTRAINT pk_answer PRIMARY KEY(aNo),
    CONSTRAINT fk_answer_question FOREIGN KEY(qNo) 
        REFERENCES tbl_question(qNo) on delete cascade
);
DESC tbl_answer;
SELECT * FROM tbl_answer;

COMMIT;

-- 자주묻는 질문 -----------------------------------
CREATE TABLE tbl_fnq(
    fnqNo number(5,0), 
    question varchar2(1000) NOT NULL, 
    answer varchar2(1000) NOT NULL, 
    writer varchar2(30) NOT NULL, 
    regDate date DEFAULT SYSDATE, 
    updateDate date DEFAULT SYSDATE, 
    CONSTRAINT pk_fnq PRIMARY KEY(fnqNo)
);
DESC tbl_fnq;
SELECT * FROM tbl_fnq;

COMMIT;

-- 회원정보 -----------------------------------
CREATE TABLE tbl_member(
    id varchar2(30),
    pw varchar2(30) NOT NULL,
    nickname varchar2(30) NOT NULL,
    name varchar2(30) NOT NULL,
    email varchar2(100) NOT NULL,
    socialNum varchar2(14) NOT NULL,
    phone varchar2(14) NOT NULL,
    businessNo varchar2(10),
    businessName varchar2(100),
    businessType varchar2(50),
    role varchar2(30) NOT NULL,
    regDate date DEFAULT SYSDATE,
    CONSTRAINT pk_member PRIMARY KEY(id),
    CONSTRAINT uq_member UNIQUE(nickname, businessNo, businessName)
);
DESC tbl_member;

INSERT INTO tbl_member 
    (id, pw, nickname, name, email, socialNum, phone, role)
VALUES
    ('aaa', '1234', '유저', '홍길동', 'aaa@aaa.com', '111111-111111', '111-1111-1111', 'traveler');
SELECT * FROM tbl_member;    
COMMIT;

-- 탈퇴 회원정보 -----------------------------------
CREATE TABLE tbl_exMember(
    id varchar2(30),
    pw varchar2(30) NOT NULL,
    nickname varchar2(30) NOT NULL,
    name varchar2(30) NOT NULL,
    email varchar2(100) NOT NULL,
    socialNum number(8) NOT NULL,
    phone number(11) NOT NULL,
    businessNo number(10),
    businessName varchar2(100),
    businessType varchar2(50),
    role varchar2(30) NOT NULL,
    regDate date,
    dropDate date DEFAULT SYSDATE,
    CONSTRAINT pk_exMember PRIMARY KEY(id),
    CONSTRAINT uq_exMember UNIQUE(nickname, businessNo, businessName)
);
DESC tbl_exMember;

COMMIT;
