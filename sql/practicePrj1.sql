CREATE DATABASE prj2;

use prj2;

# id : 게시물 순서
# title : 제목, content : 내용
# writer: 작성자 이름, member_id : 작성자 id
# inserted: 게시물 작성 시간
CREATE TABLE board
(
    id        INT AUTO_INCREMENT PRIMARY KEY,
    title     VARCHAR(1000) NOT NULL,
    content   VARCHAR(3000) NOT NULL,
    writer    VARCHAR(100)  NOT NULL,
    member_id INT           NOT NULL,
    inserted  DATETIME      NOT NULL DEFAULT NOW()
);

desc board;
SELECT *
FROM board;

drop table board;

CREATE TABLE member
(
    id       INT          NOT NULL PRIMARY KEY,
    writer   VARCHAR(100) NOT NULL,
    email    VARCHAR(200) NOT NULL UNIQUE,
    password VARCHAR(200) NOT NULL,
    inserted DATETIME     NOT NULL DEFAULT NOW()
);

ALTER TABLE board
    MODIFY member_id INT NOT NULL UNIQUE;

desc member;

ALTER TABLE board
    ADD CONSTRAINT fk_board_member FOREIGN KEY (member_id) REFERENCES member (id);