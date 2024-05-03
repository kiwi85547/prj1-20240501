CREATE DATABASE prj1;

use prj1;

CREATE TABLE board
(
    id       INT PRIMARY KEY AUTO_INCREMENT,
    title    VARCHAR(20)   NOT NULL,
    content  VARCHAR(3000) NOT NULL,
    writer   VARCHAR(100)  NOT NULL,
    inserted DATETIME      NOT NULL DEFAULT NOW()
);

SELECT *
FROM board
ORDER BY id DESC;
DESC board;

INSERT INTO board (title, content, writer)
SELECT title, content, writer
FROM board;

SELECT *
FROM board
ORDER BY id
LIMIT 3,10;

# 회원 테이블
CREATE TABLE member
(
    id        INT PRIMARY KEY AUTO_INCREMENT,
    email     VARCHAR(200) NOT NULL UNIQUE,
    password  VARCHAR(200) NOT NULL,
    nick_name VARCHAR(100) NOT NULL UNIQUE,
    inserted  DATETIME     NOT NULL DEFAULT NOW()
);

select *
from member;
desc member;
drop table member;

ALTER TABLE member
    ADD COLUMN inserted DATETIME NOT NULL DEFAULT NOW();

# board 테이블 수정
# writer 컬럼 지우기
# member_id INT REFERENCE member(id) 컬럼 추가

ALTER TABLE board
    DROP COLUMN writer;
ALTER TABLE board
    ADD COLUMN member_id INT REFERENCES member (id);

UPDATE board
SET member_id=20
WHERE id > 0;

SELECT *
FROM board;