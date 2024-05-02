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
FROM board;
DESC board;

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

UPDATE member
SET email='sdf',
    password='ff',
    nick_name='dss'
WHERE id = 9;