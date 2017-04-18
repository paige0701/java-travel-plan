create table tbl_member -- 회원테이블
(userid         varchar2(30)   not null
,idx         number      not null
,password      varchar2(30)   not null
,name         varchar2(50)   not null
,birth         date??      not null
,gender         nvarchar2(1)   not null
,email         varchar2(40)   not null
,mobile         varchar2(30)
,active         number(1)
,constraint PK_tbl_member_userid primary key(userid)
);

create table tbl_admininfo -- s관리자테이블
(adminid      varchar2(30)   not null
,idx         number      not null
,password      varchar2(30)   not null
,constraint PK_tbl_admininfo_userid primary key(userid)
);

create   table tbl_area -- 지역정보테이블
(area_code      number      not null
,area_name      varchar2(20)   not null
,constraint PK_tbl_area_area_code primary key(area_code)
);

create   table tbl_area_detail -- 지역정보상세테이블
(area_code      number      not null
,de_area_code      number      not null
,de_area_name      varchar2(20)   not null
,constraint PK_tbl_area_detail_de_area_code primary key(de_area_code)
,constraint FK_tbl_area_detail_area_code foreign key
            references tbl_area
);

create table tbl_tourinfo -- 관광지테이블
(t_idx         number      not null
,de_area_code      number      not null
,t_name         varchar2(30)   not null
,t_addr         varchar2(255)   not null
,t_tyep         varchar2(30)   not null
,t_rating      number
,t_start_date      date
,t_end_date      date
,t_image1      varchar2(4000)
,t_image2      varchar2(4000)
,t_detail      varchar2(4000)
,tx         number      not null
,ty         number      not null
,constraint PK_tbl_tourinfo_t_idx primary key(t_idx)
,constraint FK_tbl_tourinfo_de_area_code foreign key
            references tbl_area_detail
);

create table tbl_schedule -- 스케쥴테이블
(sc_idx         n/a
,sc_name      varchar2(50)
,sc_start_date      date
,sc_end_date      date
,sc_days      number
,sc_tag         varchar2(100)
,sc_likecount      number
,sc_viewcount      number
,constraint PK_tbl_schedule_sc_idx primary key(sc_idx)
);

create table tbl_schedule_detail -- 스케쥴상세테이블
(새컬럼??
,sc_idx
,t_idx
,이미지
,메모
);

create table tbl_like -- 좋아요테이블
(userid         varchar2(30)   not null
,sc_idx         n/a?
,constraint FK_tbl_like_userid foreign key
            references tbl_member
,constraint FK_tbl_like_sc_idx foreign key
            references tbl_schedule
);

create table tbl_invite -- 초대테이블
(userid         varchar2(30)   not null
,sc_idx         n/a?
,constraint FK_tbl_invite_userid foreign key
            references tbl_member
,constraint FK_tbl_invite_sc_idx foreign key
            references tbl_schedule
);

create table tbl_join -- 스케쥴참여명단테이블
(userid         varchar2(30)   not null
,sc_idx         n/a?
,constraint FK_tbl_join_userid foreign key
            references tbl_member
,constraint FK_tbl_join_sc_idx foreign key
            references tbl_schedule
);

create table tbl_schedulecomm -- 스케쥴댓글테이블
(userid         varchar2(30)   not null
,sc_idx         n/a?
,content      varchar2(4000)
,status         number(1)
,constraint FK_tbl_schedulecomm_userid foreign key
            references tbl_member
,constraint FK_tbl_schedulecomm_sc_idx foreign key
            references tbl_schedule
);

create table_friends -- 친구관계테이블
(id1         varchar2(30)
,id2         varchar2(30)
,constraint FK_tbl_friends_id1 foreign key
            references tbl_member
,constraint FK_tbl_friends_id2 foreign key
            references tbl_member
);


create table tbl_wishlist -- 위시리스트테이블
(userid         varchar2(30)   not null
,t_idx         n/a?
,constraint FK_tbl_wishlist_userid foreign key
            references tbl_member
,constraint FK_tbl_wishlist_t_idx foreign key
            references tbl_tour_info
);

-- tbl_area
insert into tbl_area
values(1, '서울특별시')

insert into tbl_area
values(2, '인천광역시')

insert into tbl_area
values(3, '부산광역시')

insert into tbl_area
values(4, '제주특별자치도')

select * from tbl_area

alter table tbl_area
modify( area_name varchar2(30));

insert into tbl_area
values(5, '경기도')

insert into tbl_area
values(6, '강원도')

insert into tbl_area
values(7, '충청도')

insert into tbl_area
values(8, '전라도')

insert into tbl_area
values(9, '경상도')

commit

---------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 경기
insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(5, 501, '경기도 가평군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(5, 502, '경기도 강화군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(5, 503, '경기도 고양시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(5, 504, '경기도 과천시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(5, 505, '경기도 광명시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(5, 506, '경기도 광주시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(5, 507, '경기도 구리시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(5, 508, '경기도 군포시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(5, 509, '경기도 김포시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(5, 510, '경기도 남양주시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(5, 511, '경기도 동두천시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(5, 512, '경기도 부천시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(5, 513, '경기도 성남시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(5, 514, '경기도 수원시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(5, 515, '경기도 시흥시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(5, 516, '경기도 안산시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(5, 517, '경기도 안성시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(5, 518, '경기도 안양시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(5, 519, '경기도 양주시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(5, 520, '경기도 양평군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(5, 521, '경기도 여주시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(5, 522, '경기도 연천군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(5, 523, '경기도 오산시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(5, 524, '경기도 용인시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(5, 525, '경기도 웅진군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(5, 526, '경기도 의왕시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(5, 527, '경기도 의정부시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(5, 528, '경기도 이천시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(5, 529, '경기도 파주시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(5, 530, '경기도 평택시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(5, 531, '경기도 포천시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(5, 532, '경기도 하남시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(5, 533, '경기도 화성시');


-- 강원
insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(6, 601, '강원도 강릉시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(6, 602, '강원도 고성시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(6, 603, '강원도 동해시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(6, 604, '강원도 삼척시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(6, 605, '강원도 속초시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(6, 606, '강원도 양구군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(6, 607, '강원도 양양군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(6, 608, '강원도 영월시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(6, 609, '강원도 원주시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(6, 610, '강원도 인제군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(6, 611, '강원도 정선군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(6, 612, '강원도 철원군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(6, 613, '강원도 춘천시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(6, 614, '강원도 태백시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(6, 615, '강원도 평창군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(6, 616, '강원도 홍천군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(6, 617, '강원도 화천군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(6, 618, '강원도 횡성군');


-- 충청
insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(7, 701, '충청도 공주시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(7, 702, '충청도 괴산군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(7, 703, '충청도 금산군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(7, 704, '충청도 논산시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(7, 705, '충청도 단양군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(7, 706, '충청도 당진군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(7, 707, '충청도 대전광역시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(7, 708, '충청도 보령시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(7, 709, '충청도 보은군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(7, 710, '충청도 부여군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(7, 711, '충청도 서산시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(7, 712, '충청도 서천군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(7, 713, '충청도 아산시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(7, 714, '충청도 연기군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(7, 715, '충청도 영동군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(7, 716, '충청도 예산군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(7, 717, '충청도 옥천군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(7, 718, '충청도 음성군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(7, 719, '충청도 진천군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(7, 720, '충청도 천안시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(7, 721, '충청도 청양군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(7, 722, '충청도 청원군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(7, 723, '충청도 청주시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(7, 724, '충청도 충주시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(7, 725, '충청도 태안군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(7, 726, '충청도 홍성군');


-- 전라
insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(8, 801, '전라도 강진군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(8, 802, '전라도 고창군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(8, 803, '전라도 고흥군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(8, 804, '전라도 곡성군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(8, 805, '전라도 광양시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(8, 806, '전라도 광주광역시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(8, 807, '전라도 구례군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(8, 808, '전라도 군산시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(8, 809, '전라도 김제시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(8, 810, '전라도 나주시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(8, 811, '전라도 남원시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(8, 812, '전라도 담양군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(8, 813, '전라도 목포시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(8, 814, '전라도 무안군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(8, 815, '전라도 무주군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(8, 816, '전라도 보성군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(8, 817, '전라도 부안군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(8, 818, '전라도 순창군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(8, 819, '전라도 순천시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(8, 820, '전라도 신안군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(8, 821, '전라도 여수시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(8, 822, '전라도 영광군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(8, 823, '전라도 영암군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(8, 824, '전라도 완도군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(8, 825, '전라도 완주군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(8, 826, '전라도 익산시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(8, 827, '전라도 임실군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(8, 828, '전라도 장성군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(8, 829, '전라도 장수군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(8, 830, '전라도 장흥군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(8, 831, '전라도 전주시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(8, 832, '전라도 정읍시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(8, 833, '전라도 진도군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(8, 834, '전라도 진안군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(8, 835, '전라도 함평군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(8, 836, '전라도 해남군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(8, 837, '전라도 화수군');


-- 경상
insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(9, 901, '경상도 거제시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(9, 902, '경상도 거창군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(9, 903, '경상도 경산시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(9, 904, '경상도 경주시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(9, 905, '경상도 고령군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(9, 906, '경상도 고성군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(9, 907, '경상도 구미시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(9, 908, '경상도 군위군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(9, 909, '경상도 기장군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(9, 910, '경상도 김천시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(9, 911, '경상도 김해시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(9, 912, '경상도 남해군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(9, 913, '경상도 대구광역시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(9, 914, '경상도 마산시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(9, 915, '경상도 문경시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(9, 916, '경상도 밀양시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(9, 917, '경상도 봉화군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(9, 918, '경상도 사천시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(9, 919, '경상도 산청군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(9, 920, '경상도 상주시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(9, 921, '경상도 성주군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(9, 922, '경상도 안동시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(9, 923, '경상도 양산시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(9, 924, '경상도 영덕군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(9, 925, '경상도 영양군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(9, 926, '경상도 영주시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(9, 927, '경상도 영천시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(9, 928, '경상도 예천군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(9, 929, '경상도 울릉군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(9, 930, '경상도 울산광역시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(9, 931, '경상도 울주군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(9, 932, '경상도 울진군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(9, 933, '경상도 의령군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(9, 934, '경상도 의성군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(9, 935, '경상도 진주시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(9, 936, '경상도 진해시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(9, 937, '경상도 창녕군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(9, 938, '경상도 창원시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(9, 939, '경상도 청도군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(9, 940, '경상도 청송군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(9, 941, '경상도 칠곡군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(9, 942, '경상도 통영시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(9, 943, '경상도 포항시');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(9, 944, '경상도 하동군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(9, 945, '경상도 함안군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(9, 946, '경상도 함양군');

insert into tbl_area_detail(area_code, de_area_code, de_area_name)
values(9, 947, '경상도 합천군');


---------------------------------------------------------------------------------------------------------------------------------------------------------------------


rollback

delete from tbl_area 

-- tbl_member

create sequence seq_memberidx;

select * from tbl_member

commit

insert into tbl_member
values('ghkim1121', seq_memberidx.nextval, 'qwer1234!', '가현', to_date('1993-11-21', 'yyyy-mm-dd'), '여', 'ghkim1121@naver.com', '010-2250-1771', '1');


insert into tbl_member
values('cde0701', seq_memberidx.nextval, 'qwer1234!', '대은', to_date('1991-07-01', 'yyyy-mm-dd'), '여', 'cde0701@gmail.com', '010-6668-1343', '1');


insert into tbl_member
values('sjhan', seq_memberidx.nextval, 'qwer1234!', '주한', to_date('1990-12-31', 'yyyy-mm-dd'), '남', 'wngks2@naver.com', '010-3034-7939', '1');


insert into tbl_member
values('kdkyu', seq_memberidx.nextval, 'qwer1234!', '동규', to_date('1991-08-22', 'yyyy-mm-dd'), '남', 'kdkyu@naver.com', '010-1111-4837', '1');


insert into tbl_member
values('kyjoo', seq_memberidx.nextval, 'qwer1234!', '영주', to_date('1993-12-31', 'yyyy-mm-dd'), '남', 'kyjoo@naver.com', '010-3535-0000', '1');




select v.sc_idx, v.sc_name, v.sc_likecount, v.sc_viewcount, v.sc_tag, v.chk
from
(
  select row_number()over(order by sc_idx desc) as rno, sc_idx, sc_name, sc_likecount, sc_viewcount, sc_tag
     , case when sc_idx in (select sc_idx from tbl_like where userid='cde0701') then 1 else 0 end as chk
  from tbl_schedule
)v


select * from tbl_admin

insert into tbl_admin values('admin',1,'qwer1234!')

commit

select case(select count(*) from tbl_admin where adminid='admi' and password='qwer1234!')
        when 1 then 1
        else(case (select count(*) from tbl_admin where adminid='admi')
             when 1 then 0 else -1 end) end as loginck
  from dual
    

alter table tbl_admininfo rename to tbl_admin;

select count(*) from tbl_admin and userid='admin' and password='qwer1234!'

select *
		from tbl_admin
where adminid='admin';
    
commit;
    
select * from tbl_tourinfo;
    
create table tbl_rating
(t_idx number not null
,userid varchar2(30) not null
,t_rating number not null
,constraint FK_tbl_rating_userid foreign key(userid) references tbl_member(userid)
,constraint FK_tbl_rating_t_idx foreign key(t_idx) references tbl_tourinfo(t_idx)
)

desc tbl_tourinfo;

select * from tab

update tbl_tourinfo set t_rating = nvl((select avg(t_rating) from tbl_rating where t_idx = 37),0)
where t_idx = 37;

select * from tbl_rating;

delete from tbl_Rating;

commit;

select * from tbl_tourinfocomm;

select * from seq

select * from tbl_test

insert into tbl_test values(text_seq.nextval);
insert into tbl_test values(text_seq.currval);

select seq_sc_idx.currval from dual
drop sequence text_seq
commit

select ageline, count
,(select count(*) from view_total_age where gender = '남' and ageline = v.ageline) as man
,(select count(*) from view_total_age where gender = '여' and ageline = v.ageline) as woman
from
(
select ageline, count(*) as count
from view_total_age
group by ageline
)v

select t_idx, de_area_code, t_name, t_addr, t_type, t_rating
, (case when t_type = 2 then to_char(t_start_date,'hh24:mi') else to_char(t_start_date,'yyyy-mm-dd') end) as t_start_date
, (case when t_type = 2 then to_char(t_end_date,'hh24:mi') else to_char(t_end_date,'yyyy-mm-dd') end) as t_end_date
, t_image1, t_image2, t_detail, tx, ty from tbl_tourinfo;



select * from tbl_schedule

select * from tbl_join

select s.sc_idx, sc_name, to_char(sc_start_date,'yyyy-mm-dd') as sc_start_date, to_char(sc_end_date,'yyyy-mm-dd') as sc_end_date, sc_days, sc_tag, sc_likecount, sc_viewcount
		from tbl_schedule s
		join tbl_join j
		on s.sc_idx = j.sc_idx
		where userid = #{userid}
    
    
select t_idx, de_area_code, t_name, t_addr, t_type, t_rating, t_start_date, t_end_date, t_detail, tx, ty
from tbl_tourinfo
where t_idx in (167,168,1,2,3,4) and t_type = 2;

select * from tbl_member;

select userid from tbl_join where sc_idx = '8';

 show user;
 
-- creating tables !!! --------------------------------------------------------- 
 
 create table tbl_member -- 회원테이블
(userid			varchar2(30)	not null
,idx			number		not null
,password		varchar2(30)	not null
,name			varchar2(50)	not null
,birth			date		not null
,gender			nvarchar2(1)	not null
,email			varchar2(40)	not null
,mobile			varchar2(30)
,active			number(1)
,constraint PK_tbl_member_userid primary key(userid)
);
 
create table tbl_admininfo -- 관리자테이블
(adminid		varchar2(30)	not null
,idx			number		not null
,password		varchar2(30)	not null
,constraint PK_tbl_admininfo_userid primary key(adminid)
);
 select * from tbl_area;
create	table tbl_area -- 지역정보테이블
(area_code		number		not null
,area_name		varchar2(20)	not null
,constraint PK_tbl_area_area_code primary key(area_code)
);
 
create	table tbl_area_detail -- 지역정보상세테이블
(area_code		number		not null
,de_area_code		number		not null
,de_area_name		varchar2(20)	not null
,constraint PK_tbl_area_de_area_code primary key(de_area_code)
,constraint FK_tbl_area_de_area_code foreign key(area_code)
				references tbl_area(area_code)
);
 
create table tbl_tourinfo -- 관광지테이블
(t_idx			number		not null
,de_area_code		number		not null
,t_name			varchar2(30)	not null
,t_addr			varchar2(255)	not null
,t_type			varchar2(30)	not null
,t_rating		number
,t_start_date		date
,t_end_date		date
,t_image1		varchar2(4000)
,t_image2		varchar2(4000)
,t_detail		varchar2(4000)
,tx			number		not null
,ty			number		not null
,constraint PK_tbl_tourinfo_t_idx primary key(t_idx)
,constraint FK_tbl_tourinfo_de_area_code foreign key(de_area_code)
				references tbl_area_detail(de_area_code)
);
 
create table tbl_tourinfocomm -- 관광지댓글
(userid			varchar2(30)	not null
,t_idx			number
,content		varchar2(4000)
,status			number(1)
,constraint FK_tbl_tourinfocomm_userid foreign key(userid)
				references tbl_member(userid)        
,constraint FK_tbl_tourinfocomm_t_idx foreign key(t_idx)
				references tbl_tourinfo(t_idx)
);
 
create table tbl_schedule -- 스케쥴테이블
(sc_idx			number
,sc_name		varchar2(50)
,sc_start_date		date
,sc_end_date		date
,sc_days		number
,sc_tag			varchar2(100)
,sc_likecount		number
,sc_viewcount		number
,constraint PK_tbl_schedule_sc_idx primary key(sc_idx)
);

select * from tbl_statusmsg
alter table tbl_statusmsg add(filename varchar2(255));
alter table tbl_statusmsg add(orgFileName varchar2(255)); 
alter table tbl_statusmsg add(fileSize number);

alter table tbl_statusmsg add(filename2 varchar2(255));
alter table tbl_statusmsg add(orgFileName2 varchar2(255)); 
alter table tbl_statusmsg add(fileSize2 number);
--
--create table tbl_schedule_detail -- 스케쥴상세테이블
--(새컬럼??
--,sc_idx
--,t_idx
--,이미지
--,메모
--);
 
create table tbl_like -- 좋아요테이블
(userid			varchar2(30)	not null
,sc_idx			number
,constraint FK_tbl_like_userid foreign key(userid)
				references tbl_member(userid)
,constraint FK_tbl_like_sc_idx foreign key(sc_idx)
				references tbl_schedule(sc_idx)
);
 
create table tbl_invite -- 초대테이블
(userid			varchar2(30)	not null
,sc_idx			number
,constraint FK_tbl_invite_userid foreign key(userid)
				references tbl_member(userid)
,constraint FK_tbl_invite_sc_idx foreign key(sc_idx)
				references tbl_schedule(sc_idx)
);
 
create table tbl_join -- 스케쥴참여명단테이블
(userid			varchar2(30)	not null
,sc_idx			number
,constraint FK_tbl_join_userid foreign key(userid)
				references tbl_member(userid)
,constraint FK_tbl_join_sc_idx foreign key(sc_idx)
				references tbl_schedule(sc_idx)
);
 
create table tbl_schedulecomm -- 스케쥴댓글테이블
(userid			varchar2(30)	not null
,sc_idx			number
,content		varchar2(4000)
,status			number(1)
,constraint FK_tbl_schedulecomm_userid foreign key(userid)
				references tbl_member(userid)
,constraint FK_tbl_schedulecomm_sc_idx foreign key(sc_idx)
				references tbl_schedule(sc_idx)
);
 
create table tbl_friends -- 친구관계테이블
(id1			varchar2(30)
,id2			varchar2(30)
,constraint FK_tbl_friends_id1 foreign key(id1)
				references tbl_member(userid)
,constraint FK_tbl_friends_id2 foreign key(id2)
				references tbl_member(userid)
);
 
 
create table tbl_wishlist -- 위시리스트테이블
(userid			varchar2(30)	not null
,t_idx			number
,constraint FK_tbl_wishlist_userid foreign key(userid)
				references tbl_member(userid)
,constraint FK_tbl_wishlist_t_idx foreign key(t_idx)
				references tbl_tourinfo(t_idx)
);
 
select * from tab;

---------------------------------------------------------------------------------
tbl_wishlist

select * from tbl_schedule




create table tbl_schedule -- 스케쥴테이블
(sc_idx			number
,sc_name		varchar2(50)
,sc_start_date		date
,sc_end_date		date
,sc_days		number
,sc_tag			varchar2(100)
,sc_likecount		number
,sc_viewcount		number
,constraint PK_tbl_schedule_sc_idx primary key(sc_idx)
);


create table tbl_statusmsg -- 상태메시지테이블
(userid			varchar2(30)	not null 
,statusmsg  Nvarchar2(20)  
,constraint PK_tbl_statusmsg_userid primary key(userid)
,constraint FK_tbl_statusmsg_userid foreign key(userid)
				references tbl_member(userid)
);
alter table tbl_statusmsg modify statusmsg Nvarchar2(20) default '상태 메시지를 입력하세요'
Commit;
select * from tbl_statusmsg

-- inserting daa into tbl_statusmsg;
insert into tbl_statusmsg values('cde0701','여행을 좋아하는 뇨자');

show user;
select * from tbl_wishlist;
select * from tbl_member;

-- inserting values into tbl_wishlist
insert into tbl_wishlist values('cde0701',1);
insert into tbl_wishlist values('cde0701',3);
insert into tbl_wishlist values('cde0701',4);
insert into tbl_wishlist values('cde0701',7);

insert into tbl_wishlist values('cde0701',97);
insert into tbl_wishlist values('cde0701',22);
insert into tbl_wishlist values('cde0701',25);
insert into tbl_wishlist values('cde0701',38);
insert into tbl_wishlist values('cde0701',40);
insert into tbl_wishlist values('cde0701',60);
insert into tbl_wishlist values('cde0701',65);
insert into tbl_wishlist values('cde0701',52);
insert into tbl_wishlist values('cde0701',53);


commit

-- getting wishlist query

select userid,  t.t_idx,  t.t_name, t.t_addr, t.t_rating, t.t_detail, t.t_image1, t.de_area_code
from tbl_wishlist W join tbl_tourinfo T
on W.t_idx = T.t_idx 
where userid = 'cde0701'

update tbl_tourinfo set t_image1 = '추어탕.jpg' where t_idx = 3 
update tbl_tourinfo set t_image1 = '현식당2.jpg' where t_idx = 1 
update tbl_tourinfo set t_detail = '저희업소는 남원추어탕의 깊은맛과 정 을 소중하게 생각하며 친환경 열무시래기를 직접 재배하며,건강한 국내산 미꾸라지와 
직접 담는 토속된장을 사용하여 어머니의 손길로 30여년을 오직 추어탕만을 고집하는 남원추어탕 전문점 입니다.' where t_idx = 1 

update tbl_tourinfo set t_image1 = '남원추어탕.jpg' where t_idx = 4
update tbl_tourinfo set t_image1 = '한정식연.jpg' where t_idx = 7

commit;

select * from Tbl_Wishlist

delete from tbl_wishlist where 1=0 or userid = 'cde0701' and t_idx='1' or userid='cde0701' and t_idx='3'
rollback
-------------------------------

select * from tab;
select * from TBL_MEMBER;
select * from TBL_FRIENDS;
select * from tbl_tourinfo;
commit;

-------------- 친구 추가--------------------------------
insert into TBL_FRIENDS values('cde0701','kyjoo');
insert into TBL_FRIENDS values('cde0701','sonjh');
insert into TBL_FRIENDS values('cde0701','sjhan');
insert into TBL_FRIENDS values('YJKim93','sjhan');
insert into TBL_FRIENDS values('YJKim93','cde0701');
insert into TBL_FRIENDS values('YJKim93','ddd');

-- searching wishlist 위시리스트에서 검색학때 t_name 으로 검색
select userid,  t.t_idx,  t.t_name, t.t_addr, t.t_rating, t.t_detail, t.t_image1, t.de_area_code
from tbl_wishlist W join tbl_tourinfo T
on W.t_idx = T.t_idx
where  userid= 'cde0701' and  t.t_name like '%한%' 

-- getting friend list
select A.id2, B.name, b.email
from tbl_friends A join tbl_member B
on a.id2 = b.userid

-- searching friends
select userid, name, email
from tbl_member
where userid like '%'||'s'||'%'

-- searching friends from friendlist
select  a.id1 as id1 ,A.id2 as id2 , B.name as name , b.email as email
		from tbl_friends A join tbl_member B
		on a.id2 = b.userid
where 
id1 = 'cde0701' and
id2 like '%'||'s'||'%'

-- inserting data into tbl_statusmsg
select * from tbl_statusmsg
insert into tbl_statusmsg values('songjk',default)
insert into tbl_statusmsg values('hongkd',default);
insert into tbl_statusmsg values('sonjh',default);
insert into tbl_statusmsg values('ghkim1121',default);
insert into tbl_statusmsg values('sjhan',default);
insert into tbl_statusmsg values('kdkyu',default);

insert into tbl_statusmsg values('kyjoo',default);
insert into tbl_statusmsg values('YJKim93',default);
commmit;

------------좋아요 검색하는 것 
select * from tab;
select * from TBL_LIKE;
select * from TBL_SCHEDULE;
select * from TBL_INVITE;
select * from TBL_JOIN;

select a.userid, a.sc_idx, b.sc_name, b.sc_start_date,b.sc_end_date,b.sc_days,b.sc_tag,b.sc_likecount,b.sc_viewcount
from tbl_like A join tbl_schedule B
on a.sc_idx = b.sc_idx
where userid = 'cde0701'
and sc_name = 'as'

----------------------- inserting data
create table tbl_tourinfo -- 관광지테이블
(t_idx			number		not null
,de_area_code		number		not null
,t_name			varchar2(30)	not null
,t_addr			varchar2(255)	not null
,t_tyep			varchar2(30)	not null
,t_rating		number
,t_start_date		date
,t_end_date		date
,t_image1		varchar2(4000)
,t_image2		varchar2(4000)
,t_detail		varchar2(4000)
,tx			number		not null
,ty			number		not null
,constraint PK_tbl_tourinfo_t_idx primary key(t_idx)
,constraint FK_tbl_tourinfo_de_area_code foreign key(de_area_code)
				references tbl_area_detail(de_area_code)
);
select * from tab;
select * from tbl_tourinfo
select * from seq
SEQ_TIDX
select * from tbl_area
select * from TBL_AREA_DETAIL

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,101,'','',2,'',,);
commit;

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_image1,t_detail,tx,ty) values
(SEQ_TIDX.nextval,101,'프리모바치오바치','서울특별시 중구 충무로2가 명동10길 66-5',2,'primo.jpg','스파게티 전문점입니다. 매장안에는 아늑한 공간으로 손님들을 편안하게 만들어주며 주방이 오픈되어있어 직접 조리하는 과정도 볼 수 있습니다. 스파게티 뿐만 아니라 피자, 리조또, 샐러드, 각종와인 등이 있어 다양한 맛을 즐길 수 있습니다.',37.562280,126.985591);

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,101,'머노까머나 대학로점','서울특별시 종로구 명륜4가 187',2,'그린 샐러드, 탄두리에 직접 구운 탄두리치킨, 인도 전통 빵인 난과 커리를 골고루 맛볼 수 있습니다.
커리는 종류 선택이 가능해 취향에 맞게 고를 수 있습니다.',37.582853,126.998785);

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,101,'명문갈비','서울특별시 강동구 올림픽로 651 예경빌딩',2,'돼지갈비는 참숯불로 구워드실 수 있어요~
삼겹살은 무쇠불판에 구워드시고 코스로 볶음밥까지 드실 수 있어요~',37.569385,127.048379);


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,101,'스테이지28','서울특별시 강동구 아리수로61길 105',2,'강남 시내에서 10여분 지척으로 자연과 가장 가까운 서울의 또 다른 모습을 확인할 수 있는 곳,
도심의 바쁜 일상을 벗어나 잠시나마 자연과 함께 마음의 여유를 느낄 수 있는 공간입니다.',37.565903,127.146885);


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,101,'성수족발','서울특별시 성동구 아차산로7길 7 동진빌딩 1층 성수족발',2,'성수동에서 가장 유명한 곳',37.546275,127.054360);

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,101,'ZAGMACHI','서울특별시 성동구 성수이로 88 남정빌딩',2,'플렛와이트가 맛있는 성수동 자그마치',37.542932,127.056713);


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,101,'윤경양식당','서울특별시 성동구 왕십리로 96 2층',2,'윤 경 양 식 당 by 33table 성수동 서울숲 가까이에 있습니다.
정성을 다한 음식과 분위기를 살리는 크래프트 비어와 음료가 준비되어있습니다.',37.546445,127.044875);

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,101,'메이다이닝','서울특별시 도봉구 도봉로169길 208',2,'북한산 자락 서울 도심 속 비경의 비밀정원, 메이다이닝 시크릿가든을 품고 있는 경치 좋은
유러피안 컨템포러리 파인다이닝 레스토랑 메이다이닝!',37.677932,127.034999);

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,101,'육회품은연어 가산점','서울특별시 금천구 디지털로9길 32 갑을그레이트밸리',2,'가산동에서 신선한 육회와 연어를 즐길수 있는 육회품은 연어-랍스타 가산점 많이 이용해 주세요

아울렛 방문하시고 연인과 함께 분위기 있게 랍스타를 먹고싶을땐~ 들려주세요~',37.480858,126.882267);

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,101,'사발 홍대','서울특별시 마포구 와우산로18길 29',2,'사발 홍대 (SABAL Hongdae)는 종합문화기업 (주)컬쳐온에서 운영하는 프리미엄 퓨전 한식 누들 레스토랑 입니다.',37.551594,126.923815);

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,101,'서지스테이크','서울특별시 용산구 한강대로84길 11-5',2,'안녕하세요 서지스테이크입니다. 남영동 스테이크 골목에 있는 곳입니다. 
스테이크와 부대찌개가 대표메뉴이지요.',37.543865,126.973109);
------------------------------------------------------------------


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,401,'대원가','제주특별자치도 제주시 도남로16길 15 재영샤르빌',2,'저희 대원가에서는 냉동전복이 아닌 살아있는 싱싱한 전복을 전 메뉴(전복뚝배기,전복죽, 활전복해물탕, 전복회, 전복구이,)에 사용하고 있습니다.',33.491532,126.527043);

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,401,'돈사돈 본관','제주특별자치도 제주시 우평로 19',2,'저희 돈사돈의 금고기는 일반 음식점에서 느낄 수 없는 깊은 맛을 자랑하며 특별한 맛으로 손님 여러분을 모시고 있습니다.
',33.478862,126.464090);

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,401,'해녀촌','제주특별자치도 제주시 구좌읍 동복로 33',2,'탱글탱글 신선한 회를 매콤하게 무쳐 국수와 함께 내는 회국수는 동복리 해녀촌의 인기메뉴입니다',33.553667,126.709952);

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,401,'오조해녀의집','제주특별자치도 서귀포시 성산읍 한도로 141-13 ',2,'전복죽과 전복회 등 전복 한가지로 전국에서 규모가 가장 큰 집. 해녀들이 채취한 해산물로 오조리어촌계원 해녀들이 직접 운영합니다.',33.469709,126.922319);

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,401,'산방식당','제주특별자치도 서귀포시 대정읍 하모이삼로 62',2,'두꺼운 면발과 두툼한 돼지고기가 인상적인 밀냉면은 식당에서 직접 면을 뽑기 때문에 시간이 좀 오래 걸린다고 해요. 면을 기다리는 시간에 먹기 좋은 수육은 비계와 살코기가 적당히 배합되어 있어, 김치 하나 올려 먹으면 그만입니다.',33.223440,126.254215);

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,401,'부두식당','제주특별자치도 서귀포시 대정읍 하모항구로 62',2,'부두식당은 갈치조림, 멜국, 우럭조림, 매운탕, 자리회, 한치회, 그리고 아버지와 아들이 직접 낚아올린 자연산 활어의 참맛과 함께 저렴하고도 잊지 못하는 그런 시간이 될 것입니다.',33.219172,126.251207);

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,401,'하르방밀면','제주특별자치도 서귀포시 대정읍 동일하모로 229',2,'물밀면과 비빔밀면이 대표메뉴입니다. 
특제 비빔소스와 육수로 밀면의 맛을 즐길 수 있는 곳입니다. ',33.225869,126.255816);

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,401,'카페 사우다드','제주특별자치도 제주시 한경면 노을해안로 1143',2,'테라로사 로스팅 원두를 사용하고 있으며, 론리플래닛과 올리브매거진코리아의 푸드트래블에 소개된
좋은 품질의 커피와 다양한 수제음료, 디저트와 함께 제주도 최고의 뷰와 일몰을 감상하시며 
힐링하는 시간이 되시길 바랍니다 ^^',33.307951,126.164127);
---------------------------------------------

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,301,'3found','부산광역시 부산진구 중앙대로680번가길 5 3층',2,'유명인 들도 많이 찾는 다이닝 라운지이며 이탈리아 음식과 전문바텐더가 만드는 칵테일을 함께 즐길 수 있습니다.
엘리베이터가 없는 3층에 위치 하고 있지만 꾸준한 사랑을 받는 곳',35.153663,129.060732);

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,301,'해운대 가야밀면','부산광역시 해운대구 좌동순환로 27',2,'18년째 성업중이며 해수욕장 근처에 있어 전국에서 고객이 오고 있습니다.
음식기술이 필요하신분에게는 음식기술및 노하우도 전수해 주고 있습니다,',35.168867,129.166344);

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,301,'그랜드애플','부산광역시 해운대구 센텀1로 25 센텀한샘빌딩',2,'그랜드애플 뷔페레스토랑은 동남아 오리엔탈 스타일의 최고급 휴향지의 브라운 톤의 원목 패턴과 유럽의 차분하고 품위있는 분위기를 느낄 수 있어 사랑하는 연인, 가족 그리고 격식을 차린 비지니스 접대나 귀한 손님을 모시기에 좋은 곳입니다.',35.166402,129.131945);

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,301,'원조조방낙지','부산광역시 동래구 명륜로94번길 37',2,'부산 조방(조선방직회사)앞에서 시작하여, 지금의 장소로 이전하여 영업을 하고 있으며, 40여 년의 세월을 꾸준히 사랑 받고 있는 전통낙지요리전문점입니다.',35.203997,129.083924);

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,301,'내호냉면','부산광역시 남구 우암번영로26번길 17',2,'대표 메뉴인 밀면 이외에 냉면도 별미이지요. 주전자에 담겨 나온 따뜻한 육수를 마시며 메뉴를 고를 수 있습니다.',35.126507,129.070872);

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,301,'백화양곱창 ','부산광역시 중구 자갈치로23번길 6',2,'부산 최고의 맛집',35.096939,129.027024);

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,301,'맛찬들왕소금구이','부산광역시 동래구 충렬대로 152',2,'고급스러운 삽겹살 구이 집 ',35.204633,129.076760);

commit;
select * from tbl_tourinfo;

----------------------------------

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,201,'머노까머나 송도점','인천광역시 연수구 해돋이로 107 더샵퍼스트월드',2,'근처에 송도 센트럴파크가 위치하고 있기 때문에 주말에는 가족단위의 손님이 많은
송도의 명물 맛집으로 급부상하고 있습니다.',37.390396,126.650034);

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,201,'부암갈비','인천광역시 남동구 용천로 149',2,'인천 3대 맛집',37.462990,126.714298);

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,201,'신매운양푼갈비찜','인천광역시 부평구 경원대로1403번길 16',2,'계란 도시락과 함께 먹는 매운양푼갈비찜이 인기인 곳입니다. 저녁 식사시간에는 손님들이 모여들어 줄을 서야 하는 경우도 종종 있다',37.491963,126.725276);

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,201,'연경','인천광역시 중구 차이나타운로 41 일동',2,'연경에는 중국 현지의 요리를 가장 잘 알고 있는 최고의 전문가들이 모여있습니다.',37.475412,126.619497);

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,201,'황해칼국수','인천광역시 중구 용유로21번길 3',2,'칼국수가 찐하고 맛있는 집',37.425761,126.422410);

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,201,'스시애','인천광역시 부평구 부흥로 261',2,'인천 부평 대표 맛집, 초밥전문점 스시애입니다.',37.498842,126.720829);

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,201,'프리울리베네치아','인천광역시 부평구 부평문화로80번길 27',2,'파스타 전문점',37.499548,126.721523);

----------------------------------------

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,904,'토함혜','경상북도 경주시 양정로 47',2,'경주에서 유명한 한정식맛집. 토함혜 입니다.경상북도 경주시 인왕동 위치 맛집. 안압지, 첨성대, 반월성, 대릉원, 경주시내 인근',35.839557,129.221944);

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,904,'교리김밥','경상북도 경주시 교촌안길 27-42',2,'경주 향교 근처에 위치한 교리김밥은 전국 3대 김밥 중 하나입니다. 두툼한 두깨와 김밥속을 반쯤 채운 잘게썬 계란지단이 특징이지요.',35.830819,129.216225);

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,904,'늘봄','경상북도 경주시 보불로 107',2,'저희 늘봄쌈밥은 모든음식에 조미료를 사용하지 않읍니다 직접담은 장들과 신선한야채들 신선한우렁으로 양념장을 만들고 있습니다 떡갈비는 숯불에구워 향이 아주 일품이지요',35.793783,129.313075);

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,904,'고색창역','경상북도 경주시 보불로 58-4',2,'저희 고색창연의 떡갈비는 일반 음식점에서 느낄 수 없는 깊은 맛을 자랑하며 특별한 맛으로 손님 여러분을 모시고 있습니다.',35.790143,129.316128);

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,904,'스타벅스 경주대릉원점','경상북도 경주시 첨성로 125',2,'한국 스타일 스타벅스 ',35.834105,129.214951);

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,904,'월지향','경상북도 경주시 양정로74번길 5',2,'경주 맛집',35.842248,129.223262);

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,904,'도솔마을','경상북도 경주시 손효자길 8-13',2,'100년 된 한옥과 정성이 깃든 한정식을 제공하고 있습니다. 경주의 문예인분들이 찾아주십니다. 단오날 행사와 10월의 마지막밤 음악회를 개최합니다.',35.837066,129.211229);

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,904,'랑콩뜨레 황성점','경상북도 경주시 황성로27번길 10 신안그린파크 101동',2,'대전 성심당 출신의 셰프가 운영하는 곳. 황성동 일대에서는 손꼽히는 빵집이다. 카늘레, 마카롱 등 프랑스식 디저트도 맛볼 수 있다.',35.866291,129.213512);

-----------------------------------------------------------------------------------
select * from tbl_statusmsg


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,904,'','',2,'',,);

----------------------


-- searching wishlist 위시리스트에서 검색학때 t_name 으로 검색
select userid,  t.t_idx,  t.t_name, t.t_addr, t.t_rating, t.t_detail, t.t_image1, t.de_area_code
from tbl_wishlist W join tbl_tourinfo T
on W.t_idx = T.t_idx
where  userid= 'cde0701' and  t.t_name like '%한%' 


select * from tab;
select * from TBL_AREA;
select * from TBL_AREA_DETAIL;
select * from tbl_tourinfo;
select * from tbl_wishlist where userid ='cde0701' ;

-- wishlist 에서 지역별로 가져오기
select W.userid,D.area_code,w.t_idx,T.t_name,T.t_addr,T.t_rating,T.t_detail,T.t_image1,T.de_area_code
from tbl_area_detail D join tbl_tourinfo T
on D.de_area_code = T.de_area_code
join tbl_wishlist W
on T.t_idx = W.t_idx
where userid='cde0701'


select * from tbl_wishlist
select * from tab;

select * from TBL_SCHEDULE

select a.userid as userid , a.sc_idx as sc_idx , 
			   b.sc_name as sc_name, b.sc_start_date as sc_start_date ,b.sc_end_date as sc_end_date,
			   b.sc_days as sc_days, b.sc_tag as sc_tag, b.sc_likecount as sc_likecount ,b.sc_viewcount as sc_viewcount
		from tbl_like A join tbl_schedule B
		on a.sc_idx = b.sc_idx
		where userid = 'cde0701'
    
  select W.userid,D.area_code,w.t_idx,T.t_name,T.t_addr,T.t_rating,T.t_detail,T.t_image1,T.de_area_code
from tbl_area_detail D join tbl_tourinfo T
on D.de_area_code = T.de_area_code
join tbl_wishlist W
on T.t_idx = W.t_idx
where area_code = 4
and t_name like '%' || '한' || '%'
 
    
    select W.userid as userid 
			  ,D.area_code as area_code 
			  ,W.t_idx as t_idx
			  ,T.t_name as t_name
			  ,T.t_addr as t_addr
			  ,T.t_rating as t_rating
			  ,T.t_detail as t_detail
			  ,T.t_image1 as t_image1
			  ,T.de_area_code as de_area_code
			from tbl_area_detail D join tbl_tourinfo T
			on D.de_area_code = T.de_area_code
			join tbl_wishlist W
			on T.t_idx = W.t_idx
			where userid = 'cde0701'
  
			and t_name like '%' || '프' || '%' 
      
  
  
select * from tab;
select * from tbl_member;
select * from tbl_rating where userid = 'hongkd';
select * from tbl_like;
select * from tbl_comment;
select * from tbl_tourinfocomm order by t_idx;

--------------- 페이징 처리 ------------------------
ahrk
	select userid,content,regDate
	from
		(
		select row_number()over (order by regDate desc ) as RNO
		       ,userid
		       ,content
		       ,regDate
		       
			from tbl_tourinfocomm
      where t_idx = 30
		)v
	where RNO >= 1 and RNO <= 6

	
select * from tbl_wishlist
select * from tbl_member;


select count(*) as totalCount 
    	from tbl_tourinfocomm
      where t_idx = 30 ;
      
 ----------------------------------------------

 create table tbl_searchedWords --검색어 누적 테이블
 (sw_idx number not null
 ,userid varchar2(30)
 ,searchedWord varchar2(30) not null
 ,insertDate date default sysdate not null
 ,constraint Pk_tbl_searchedWords_sw_idx primary key(sw_idx)
 ,constraint FK_tbl_searchedWords_userid foreign key(userid) references  tbl_member(userid)
 );
 
create sequence seq_sw; 

-- 검색어 randomly  입력했다. 
insert into tbl_searchedWords values(seq_sw.nextval,'cde0701','서울',default);
insert into tbl_searchedWords(sw_idx,userid,searchedWord,insertDate) values(seq_sw.nextval,null,'서울',default);
insert into tbl_searchedWords(sw_idx,userid,searchedWord,insertDate) values(seq_sw.nextval,'hongkd','서울',default);

 
---------------------------------------------------------------------------------

-- 웹사이트 방문 수 측정(처음 싸이트 딱 들어왔을때 카운트를 센다) 
create table tbl_visitStat --검색어 누적 테이블
 (visit_idx number not null
 ,visitNo
 ,insertDate date default sysdate not null
 ,constraint Pk_tbl_searchedWords_sw_idx primary key(sw_idx)
 ,constraint FK_tbl_searchedWords_userid foreign key(userid) references  tbl_member(userid)
 );


select * from tab;

select * from tbl_searchedWords
;
select * from tbl_member;
select * from tbl_tourinfo;
---------------------------------

 --------------------statistics!!
 
지역검색순위

select searchedWord, count(*) from tbl_searchedWords group by searchedWord

---- 

select * from tab
select * from tbl_area
select * from TBL_AREA_DETAIL
select * from tbl_tourinfo_type
select * from tbl_tourinfo

-- 숙박업체 인서트
insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,101,'','',3,'',,);

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,101,'신라호텔','서울특별시 중구 동호로 249',3,'2013년 리뉴얼을 통해 세계 최고 수준의 객실, 더 이그제큐티브 라운지, 야외수영장 등이 탄생해 하이엔드 라이프스타일을 선도하고 있는 호텔.총 464개의 객실을 보유하고 있으며, 그 중 180개의 이그제큐티브 객실과 38개의 스위트룸의 경우 펜트 하우스 컨셉의 더 이그제큐티브 라운지 이용 혜택으로 각광받고 있다.',37.558036,127.007659);
commit;


rollback;

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,101,'그랜드 앰배서더 서울','서울특별시 중구 동호로 287',3,'그랜드앰배서더서울은 1955년 10월 개관이래, 고객만족을 최우선으로 하는 역사와 전통을 계승함과 동시에, 꾸준한 레노베이션을 통해 현대적 감각의 디자인과 최신시설을 갖춘 역동적인 특 1급 비즈니스 호텔입니다.',37.560207,127.002379);

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,101,'반얀트리 클럽 앤 스파','서울특별시 중구 장충단로 60 타워호텔',3,'서울의 중심, 천혜의 자연환경 속에 자리잡은 반얀트리 클럽 앤 스파 서울은 반얀트리 최초의 회원제 클럽이자 호텔로 운영되는 도심형 리조트입니다. 인천국제공항에서는 한 시간, 서울 도심에서는 10분 거리의 고요한 남산 자락에 자리잡은 도심 속 안식처로써로서, 분주하고 바쁜 도심의 일상으로부터 벗어나 아름다운 자연과 평화로운 분위기에서 친구 또는 가족과 함께 하는 진정한 삶의 여유로움을 선사해 드립니다.',37.550698,127.001086);

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,101,'인터컨티넨탈 코액스','서울특별시 강남구 봉은사로 524',3,'인터컨티넨탈 서울 코엑스는 대한민국의 트렌드가 시작되는 강남의 중심에서 쇼핑과 여가, 비즈니스를 한 번에 누릴 수 있는 모던하고 스타일리쉬한 비즈니스 호텔이다.',37.512862,127.057260);

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,101,'엘루이호텔','서울특별시 강남구 도산대로 551',3,'전혀 새로운 서비스, 최상의 서비스를 제공하는 “호텔 엘루이” 로 다시 태어났습니다.
국,내외 비지니스맨을 위한 초 현대식 시설과 대자연의 낭만을 동시에 만끽할 수 있는 강남 영동대교 남단에 위치한 최고급 호텔 엘루이 21세기 최첨단 시설과 격조높은 서비스로 정성을 다해 모시겠습니다.',37.525905,127.054096);

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,101,'호텔 리츠칼튼 서울','서울특별시 강남구 봉은사로 120 ',3,'상세설명

서울 강남의 요충지에 자리잡고 있으며, 무역센타와 한국종합 전시장, 테헤란 밸리를 비롯하여 서울공항 터미널, 잠실 올림픽 주경기장 등과 인접해 있다. 또한 쇼핑의 천국 이태원, 현대백화점, 갤러리아 백화점을 비롯한 압구정과 청담 지역의 고급 쇼핑가와도 가까운 거리에 있어 비즈니스와 레저의 두가지 목적을 모두 충족시킬 수',37.504751,127.027496);

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,101,'라까사호텔','서울특별시 강남구 도산대로1길 83',3,'까사미의 모던하고 내츄럴한 인테리어 스타일로 디자인 되었으며 59개의 더블룸을 비롯하여 15개의 트윈룸, 9개의 싱글룸 등 총 88개의 객실을 보유하고 있다. 또한, 비즈니스 센터, 까사밀 레스토랑 등의 부대시설을 운영해 투숙객의 편의를 도모한다.',37.522156,127.019555);

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,101,'라뉘호텔','서울특별시 마포구 서강로길 20',3,'100개가 넘는 각방마다 컨셉이 다른 신촌 호텔',37.553476,126.936124);

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,101,'롯데시티호텔마포','서울특별시 마포구 마포대로 109 롯데캐슬 프레지던트',3,'"롯데시티호텔마포"는 기존의 비즈니스호텔과 차별화 된 고급스런 인테리어와 30년 전통의 롯데호텔의 노하우가 결합된 국내 최고의 비즈니스호텔을 표방합니다.',37.544883,126.950619);

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,101,'메리골드호텔','서울특별시 마포구 양화로 112 규수당 문화센터',3,'젊음과 문화의 중심지인 홍대에 위치해 있는 메리골드호텔은, 시내 중심지에 머무르기 원하는 비즈니스맨과 관광객 모두에게 최적의 장소로 활기찬 한국의 다양한 모습을 만나보실 수 있습니다. 
합리적인 가격의 비즈니스형 호텔로서 서울 마포의 최고 관심사 호텔로 인정을 받고 있으며, 또한, 외국 관광객들의 인기를 한 몸에 받을 것으로 기대하고 있습니다.',37.553284,126.919739);

--------------------------------------------------------- 댓글 순위 찾기(관광지)
select v.rank as rank, v.t_name as 이름, v.commentCount as commentCount,v.t_idx
from
(  
SELECT Dense_RANK() OVER (ORDER BY commentCount DESC) as RANK,t_name,commentCount,t_idx
FROM tbl_tourinfo
)v where v.RANK <= 5 ; 
 Commit;
update tbl_tourinfo set commentCount = 0 where t_idx in (118,102,121,120,119,117,116,115,114,113) ;



------------------------------------------- getting ranking of searchedWords!! Regions
select count(*) as count,v.searchedWord as searchedWord ,v.insertDate as insertDate from
(
select searchedWord, to_char(insertDate,'yyyy-mm-dd') as insertDate
from tbl_searchedWords where to_char(insertDate,'yyyy-mm-dd') = to_char(sysdate,'yyyy-mm-dd')
)v
group by v.searchedWord, v.insertDate
order by count desc ;


select d.rank, d.searchedWord as searchedWord,
d.insertDate as insertDate ,d.count as count
from
(
select dense_rank() over(order by count desc) as rank, m.searchedWord as searchedWord,
m.insertDate as insertDate ,m.count as count
from
(
select count(*) as count,v.searchedWord as searchedWord ,v.insertDate as insertDate from
(
select searchedWord, to_char(insertDate,'yyyy-mm-dd') as insertDate
from tbl_searchedWords where to_char(insertDate,'yyyy-mm-dd') = to_char(sysdate-1,'yyyy-mm-dd')
)v
group by v.searchedWord, v.insertDate
)m
)d 
where d.RANK <= 5 ; 


------------------------------------------------------------------- 남녀 연령대 찾기
select ageline, count(*) as count,gender from 
(
select v.name,v.userid,v.birth,v.gender,v.age, 
case 
when to_number(v.age) between 10 and 18 then '10세~18세'
when to_number(v.age) between 19 and 27 then '19세~27세'
when to_number(v.age) between 28 and 36 then '28세~36세' 
when to_number(v.age) between 37 and 45 then '37세~45세'   
when to_number(v.age) between 46 and 54 then '46세~55세'
when to_number(v.age) >= 55 then '55세 이상'  end as ageline
from 
    (
    select name ,userid, birth, trunc((sysdate - birth)/365.25)+1 as age, gender
    from tbl_member 
    )v 
   
)M
group by M.ageline, gender
order by M.ageline

-- 주한오빠가 만든거
select ageline, count
,(select count(*) from view_total_age where gender = '남' and ageline = v.ageline) as man
,(select count(*) from view_total_age where gender = '여' and ageline = v.ageline) as woman
from
(
select ageline, count(*) as count
from view_total_age
group by ageline
)v
order by ageline

------------------------------------------------------------------------------

------------ 별점 순으로 나열하기
1.	서울  2.	인천 3. 부산 4. 제주특별자치도 5.	경기도
6.	강원도 7. 	충청도 8. 	전라도  9. 	경상도

1.관광지 2.	음식점 3.	숙박 4.체험/공연



select a.t_name, dense_rank() over(order by round(a.t_rating,1) desc) as ranking,  round(a.t_rating,1)as rating 
from tbl_tourinfo A join tbl_area_detail B
on a.de_area_code = b.de_area_code
where area_code = 1 and t_type =2

----------------------------------------------- tourinfo Insert 문
select * from tab
select * from tbl_tourinfo
commit ;
insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,101,,,,,);


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_start_date,t_end_date,t_detail,tx,ty) values
(SEQ_TIDX.nextval,101,'뮤지컬 <노트르담 드 파리>','서울특별시 용산구 이태원로 294',4,to_date('2016-06-17','yyyy-mm-dd'),to_date('2016-08-21','yyyy-mm-dd'),'1482년, 파리를 뒤흔든 욕망과 사랑의 이야기',,);


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,101,'트릭아트','서울시 마포구 홍익로 3길 20 서교프라자 B2',4,'즐거운 눈속임의 천국 트릭아이 미술관 관람객이 주인공이 되는 신개념의 문화, 엔터테인먼트 공간입니다',37.553616,126.921740);

update tbl_tourinfo set t_start_date = to_date('2010-04-06','yyyy-mm-dd') where t_idx = 143;


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,101,'연극 <옥탑방고양이>','서울특별시 종로구 대학로10길 24 대학로 틴틴홀',4,'5년 연속 연극 예매율 1위! 볼수록 연애하고 싶어지는 리얼 연애지침서  연극',37.566050,127.014632);


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,t_start_date,t_end_date,tx,ty) values
(SEQ_TIDX.nextval,101,'유니버설발레단<지젤>','서울특별시 중구 퇴계로 387 충무아트홀',4,'',to_date('2016-08-17','yyyy-mm-dd'),to_date('2016-08-22','yyyy-mm-dd'),37.581580,127.003501);

commit;

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,t_start_date,t_end_date,tx,ty) values
(SEQ_TIDX.nextval,101,'브로드웨이42번가','서울특별시 서초구 남부순환로 2406',4,'한국 초연 20주년, 의심할 여지없는 세계 최고 히트작 대한민국이 열광한 최고의 쇼 뮤지컬! ',to_date('2016-09-12','yyyy-mm-dd'),to_date('2016-09-30','yyyy-mm-dd'),37.478690,127.011867);

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,t_start_date,t_end_date,tx,ty) values
(SEQ_TIDX.nextval,101,'쉬어매드니스','서울특별시 종로구 동숭길 55 대학빌딩',4,'로맨틱 코메디 연극 !  ',to_date('2016-09-11','yyyy-mm-dd'),to_date('2016-11-30','yyyy-mm-dd'),37.580731,127.004167);

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,t_start_date,tx,ty) values
(SEQ_TIDX.nextval,101,'작업의 정석','서울특별시 종로구 대학로10길 11',4,'대학로에서 유명한 로맨틱 코메디 연극',to_date('2016-09-11','yyyy-mm-dd'),37.581815,127.002790);


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,t_start_date,tx,ty) values
(SEQ_TIDX.nextval,101,'스위니토드','서울특별시 송파구 올림픽로 240 롯데월드',4,'조니뎁이 나왔단 영화',to_date('2016-02-01','yyyy-mm-dd'),37.511170,127.098852);


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,t_start_date,t_end_date,tx,ty) values
(SEQ_TIDX.nextval,101,'김종욱 찾기','서울특별시 종로구 대학로12길 73 낙산재',4,'데이트 뮤지컬 1위',to_date('2016-06-16','yyyy-mm-dd'),to_date('2017-06-17','yyyy-mm-dd'),37.580788,127.003960);

----------------------------------------------------

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,t_start_date,t_end_date,tx,ty) values
(SEQ_TIDX.nextval,401,'난타 제주','제주특별자치도 제주시 신산로 82',4,'난타는 칼과 도마등의 주방기구들이 멋진 악기로 승화되서 신나게 즐기는 공연이다',to_date('2008-04-01','yyyy-mm-dd'),to_date('2019-01-17','yyyy-mm-dd'),33.505835,126.534247);

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,t_start_date,t_end_date,tx,ty) values
(SEQ_TIDX.nextval,401,'난타 제주','제주특별자치도 제주시 신산로 82',4,'난타는 칼과 도마등의 주방기구들이 멋진 악기로 승화되서 신나게 즐기는 공연이다',to_date('2008-04-01','yyyy-mm-dd'),to_date('2019-01-17','yyyy-mm-dd'),33.505835,126.534247);

------------------------------------------
rollback;
select * from tbl_like
Select * from tbl_tourinfo where t_type=4
select * from tbl_tourinfo where t_name='트릭아트'
commit;

select * from TBL_SCHEDULE;

select * from tbl_member;
select * from tbl_statusmsg;

insert into tbl_statusmsg(userid,statusmsg) values('fiji',default);
insert into tbl_statusmsg(userid,statusmsg) values('aussie',default);
insert into tbl_statusmsg(userid,statusmsg) values('russia',default);
insert into tbl_statusmsg(userid,statusmsg) values('usa',default);
insert into tbl_statusmsg(userid,statusmsg) values('china',default);
insert into tbl_statusmsg(userid,statusmsg) values('japan',default);
insert into tbl_statusmsg(userid,statusmsg) values('korea',default);
insert into tbl_statusmsg(userid,statusmsg) values('timberlake',default);
insert into tbl_statusmsg(userid,statusmsg) values('bradpitt',default);
insert into tbl_statusmsg(userid,statusmsg) values('harrypotter',default);
insert into tbl_statusmsg(userid,statusmsg) values('mango',default);
insert into tbl_statusmsg(userid,statusmsg) values('cherry',default);
insert into tbl_statusmsg(userid,statusmsg) values('watermelon',default);
insert into tbl_statusmsg(userid,statusmsg) values('apple',default);
insert into tbl_statusmsg(userid,statusmsg) values('bene',default);
insert into tbl_statusmsg(userid,statusmsg) values('angel',default);
insert into tbl_statusmsg(userid,statusmsg) values('coffeebean',default);
insert into tbl_statusmsg(userid,statusmsg) values('starbucks',default);
----------------------------------------------------------------

select * from TBL_SCHEDULE;

update TBL_SCHEDULE set sc_likecount = 15 where sc_idx = 5;
update TBL_SCHEDULE set sc_viewcount = 30 where sc_idx = 5
update TBL_SCHEDULE set sc_viewcount = 34 where sc_idx = 3
commit;

-- 스케줄 조회수 순위
select v.rank, v.sc_idx, v.sc_name,v.sc_viewcount from
		(
		select dense_rank() over (order by  sc_viewcount desc) as rank
		, sc_idx, sc_name,sc_viewcount  from TBL_SCHEDULE
		)v
		where v.rank <= 5
    
 select * from tbl_tourinfo   
 
 
 select * from tbl_board
 
 select seq, userid , subject, readCount, to_char(regDate, 'yyyy-mm-dd hh24:mi:ss') as regDate
		from tbl_board
		order by seq desc
    
    
-------------------------
select * from tbl_tourinfo
select * from TBL_AREA_DETAIL;
    delete from tbl_tourinfo where t_idx = 66
    
    commit;
    
    alter table tbl_tourinfo modify commentcount number default 0

update tbl_tourinfo set commentcount = 0 where t_idx in(171,172,173,164,167,168,169,170,175)
---------------------

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,t_start_date,t_end_date,tx,ty) values
(SEQ_TIDX.nextval,501,'','',4,'',,,);


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,501,'동기간','경기도 가평군 가평읍 보납로 459-158',2,'서울경기권을 통틀어 보기 힘든 깊은 숲속의 대부지의 자연 음식점.',37.855204,127.548933);


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,501,'송원막국수','경기도 가평군 가평읍 가화로 76-1',2,'가평 최고의 맛집',37.826632,127.515237);

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,501,'갸평잣두부집','경기도 가평군 상면 수목원로 248',2,'2015년 1월 23일 ‘KBS 2TV 아침’ 등 각종 언론과 방송에 이미 소개된 맛집',37.756772,127.360412);

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,501,'여우사이','경기도 가평군 가평읍 상지로 245',2,'무한리필 모듬 숯불바베큐 전문점',37.768279,127.476723);


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,501,'금강막국수닭갈비','경기도 가평군 상면 수목원로 16',2,'가평 최고의 막국수',37.772410,127.371179); 


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,501,'나무아래오후','경기도 가평군 상면 임초밤안골로 254',2,'경기도 가평군 상면 소재, 핸드드립 카페, 갤러리, 화덕피자.',37.750330,127.363476); 


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,501,'아침고요수목원','경기도 가평군 상면 수목원로 432',1,'국내 최초로 가든(Garden)의 개념을 도입하여 잘 가꾸어진 정원과 자연 그대로의 아름다움이 돋보이는 공간으로, 매년 80만 명 이상의 내,외국인 방문객의 발길이 이어지며, 명실 공히 대한민국 대표 정원으로 사랑받고 있다.',37.743974,127.352467); 



insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,501,'쁘띠프랑스','경기도 가평군 청평면 고성리 616',1,'프랑스의 다양한 문화를 체험하는 곳으로 경기도 가평에 위치하고 있으며, 프랑스 현지 쌩텍쥐페리 재단과 정식 계약한 프랑스 테마파크이자 자연을 그대로 살린 친자연 공간이다.',37.714944,127.490927); 




insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,501,'유명산자연휴양림','경기도 가평군 설악면 유명산길 79-53',1,'휴양림에는 체력단련장, 삼림욕장, 오토캠핑장, 캠프파이어장, 다목적광장 등의 편의시설과 임간수련장, 유리온실, 눈썰매장, 야생화단지, 2.6㎞의 순환도로 등이 있다. 주변에 용문산과 한화콘도(양평리조트), 청평유원지 등의 위락시설과 중미산 자연휴양림, 백운봉, 사나사, 현등사 등의 관광지가 있다',37.592972,127.492381); 




insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,501,'이화원','경기도 가평군 가평읍 자라섬로 64',1,'식물원',37.818204,127.518926); 

update tbl_tourinfo set t_type=3 where t_idx in (192,193)


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,501,'연인산밸리','경기도 가평군 북면 백둔로 61-58',1,'도시를 떠나 조용하고 아름다운 자연을 감상하시면서 소중한 추억여행을 하시고 싶다면 저희 연인산밸리 펜션을 찾아주세요.',37.896786,127.495097); 



insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,501,'호반의왈츠','경기도 가평군 청평면 고재길 161',1,'저희 호반의 왈츠는 넓은 부지에 청평호반이 나무숲 사이로한눈에 들어오는 전망좋은 펜션입니다.아주 고급수럽고 우아하면서도 클래섹한 분위기의 청평호반과 단풍나무자작나무, 침엽수림이 조화를 이루어 이국적인 분위기를 자아내는 곳이랍니다',37.704767,127.506311); 



insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,501,'춘천원조숯불닭갈비','강원도 춘천시 퇴계동 697-3',2,'40여가지의 엄선된 재료로 50시간의 두번 숙성과정을 거쳐 제공하는 닭갈비 전문점 입니다.
첨단시스템 숯불초벌구이로 고기의 육즙이 풍부하며 연기와 냄새없이 깔끔하게 정통숯불닭갈비의 맛을 느끼실수있습니다.',37.865907,127.726200); 



insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,501,'춘천통나무집닭갈비','강원도 춘천시 신북읍 신샘밭로 763',2,'춘천 원조 닭갈비',37.933187,127.793346); 



insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,501,'어스17','강원도 춘천시 신샘밭로 766',2,'춘천의 대표 낭만 힐링 카페! 어스17
음악과 아름다운 자연이 함께 있어 즐거운 카페 Earth17',37.932664,127.793732); 

update tbl_tourinfo set t_name = '힐크레스트' where t_idx in 199
select * from tbl_tourinfo
commit;
insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,613,'큰집한우','강원도 춘천시 서부대성로 135',2,'1++등급의 최상급 한우와 저온 숙성 저장고에서 
50일간 건조숙성한 드라이에이징 숙성육으로 부드럽고 독특한 풍미로 고객님의 입맛을 만족시켜드리겠습니다.',37.877894,127.734873); 

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,613,'샘토명물닭갈비','강원도 춘천시 신북읍 신샘밭로 671',2,'소양댐 아래 위치한 샘토 닭갈비 집은 원조 60년대 춘천 숯불 닭갈비 맛을 느끼실 수 있습니다.
육즙이 빠지지 않게 초벌이 되어 나오는 것이 자랑이며, 보라색 감자등 강원도의 색다른 매력도 찾으실 수 있습니다.',37.930273,127.784159); 

update tbl_tourinfo set t_addr = '대구광역시 달성군 가창면 가창로 1003' where t_name ='힐크레스크'
insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,913,'힐크레스크','경상도 대구광역시 달성군 가창면 가창로 1003',1,'가족체험형 동물원, 가족뮤지컬공연, 전시, 놀이문화, 다양한 체험시설, 물놀이(여름), 눈썰매(겨울), 허브먹거리 등으로 영남권 대표 여행 관광지로써 자리매김하고 있습니다.',35.793929,128.626466); 

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,913,'두류공원','대구광역시 달서구 공원순환로 36',1,'면적 165만 3965㎡이며, 두류산과 금봉산을 중심으로 조성된 공원이다. 1965년 공원으로 지정되어 1977년부터 본격적으로 개발되었다. 체육·교양·문화 및 위락시설을 고루 갖추고 있으며, 대구광역시의 명소인 우방타워랜드와 시민문화의 전당인 문화예술회관이 자리잡고 있다. ',35.848056,128.559014);

select * from tbl_tourinfo
Commit;
insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,913,'대구수목원','대구광역시 달서구 화암로 342',1,'쓰레기 매립장을 생태적 식물공간으로 복원하여 시민들의 자연탐구와 식물 학습공간으로 이용하고, 향토 식물자원 보전 및 종의 다양성을 확보하는 기지로 제공하고자 조성하였다. 1998년 12월 조성공사에 착수하여 2002년 5월 개원하였다.',35.801369,128.520347); 


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,913,'동촌유원지','대구광역시 동구 효목동 234-15',1,'야경이 이쁜 유원지',35.882608,128.650650); 


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,913,'원조이박사해물갈비찜','대구광역시 남구 중앙대로31길 9-11',2,'저희 원조이박사해물갈비찜의 해물 갈비찜은 일반 음식점에서 느낄 수 없는 깊은 맛을 자랑하며 특별한 맛으로 손님 여러분을 모시고 있습니다',35.846481,128.589929); 


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,913,'링코스테이션','대구광역시 중구 동성로3길 59',2,'이탈리안 스파케티 전문점',35.868059,128.593873); 


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,913,'단골식당','대구광역시 북구 칠성시장로7길 9-1',2,'대구 돼지불고기 맛집',35.876024,128.603668); 

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,913,'중앙떡볶이','대구광역시 중구 동성로2길 81',2,'30년동안 한자리를 지켜온 분식점입니다. 2.28기념 중양공원 맞은편에 있는데요. 줄을 서서 먹는 곳으로 번호표를 나눠줍니다. 매콤한 쌀떡볶이와 납작만두가 인기메뉴이지요.',35.869547,128.596963); 

select * from tbl_tourinfo

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,725,'천리포수목원','충청남도 태안군 소원면 천리포1길 187 천리포수목원',1,'식물 관련학과 또는 관련기관의 교육 및 연구목적을 위한 경우와 후원회 회원에 가입한 사람에게만 개방한다. 개원 시간은 오전 9시부터 오후 4시 30분까지이다. 휴원일은 매주 수요일과 설날 및 추석연휴, 그리고 수목원 창립기념일인 7월 14일이다',36.798771,126.149585); 



insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,725,'안면도자연휴양림','충청남도 태안군 안면읍 안면대로 3195-6',1,'1992년 9월에 개장했으며, 구역면적은 175만㎡, 1일 수용인원은 2,000명이다. 충청남도청에서 관리한다.',36.497205,126.361786); 


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,725,'몽산포해수욕장','충청남도 태안군 남면 몽산포길 65-27',1,'서산 남서쪽 18km, 태안 남쪽 9km, 남면반도 서안에 펼쳐져 있다. 깨끗한 백사장에 끝없이 펼쳐진 솔밭이 아름답고 물새 등 조류의 낙원을 이루며,
주변에는 천연기념물 모감주나무의 군락이 있어 많은 피서객이 모여든다. 태안해안국립공원에 속한다',36.669768,126.286879); 



insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,725,'모항항','충청남도 태안군 소원면 모항리 121-4',1,'관광어항으로 나날이 발전하는 어항',36.770465,126.141618); 



insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,725,'학암포해수욕장','충청남도 태안군 원북면 옥파로 1163-27',1,'개장기간 : 매년 7~8월,
요금입장료 무료,
주차가능,
시설 및 제공서비스 : 화장실 매점 야영장',36.898890,126.207666); 



insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,725,'만대회수산','충청남도 태안군 이원면 원이로 2969',2,'만대 수산물 판매장의 주인 양경석 입니다.
100% 자연산 취급을 전문으로 합니다갯바위 낚시(해변), 체험마을(만대)이 주변에 있습니다.',36.966774,126.303423); 



insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,725,'진송꽃개집','충청남도 태안군 안면읍 안면대로 3015',2,'최고의 맛, 최상의 품질을 자랑하는 안면도맛집 
진송꽃게집입니다. 커플, 가족단위의 손님분들을 위한 정식메뉴를 푸짐하고 저렴한 가격으로 모십니다.',36.508675,126.349203); 


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,725,'수미정','충청남도 태안군 안면읍 그네들길 147',2,'한식대첩 충남대표,생생정보통,삼색기행에 나온 게국지 간장게장 전문점 입니다.
수미정 알찬꽃게 본점과 수라정 꽃게집 분점을 운영하고 있는 안면도에서 가장 크고 전통있는 식당입니다.',36.533305,126.350161); 


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,725,'카페바다','충청남도 태안군 안면읍 해안관광로 276-19',2,'안면도 로스터리카페 바다
핸드드립, 에스프레소 베리에이션, 파운드, 컵치즈 판매합니다.
일~금 10:00~19:00, 토 10:00~19:00시까지
매주 화요일 휴무입니다.',36.526511,126.334245); 


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,725,'꽃지원조꽃게집','충청남도 태안군 안면읍 꽃지1길 185',2,'안면도맛집,안면도게국지,
꽃게탕,간장게장,양념게장,갈치조림,KBS2TV아침방영',36.502313,126.338986); 


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,725,'BAYBREEZE','충청남도 태안군 소원면 만리포2길 235-9',3,'바다 앞 호텔',36.794261,126.146414); 


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,725,'안면프라자호텔','충청남도 태안군 안면읍 방포로 29-5',3,'새롭게 리모델링한 안면도 프라자호텔은 다양한 객실타입(트윈,더블,트리플,스위트,한실룸)등이 있으며 각종 모임, 연수, 워크샵,
돌잔치등을 유치할수 있는 큰 규모의 연회장과 편히 즐길수 있는 바베큐 시설과 안락하고 편안한 시설의 고급 카페시설이 있습니다.',36.514824,126.344405); 


Commit;


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,831,'백제간장게장','전라북도 전주시 완산구 쑥고개로 284-10',2,'게장은 흔히들 밥도둑이라고 하죠?저희 백제간장게장! 집에 오셔서 그말을 한번 느껴보고 가시죠! 
신선한 재료만 사용하니 게장맛이 더 좋으실 겁니다.무한리필이니 마음껏 드시고 가세요 ^^  많이들 찾아주세요 ! ',35.800421,127.096393); 

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,831,'스시다미','전라북도 전주시 완산구 마전로 5 피디빌딩2층',2,'강남초밥명인 7인의 무한리필회전초밥, 럭셔리수제활어 무한리필, 신시가지 KBS 뒤',35.821446,127.103964); 

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,831,'이환메추리장어요리','전라북도 전주시 덕진구 삼거1길 68',2,'30년 전 메추리농장으로 시작 맛에 고장 전주에서 메추리구이, 메추리 탕으로 맛 집으로 유명해진 집. 현재는 메추리구이, 탕, 장어구이가 메인 메뉴 입니다.',35.853938,127.195037); 

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,831,'조점례남문피순대','전라북도 전주시 완산구 전동3가 2-198',2,'약 100여석의 좌석 마련되어 있습니다.',35.812592,127.146981); 

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,831,'옛촌막걸리','전라북도 전주시 완산구 서신천변로 11',2,'전주막걸리 원조 서신동 맛집 옛촌막걸리는 전주를 방문하는 내ᆞ외국인들에게 깨끗하고 위생적인 맛집으로 사랑받고있습니다.',35.826303,127.114158); 

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,831,'경기전','전라북도 전주시 완산구 풍남동3가 102',1,'1991년 1월 9일 사적 제339호로 지정되었다. 1410년(태종 11)에 임금은 전주, 경주, 평양에 태조 이성계의 어진을 봉안하고 제사하는 전각을 짓고 어용전(御容殿)이라 하였다. 경기전은 왕조의 발상지라 여기는 전주에 세운 전각으로, 세종 때 붙인 이름이다. 건물은 정유재란 때 소실되었던 것을 1614년(광해군6)에 중건하였다. 보호면적은 49,590㎡이다.',35.815377,127.150100); 

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,831,'전주동물원','전라북도 전주시 덕진구 소리로 68',1,'1978년 6월 10일에 개원하였으며, 면적 118,800㎡이다. 지방동물원 중 가장 오래된 동물원으로 과천 서울대공원 동물원, 용인 에버랜드 동물원에 이어 세번째 규모이다.',35.856091,127.144924); 

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,831,'덕진공원','전라북도 전주시 덕진구 덕진동2가 1314-4',1,'전주역 북쪽 3 km 지점에 있는 덕진호(德津湖) 일대의 유원지로, 시민공원이라고도 한다. 동쪽의 건지산(乾止山), 서쪽의 가련산(可連山)을 잇는 덕진제(德津堤)에 수양버들 ·벚꽃나무가 늘어서고, 5월이면 창포와 연꽃이 수면을 메우는데, 특히 덕진 연꽃은 널리 알려져 있다. ',35.847364,127.121780); 
Commit;

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,831,'르시엘호텔','전라북도 전주시 덕진구 산정2길 23',3,'전주 신개념 중저가 패밀리 호텔 르시엘 입니다. 이용하시는 고객 여러분들에게 신뢰감을 주기 위하여 전라북도와 전주시의 지정을 받았으며, 한국관광공사 굿스테이 승인을 받았습니다',35.838280,127.168395); 

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,831,'장수한옥민박','전라북도 전주시 완산구 은행로 55-1',3,'장수숙박은 한옥마을 중심지 사거리에 관광의 최적의 위치하여 
볼거리, 먹거리, 즐길거리, 문화체험 등 가깝게 자리잡고 있는 전통한옥 체험 숙박업소입니다.',35.815042,127.152883); 

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,831,'골목게스트하우스','전라북도 전주시 완산구 자만동2길 14',3,'1인당 2만원입니다',35.814086,127.156552); 

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,831,'풍금게스트하우스','전라북도 전주시 완산구 경기전길 153-10',3,'1935년 을해년에 지어진 높은 기와의 한옥집! 본채는 남향으로 사랑채 및 행랑채는 동향으로 건립되어 본채와 사랑채가 조화를 이루는 전통 한옥중의 한옥입니다. 더불어, 전주 한옥마을의 중심부인 성심여고 정문에 위치하여 먹거리골목과 경기전, 전동성당에서 매우 가깝고 여행하시기에 편리합니다.',35.812447,127.151911); 

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,831,'낙산톡게스트하우스','전라북도 전주시 완산구 어진길 122-6',3,'정동성당에서 걸어서 5분 경기전 후문 쪽
전북예술회관 맞은편 주유소 뒷건물',35.816844,127.148110); 


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,831,'햇살가득게스트하우스','전라북도 전주시 완산구 은행로 5-7',3,'무료한복체험 (고급한복 50%할인+악세서리 무료서비스),닌텐도wii 무료대여, 보드게임 무료대여, 무료 무인카페 (햇살가득 고객만 이용가능)
, 한옥마을 내 위치, 전객실 개별화장실.',35.819705,127.152094); 

commit;
select * from tbl_tourinfo;


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,831,'주리화','전라북도 전주시 완산구 전라감영5길 17-26',4,'한복을 대여 할 수 있는 곳 ',35.817168,127.145446); 


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,831,'말순이','전라북도 전주시 완산구 경기전길 119',4,'예쁘고, 고급스러운 한복들이 많은 이곳에서
즐거운 전주한옥마을 여행을 만드세요..',35.814288,127.151755); 

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty,t_start_date,t_end_date) values
(SEQ_TIDX.nextval,831,'<뮤지컬> 성, 춘향','전라북도 전주시 완산구 팔달로 161 예술회관',4,'춘향전을 뮤지컬로 즐기세요',35.816838,127.147075,'2016-04-19','2016-12-19'); 

경상도 통영시

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,942,'한려수도조망케이블카','경상남도 통영시 발개로 205',1,'통영을 한번에 볼 수 있어요',34.826452,128.425438); 


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,942,'이순신공원','경상남도 통영시 멘데해안길 205',1,'망일봉 자락에 조성된 이순신공원은 아름다운 통영 바다가 펼쳐진 풍광이 아름다운 공원이다.',34.844423,128.443266); 


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,942,'장사도해상공원','경상남도 통영시 한산면 장사도길 55',1,'배타고 나가야하는 조용한 섬',34.713834,128.558907); 


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,942,'달아공원','경상남도 통영시 산양읍 산양일주로 1115',1,'공원은 미륵도 남쪽 끝에 있는데 완만한 공원길을 따라 올라가면 관해정(觀海亭)이 서 있다. 이곳에서는 한려해상국립공원이 한눈에 들어오며, 특히 일몰이 장관이다.
',34.769735,128.400818); 


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,942,'남망산조각공원','경상남도 통영시 남망길 139',1,'충무공원(忠武公園)이라고도 한다. 벚나무와 소나무가 우거진 높이 80 m의 남망산을 중심으로 전개된 공원으로 남동쪽으로 거북등대와 한산도(閑山島) ·해갑도(解甲島) ·죽도(竹島) 등의 한려수도(閑麗水道)의 절경을 바라볼 수 있다. ',34.839442,128.429612); 


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,942,'통구미횟집','경상남도 통영시 통영해안로 247',2,'싱싱한 회',34.839788,128.422223); 


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,942,'통영명가','경상남도 통영시 동피랑길 6',1,'통영명가는 통영에서 생산되는 신선한 굴과 해산물을 이용한 요리를 맛보실수있는 곳입니다 
굴셋트와 굴코스 굴탕수육,멍게비빕밥,회덥밥등 다양한 메뉴가 있습니다',34.845107,128.426864); 
update tbl_tourinfo set t_type=2 where t_idx = 268
select * from tbl_tourinfo
insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,942,'오미사꿀빵','경상남도 통영시 충렬로 14-18',2,'통영에서 가장 맛있는 꿀빵',34.842673,128.420304); 


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,942,'통영해물가','경상남도 통영시 통영해안로 377',2,'통영 동호동 맛집.동피랑마을과 2~3분 거리에 위치',34.844498,128.428595); 


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,942,'통영생선구이','경상남도 통영시 용남면 동달안길 84',2,'생선구이 정식이 유명한 곳',34.864299,128.446517); 


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,942,'달인충무김밥','경상남도 통영시 통영해안로 317',2,'통영 충무 김밥 1호',34.843121,128.423262); 


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,942,'울산다찌','경상남도 통영시 미수해안로 157',2,'통영만의 독특한 술문화를 담고 있는 음식점 다찌의 30년 전통 터줏대감집.
울산댁이 처음으로 시작을 하여 울산다찌라 칭했으며, 현재 3대째 이어오고 있음.',34.832985,128.414510); 


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,942,'동광식당','경상남도 통영시 통영해안로 343-1',2,' 저희 동광식당은 40년 전통의 복국 전문점으로 항상 변하지 않는 맛으로 여러분을 모시고 있습니다. 가족, 동료 및 각종 모임을 위한 단체연회석도 완비하고 있사오니, 편안하게 찾으셔서 맛있는 식사를 즐기시기 바랍니다. 모든 음식 하나하나에 정성을 쏟아 만들어 음식을 맛보신 고객분들은 분명히 만족하실 것을 약속 드립니다. ',34.844935,128.425003); 

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,942,'홈게스트하우스','경상남도 통영시 서송정1길 46-18',3,'통영홈게스트하우스는 통영도남관광특구 안에 있어 해저터널, 전혁림미술관, 통영케이블카, 동피랑, 이순신공원,
소매물도, 장사도등 관광지 중심에 위치하여 빠른시간에 둘러보기 좋고, 특히 토영이야길(통영이야기길)중간에 있어 
1코스 2코스가기가 좋습니다.',34.831386,128.419581); 

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,942,'프라임시티','경상남도 통영시 정동1길 35',3,'통영 동피랑마을과 5분거리에 위치한 신축 프라임시티 게스트하우스와 통영 죽림에 위치한 M모텔입니다',34.841850,128.423051); 

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,942,'통영게스트하우스','경상남도 통영시 넓은개길 38',3,'1호점은 그만두었습니다 통영게스트하우스 2 .3호점을 이용해주십시오',34.827416,128.429247); 

commit;

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,930,'대왕암공원','울산광역시 동구 일산동 산907',1,'넓이는 약 93만m²이다. 1906년에 설치된 울기등대가 있어 1962년 5월 14일부터 울기공원이라고 불리다가, 2004년 2월 24일 대왕암공원으로 명칭을 변경하였다. 공원에는 신라시대 문무대왕의 왕비가 죽어서도 호국룡이 되어 나라를 지키겠다 하여 바위섬 아래에 묻혔다는 전설이 서린 대왕암이 있다. ',35.492662,129.439364); 

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,930,'울산대공원','울산광역시 남구 대공원로 94',1,'울산 대공원은 도시환경의 질과 삶의 질을 높이는데 적극 기여할 것이며 도시의 형평성 있는 성장의 촉매작용을 할 것으로 생각되어 앞으로의 여러 세대에 걸쳐 울산인의 문화적 생활의 질의 향상은 물론 20세기 도시, 산업도시인 울산을 21세기의 도시 산업과 자연이 어울어지는 도시로 전환할 수 있는 창조적 일보를 내딛을 것으로 기대합니다.',35.531074,129.293983); 

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,930,'진하해수욕장','울산광역시 울주군 서생면 진하리 토지구 획정리지구내 9B',1,'모세의 기적을 볼 수 있는 투명한 은빛세계
개장기간 : 매년 7~8월
요금입장료 무료',35.388116,129.346336); 

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,930,'선암호수공원','울산광역시 남구 선암호수길 104',1,'지압보도·데크광장·탐방로· 장미터널 등의 산책로와 야생화단지·꽃단지·생태습지원· 연꽃군락지 등의 자연탐방지가 있다. 레포츠시설로는 인조잔디축구장, 우레탄족구장, 서바이벌게임장, 모험시설, 피크닉잔디광장이 있다.',35.516892,129.322473); 

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,930,'반구대암각화','울산광역시 울주군 언양읍 대곡리 산234-1',1,'1995년 6월 23일 국보 제285호로 지정되었다. 울산의 젖줄 태화강 상류 반구대 일대의 인공호(人工湖) 서쪽 기슭의 암벽에 새겨졌다. 댐의 축조로 평상시에는 수면 밑에 있다가 물이 마르면 그 모습을 보인다. 그 크기는 가로 약 8m, 세로 약 2m이고, 조각은 암벽 밑에까지 부분적으로 퍼지고 있어, 밑에서부터 암각화 상단선까지의 높이는 3.7m쯤 된다.',35.603919,129.178230); 

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,930,'외고산옹기마을 ','울산광역시 울주군 온양읍 외고산3길 36',1,'1957년 허덕만 씨가 이주하여 옹기를 굽기 시작하면서부터 옹기촌이 형성되었고, 한국전쟁 이후 증가된 옹기수요로 인해 옹기기술을 배우려는 이들이 모여들어 급속도로 성장한 마을이다.',35.435180,129.279553); 

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,930,'태화강십리대밭','울산광역시 중구 태화동 969-12',1,'대나무밭이 태화강을 따라 십리에 걸쳐 펼쳐져 있다고 해서 십리대밭이라고 부르는데, 본격적으로 대밭이 형성된 곳은 무거동 삼호교부터 태화동 동강병원까지이다. ',35.549695,129.291597); 

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,930,'언양진미불고기','울산광역시 울주군 삼남면 중평로 33',2,'봄철 별미 - 불고기 먹으로 오세요',35.558197,129.120193); 

commit;
insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,930,'홉스피제리아','울산광역시 남구 삼산중로74번길 28',2,'불고기 피자가 가장 유명한 곳',35.540475,129.338401); 

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,930,'바다바라기','울산광역시 북구 정자1길 111',2,'바닷가전망의 대게와횟집운영 하는 바다이야기는 일반 초장집과 다르게 위생상태 및 내/외부 인테리어가 고급스러운 음식접이다. 회나 대게가 대표음식이고, 간단한 식사류도 판매되고 있어 부담 없이 식사할 수 있다',35.621550,129.446459); 

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,930,'조선의한우','울산광역시 남구 왕생로 34',2,'울산의 최고의 맛집. 조선의 한우로 오세요',35.536657,129.332205); 

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,930,'번지식당','울산광역시 중구 중앙길 91-1',2,'여러가지 덮밥과 초밥을 밤9시30분시까지 판매하고있습니다!!
그리고 술도 판매됩니다!! 
안주도 다양하게 준비되어있으니 가족,친구,연인들과 함께 
기분좋은 술자리도 즐기세요!!',35.555646,129.318309); 
select * from tbl_tourinfo
update tbl_tourinfo set t_type=1 where t_idx = 303
Commit;
insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,529,'벽초지문화수목원','경기도 파주시 광탄면 창만리 166-1',1,'소나무와 야생화·초화류로 꾸민 빛솔원, 초화류와 관목으로 꾸민 유럽풍 정원인 퀸즈가든(Queens Garden), 잎과 꽃에 무늬가 있는 식물을 모아둔 무늬원, 초화로 구성된 무지개원, 숙근초·야생화원이 있으며, 단풍터널길·주목터널길·버드나무길 등의 산책로가 조성되어 있다.',37.800985,126.873358); 

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,529,'오두산 통일전망대','경기도 파주시 탄현면 필승로 369',3,'1992년 9월 8일 개관하였다. 한강과 임진강이 만나는 오두산은 예로부터 서울과 개성을 지키는 군사적 요충지로 고려 말에 쌓은 산성이 아직도 남아 있다. 산 정상에 세워진 통일전망대는 지상 5층, 지하 1층의 석조건물로서, 해발 140m의 높이에 자리잡은 원형전망실에서는 북쪽으로 개성시의 송악산(松嶽山:489m)이 보이고 북한 주민들이 농사짓는 모습도 볼 수 있다.',37.773643,126.677606); 

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,529,'보광사','경기도 파주시 광탄면 보광로474번길 87',1,'파주 관광지',37.753880,126.920857); 

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,529,'통일동산','경기도 파주시 탄현면 성동리 산42',1,'동서화합의 급속한 진전과 더불어 남북한 교류협력의 장을 마련하기 위한 가시적 사업추진이 요구됨에 따라 1989년 한민족공동체 통일방안 발표에서 제시된 평화시 건설구상의 일환으로 경기도 파주시 탄현면 성동리 일원에 조성 중인 안보·관광단지이다',37.782722,126.681640); 

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,529,'프로방스','경기도 파주시 탄현면 새오리로 77',1,'아름다운 마을 행복을 드리는 마을 프로방스입니다.
프로방스는 프랑스 남부 지방의 낭만과 고흐의 정열을 담아 만든 멀티 테마타운입니다.
1996년 프랑스 요리와 한국적 해석이 가미된 레스토랑은 2개층에 350석을 갖춘 프로방스 레스토랑.
안심스테이크, 스파게티와 해물탕을 토마토와 칠리고추로 양식화한 해물스튜등 10년 넘게 인기를 유지하고 있습니다',37.790852,126.684417); 

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,529,'김포가마솥해장국','경기도 파주시 조리읍 등원로 259',2,'신선한 재료와 한우 머리뼈로 가마솥에 오랜시간 끓여낸 육수맛이 개운하며, 김치 깍두기와 잘 어우러진 명품 해장국 !!
',37.767766,126.824626); 

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,529,'로빈의숲','경기도 파주시 탄현면 장릉로102번길 4-6 ',2,'바베큐 맛집',37.769154,126.709170); 

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,529,'반구정나루터','경기도 파주시 문산읍 반구정로85번길 13',2,'베기매운탕,장어구이가 맛있습니다',37.868537,126.751892); 

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,529,'가림시골밥상','경기도 파주시 탄현면 새오리로 68',2,'가정식 백반 집',37.790766,126.685919); 

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,529,'위즈호텔','경기도 파주시 탄현면 성동로 20-45',3,'호텔내 모든 공간에서 위즈만의 예술품과 분위기로 고객님의 마음을 사로잡고, 근래 호텔에서 보기힘든 객실내 노천탕 및 히노끼,스파시설,습식 사우나 등이 고객님이 생각하는 무거운 이미지의 호텔에서 탈피한 신개념 호텔입니다.',37.776628,126.687748); 

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,529,'칼튼호텔','경기도 파주시 탄현면 성동로 34',3,'자연과 어우러진 유니크한 예술이 고급스러움을 선사하는 곳입니다.
입구에 들어서는 순간부터 커피향과 어우러진 편안함이 느껴지고,넓은 창, 깨끗한
객실은 답답함을 잊게하며,친환경 라텍스 침대의 안락함과 매일 아침 조리되어 무료로 제공되는 신선한
식사 등은 저희 carlton hotel만의 자랑이라 하겠습니다.',37.777239,126.687762); 

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,529,'아델휴','경기도 파주시 탄현면 새오리로 215-66',3,'아델 휴 는 독일어로 귀족을 뜻하는 아델(ADEL)과 한자로 휴식을 뜻하는 휴(休)가 더해져 만들어진 고품격 ※매스티지 트랜드를 제시하며 실내는 천연대리석, 원목 후로링 바닥재, 오크 집성목 계단판 등 고급 마감재를 사용했으며 주방은 이탈리아산 수입가구로 채워져 있습니다.',37.802875,126.685989); 

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,605,'아바이마을','강원도 속초시 청호로 122',1,'행정상 명칭은 청호동(靑湖洞)이고, 아바이마을은 속칭이다. 1·4후퇴 당시 국군을 따라 남하한 함경도 일대의 피난민들이 전쟁이 끝난 뒤 고향으로 돌아갈 길이 없게 되자, 휴전선에서 가까운 바닷가 허허벌판에 집을 짓고 집단촌락을 형성하였다. 이후 함경도 출신 가운데서도 특히 늙은 사람들이 많아, 함경도 사투리인 아바이를 따서 아바이마을로 부르기 시작한 것이다.',38.200592,128.594684); 



insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,605,'신흥사','강원도 속초시 설악산로 1137 신흥사',1,'1984년 6월 2일 강원문화재자료 제7호로 지정되었다. 《사적기(寺蹟記)》에 따르면 653년(신라 진덕여왕 7) 자장(慈藏)이 창건하고 석가의 사리(舍利)를 봉안한 9층사리탑을 세워 향성사(香城寺)라고 불렀다. 고기(古記)에 자장이 637년(선덕여왕 6) 왕명으로 당(唐)나라에서 불도를 닦고 귀국하여 건립한 사찰이라고도 전한다. ',38.175820,128.484571); 



insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,605,'속초등대','강원도 속초시 영금정로5길 8-28',1,'설악산경관과 멀리 금강산자락까지 조망할수 있는
속초시 영랑동에 위치한 속초등대는 영금정 속초 등대전망대라고 많이 알려져 있다.',38.214026,128.599629); 



insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,605,'척산온천휴양촌','강원도 속초시 관광로 327',1,'53℃ 온천수가 공급되는 900명 동시 수용능력의 대욕장 외에 양실과 한실 38실을 갖추고 있다. 10인 이상 이용이 가능한 객실도 있다.',38.190151,128.540330); 



insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,605,'소야촌','강원도 속초시 원암학사평길 132',2,'소야촌은 한화콘도워터피아 옆에 있으며 속초 최대 한우전문점으로 한우 최고등급 ++만을 취급하며 실내.야외바베큐장 포함
동시에 500명 식사 가능하고 한우구이,한우불고기,한우가마솥설렁탕이 유명하고 특히 한우삼합(한우+표고버섯+키조개관자)이 매우유명합니다.단체회식을위한 룸이 준비되어있으며 대형주자창 완비되어있습니다',38.206633,128.522397); 



insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,605,'비치대게직판장','강원도 속초시 중앙로 260',2,'KBS 생생정보통 방영(886회) - 대게, 킹크랩, 푸짐한 스끼다시, 게딱지볶음밥, 홍게라면 등 메뉴 소개.
대게를 드시는 손님들께는 무조건 회를 제공해 드립니다 
또한 네이버 예약시스템을 통해 예약을 하시고 오시는 손님들께는 추가 10%의 할인혜택도 드립니다',38.212736,128.596639); 



insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,605,'만석닭강정','강원도 속초시 청초호반로 72',2,'후라이드 15000원 양념 16000원',38.190364,128.588670); 



insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,605,'봉포머구리집','강원도 속초시 청초호반로 56',2,'물회가 가장 유명합니다',38.190347,128.588692); 



insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,605,'청초수물회','강원도 속초시 엑스포로1길 14',2,'정말 맛있습니다. 찾아주셔서 감사합니다.',38.190998,128.588732); 



insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,605,'마레몬스호텔','강원도 속초시 동해대로 3705',3,'여러가지 유산을 가진 국제적 휴양도시 속초에 자리한 호텔 마레몬스는 ´국제적 휴양도시´라는 위상에 어울리는 최고의 시설과 최상의 서비스로 한분한분의 고객을 정성을 다해 모시고 있습니다.',38.166874,128.606170); 



insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,605,'더클래스300','강원도 속초시 동해대로 3915',3,'더클래스 300는 앞으로는 맑고 시원한 바다전망이, 뒤쪽으로는 병풍처럼 둘러진 설악산이 보이는 아름다운 호텔이다.
306실의 내집같이 안락하고 편안한 객실, 아늑하고 세련된 분위기를 갖춘 품격있는 호텔로 격조 높은 서비스로 최상의 아늑함과
편안함 속에서 아름다운 추억을 만들 수 있다.',38.184533,128.600320); 



insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,605,'설악켄싱턴스타호텔','강원도 속초시 설악산로 998',3,'설악 켄싱턴 호텔은 세계 최초의 스타 테마 호텔로 국내 스포츠계 스타들과 각국 대사의 진귀한 소장품을 기증받아 꾸며졌으며 곳곳에서 명사들의 숨결을 가깝게 교감 할 수 있고 명사들이 투숙한 객실을 선택해 이용할 수 있다. 
설악산 전망을 바라보는 아름다운 전망은 켄싱턴 스타 호텔 객실에서만 보실 수 있으며 조용하고 품격 있는 휴식과 남다른 추억을 선사하는 설악 유일의 영국식 특급 호텔이다. ',38.172787,128.499252); 



insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,605,'호텔설악파크','강원도 속초시 설악산로 852-15',3,'호텔설악파크는 1980년 개관이래 설악권 최고의 특급호텔로 그 자존심을 지켜왔다.
산, 바다, 온천, 호수 등 모든 자연환경을 구비한 위치적인 장점과 북유럽풍의 독특한 외형으로 많은 고객들로부터 사랑을 받고 있으며 고객만족 최우선을 목표로 삼아 모든 고객에게 타 호텔과의 차별화된 서비스를 제공하여 삶의 여유와 자연의 아름다움을 느끼고 싶은 곳이 되도록 모든 임직원은 노력하고 있다.',38.170167,128.512721); 

Commit;
select * from tbl_tourinfo
order by t_idx
select * from tab;
select * from TBL_AREA_DETAIL

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,707,'한밭수목원','대전광역시 서구 둔산대로 157',1,'도심 속의 한밭수목원은 정부대전청사와 과학공원의 녹지축을 연계한 전국 최대의 도심 속 인공수목원으로 각종 식물종의 유전자 보존, 청소년들에게 자연체험학습의 장, 시민들에게는 도심속에서 푸르름을 만끽하며 휴식할 수 있는 공간을 제공하는데 목적이 있습니다. ',36.366922,127.387026); 


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,707,'대전오월드','대전광역시 중구 사정동 산39-1',1,'총 17만 6천평 부지에 녹지 공간, 동물사, 유희시설, 조각 공원 등을 마련하고 2002년 보도를 이용한 마운틴 사파리, 2003년 세계 최초의 나이트 사파리를 운영하고 있으며, 세계 희귀종인 록키산양 등 140종 700수의 다양한 동물전시로 체험, 휴식공간 및 교육의 기회를 제공하고 있습니다.',36.289446,127.402291);


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,707,'엑스포 과학공원','대전광역시 유성구 대덕대로 480',1,'1993년 8월 7일부터 11월 7일까지 개최되었던 대전세계박람회(엑스포)가 끝난 뒤 그 시설과 부지를 국민과학교육의 장으로 활용하기 위하여 조성되었다. 1994년 8월 7일 문을 열었다. 대덕연구단지와 국립중앙과학관이 협력하여 개발한 각종 첨단 과학기술의 전시와 최첨단 영상을 통한 입체적이며 색다른 과학 학습의 공간으로 꾸며져 있다.
',36.378216,127.384264);


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,707,'계족산','대전광역시 대덕구 장동 산85',1,'높이는 429m로, 대전광역시 동쪽에 있으며, 산줄기가 닭발처럼 퍼져 나갔다 하여 계족산이라 부른다. 서쪽에는 성재산(390m)이 나란히 서 있다. 사방 원형의 산봉우리로 이루어져 있으며, 금병산, 우산봉, 갑하산으로 산줄기가 이어진다. 
',36.394645,127.453719);


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,707,'솔로몬파크','대전광역시 유성구 엑스포로 219-39',1,'테마공원입니다',36.377880,127.400037);


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,707,'학일식','대전광역시 유성구 온천북로33번길 13',2,'황제탕으로 유명한 일식전문점, 회정식 및 코스요리, 상견례, 모임장소, 단체예약 가능
',36.357609,127.346604);


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,707,'임진강장어','대전광역시 유성구 문화원로 143',2,'저희 임진강장어는 포천 참숯으로 요리하는 풍천 민물 장어 전문점입니다. 
대전 맛집 중 한곳으로 TV나 신문으로도 알려진 맛집 중 한곳입니다.',36.361432,127.335319);


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,707,'장수골흑염소','대전광역시 동구 대전로 579',2,'입맛도 없고 자꾸 늘어지기만 하는 여름에는 적당한 운동과 함께 균형 있는 영양섭취로 체력을 유지하는 것이 중요합니다. 덥다고 해서 찬 음식만 찾게 되면 입맛을 잃고 몸도 냉해져서 건강을 해칠 수 있습니다. 흑염소의 경우 대표적인 보양식으로 손꼽아 추천하는 스태미나 음식입니다.',36.312746,127.441415);

 
insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,707,'유성호텔','대전광역시 유성구 온천로 9',3,'유성호텔은 1915년 개관이래 온천 역사 80여년의 전통과 온천수를 자랑하는 온천 레저 호텔이며, 국내외 학술회의 및 세미나 기업체 연수 등을 위한 완벽한 시설을 갖춘 190실규모의 특급호텔이다. 낭만적인 신혼여행 뿐만 아니라 가족, 친구들, 소중한 사람들과의 안락한 휴식을 즐길 수 있다',36.356189,127.339066);

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,707,'호텔인터시티','대전광역시 유성구 온천로 92',3,'호텔 인터시티는 고객감동 서비스를 최우선으로하며, 최고급화 및 국제화를 지향하는 특급호텔입니다.
금강지류가 한눈에 보이는 시원스러운 조망과 비지니스의 편리함을 함께 갖추고 있으며 온천지역 유성의 중심에 
위치하고 있어 온천을 겸비한 레저를 함께 즐기실수 있습니다.',36.354419,127.347971);


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,707,'호텔선샤인','대전광역시 동구 가양동 451-1',3,'행정과 과학의 중심지인 대전에 위치 대전교통의 요지 고속터미널 맞은편에 위치하여 편리한 교통. 럭셔리한 인테리어와 각종 부대시설.. 거기에 고객님 한분한분을 VIP로 모시는 서비스까지 고객님께 편리함과 편안함을 동시에 드릴수 있는 최고의 호텔로 거듭나겠습니다.',36.349196,127.437732);
Commit;



insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,901,'외도 보타니아','경상남도 거제시 일운면 외도길 17',1,'외도에는 승용차가 들어갈 수 없고 유람선 이용, 유람선 이용시 주차 무료, 외도에서는 숙박도 불가능하며 상륙관광만 가능하다. 상륙관광은 1시간 30분 가량 소요된다.',34.769925,128.712616);


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,901,'구조라해수욕장','경상남도 거제시 일운면 구조라리 500-1',1,'유람선 타고 내도, 외도, 해금강까지! 개장기간 : 매년 7~8월 중,요금입장료 무료,시설 및 제공서비스 : 샤워실 탈의실 화장실 급수대 야영장',34.808943,128.691195);


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,901,'거제자연휴양림','경상남도 거제시 동부면 거제중앙로 325',1,'1993년에 개장하였고, 구역면적은 120㎡, 1일 수용인원은 600명이다. 거제시청에서 관리한다.',34.785908,128.625968);


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,901,'거제씨월드','경상남도 거제시 일운면 지세포해안로 15',1,'대인 22000원 소인 15000원',34.833783,128.701938);


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,901,'박정현게장백반','경상남도 거제시 장승포로 2',2,'신선, 정직, 건강하고 맛있는 거제도맛집 박정현게장백반입니다.
늘 아낌없는 성원과 관심을 보내주시는 
여러분들께 진심으로 감사의 말씀을 드립니다.
',34.867307,128.724765);


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,901,'포로수용소굴구이','경상남도 거제시 계룡로길 7',2,'거제도에 오시면 꼭 드시고 가야 할 음식 
거제도 8품(거제도를 대표하는 8가지 특산품) 중 첫 번째 굴요리입니다.
거제도 8미(거제도를 대표하는 8가지 음식)의 대표인 굴요리, 멍게, 성게비빔밥
사계절 굴요리와 멍게, 성게 비빔밥을 맛보세요~~~~~~~~!!!! ',34.877994,128.623088);



insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,901,'중앙식당','경상남도 거제시 옥포로 215',2,'가정식 백반',34.893820,128.690823);



insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,901,'예이제게장백반','경상남도 거제시 장승로 113',2,'예이제게장백반은 비리지않고 꽉찬 살이 먹음직스러운 짭조름한 밥도둑 게장전문점으로 25년간 오직 한길만을 걸어 왔으며 최고의 맛으로 여러분들께 최상의 만족을 드리고자 노력하고 있습니다. 저렴한 가격에 간장게장,양념게장,간장새우,성게미역국을 무한리필로 드실 수 있는 거제도맛집! 본점에이어 바람의언덕점도 많은 방문 부탁드립니다. ',34.864591,128.722905);



insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,901,'아수라','경상남도 거제시 장승로 68-2',2,'안녕하세요 한우고기말이전문점 아수라입니다. 아수라는 한우 우둔살을 깻잎 파 부추 등과같은 채소로 만들어져있어 건강식을 모티브로하여서 가족들과 함께드시키에 안성맞춤인 제품입니다',34.860833,128.723389);



insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,901,'아리아리랑','경상남도 거제시 거제중앙로29길 12',2,'안동민속한우 생갈비는 충분한 숙성과정을 거쳐 풍부한 육즙, 고소함과 담백함을 동시에 맛보실수 있으며, 생갈비를 드시면 매운 갈비찜을 서비스로 해드립니다. 또한 간장게장 정식은 서해 연평도에서 봄철에 어획한 알배기 암게만 사용하고 일반 꽃게와는 달리 살과 알이 꽉차 있으며, 각종 신선한 야채 과일등으로 양념하여 3번 달여부어 숙성과정을 거침으로 비린내와 잡내가 없어 누구나 명품게장의 맛을 즐길 수 있습니다.',34.890124,128.621112);



insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,901,'상상속의집','경상남도 거제시 일운면 거제대로 2752',3,'대마도와 지심도를 한눈에 바라보는 "거제도의 펜션형 관광호텔 상상속의 집"입니다.',34.847601,128.709712);

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,901,'블루마우리조트','경상남도 거제시 남부면 해금강로 132',3,'한려해상국립공원의 해금강 신선대에 위치해 있으며, 전객실 어디서나 바다조망이 가능한 리조트이다.
',34.739858,128.663481);

Commit;
Commit;
select * from tbl_tourinfo where t_idx = 365
order by t_idx
select * from tab;
select * from TBL_AREA_DETAIL


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,819,'선암사','전라남도 순천시 승주읍 죽학리 산802',1,'6·25전쟁으로 소실되어 지금은 20여 동의 당우(堂宇)만이 남아 있지만 그전에는 불각(佛閣) 9동, 요(寮) 25동, 누문(樓門) 31동으로 도합 65동의 대가람이었다. 특히 이 절은 선종(禪宗)·교종(敎宗) 양파의 대표적 가람으로 조계산을 사이에 두고 송광사(松廣寺)와 쌍벽을 이루었던 수련도량(修鍊道場)으로 유명하다. ',34.996044,127.330348);


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,819,'송광사','전라남도 순천시 송광면 송광사안길 100',1,'조계산 내 암자로는 광원암(廣遠庵)·천자암(天子庵)·감로암(甘露庵)·부도암(浮屠庵)·불일암(佛日庵)·판와암(板瓦庵)과 근래에 건립한 오도암(悟道庵) 및 탑전(塔殿:寂光殿) 등이 있고, 56개의 말사와 수련원·성보보수교습원 등의 부설기관이 있다',35.003575,127.275386);

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,819,'낙안읍성민속마을','전라남도 순천시 낙안면 충민길 30',1,'매년 정월 대보름에 장군 임경업의 비각에서 제를 올리고 널뛰기, 그네타기, 성곽돌기 등 민속행사가 열린다. 5월에는 낙안민속문화축제, 10월에 남도음식축제가 열린다. 주변에 조계산도립공원, 선암사, 송광사, 동화사, 제석산, 고인돌공원, 주암호 등의 관광지가 있다.',34.906437,127.341937);


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,819,'순천만습지','전라남도 순천시 순천만길 513-25',1,'전라남도 남해안 고흥반도와 여수반도 사이에 있는 만에 위치. 보성군·고흥군·여수시·순천시 등과 접해 있다. 소백산맥에서 갈라져 고흥반도와 여수반도로 뻗어내린 지맥이 침강하여 이루어진 만이다.',34.886181,127.509116);

select * from tbl_tourinfo  order by t_idx
insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,819,'순천드라마촬영장','전라남도 순천시 비례골길 24',1,'순천 드라마 세트장 순천 드라마 세트장의 명칭은 “순천 드라마 촬영장”으로 호남에서 가장 큰 규모의 세트장을 보유하고 있는 곳입니다. 순천 드라마 촬영장은 60년대의 순천 읍내 모습과, 70년대 서울 봉천동을 그대로 재현한 달동네, 그리고 80년대 서울 변두리를 고스란히 재현을 해두고 있습니다.대부분 드라마 촬영지는 외곽에 위치를 하고 있는 반면, 도심 한복판에 들어선 순천 드라마 촬영장으로 이색적인 느낌을 줍니다. ',34.957642,127.538355);
commit;

update tbl_tourinfo set t_type = 2 where t_idx = 374

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,819,'거차뻘배체험장','전라남도 순천시 별량면 거차길 130',1,'뻘체험입니다.',34.837669,127.447585);



insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,819,'내동마을','전라남도 순천시 낙안면 내동2길 1-1',1,'내동마을은 낙안읍성에서 2㎞ 정도 떨어진 한가로운 시골마을이다. 마을 앞으로 논과 비닐하우스가 드넓게 펼쳐져 더없이 평화로워 보인다. 비닐하우스에서는 주로 ‘낙안 오이’를 생산한다. 단일 재배 품목으로는 전국에서 가장 큰 규모라고 한다. 이외에도 낙안 배, 순천 단감, 한라봉, 키위, 무화과, 매실 등 고소득 작물을 주로 재배한다.',34.894576,127.355215);


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,819,'와온어촌체험마을','전라남도 순천시 해룡면 와온길 203',1,'와온마을은 겨울 일몰지로 전국적으로 유명합니다',34.841709,127.534552);


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,819,'순천만우리','전라남도 순천시 교량2길 11-1',1,'',34.908962,127.502945);


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,819,'상사호','전라남도 순천시 상사면 상사호길 555',1,'전라남도 순천시 상사면 소재의 인공호수로 길이 575m의 상사조절지댐이 준공되면서 조성되었다. 상사호는 유역면적이 135km²에 달하며, 순천시·광양시·여수시 등에 1일 생활용수 30만 1000t, 공업용수 23만 9000t을 공급한다. 모후산과 조계산 아래에 위치하고 있어 자연경관이 빼어나며, 인근에 주암호, 송광사, 낙안읍성 민속마을, 고인돌공원 등 여러 관광지가 위치하고 있다.',34.949309,127.414712);


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,819,'용산전망대','전라남도 순천시 순천만길 513-25',1,'갈대밭과 순천만 일대를 한눈에 내려다볼 수 있는 최고의 조망대입니다. 갈대밭 관광 중심지인 대대포구 건너편에 길게 뻗은 산줄기의 남쪽 끝 해발 80m 지점에 있지요. 대대포구에서 갈대밭 사이로 난 데크길을 1km 가서 다시 산길을 1km 정도 더 가야 하는데요, 데크 탐방로는 자전거가 진입할 수 없어 꼬박 걸어서 왕복해야 하지만 그 수고를 후회할 일은 없을 것입니다.',34.886004,127.509049);

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,819,'푸른꽃수목원','전라남도 순천시 서면 대구리 30-1',1,'아름다운 수목원입니다',35.032838,127.443382);

commit;

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,301,'해동용궁사','부산광역시 기장군 기장읍 용궁길 86',1,'고려시대 1376년(우왕 2)에 공민왕의 왕사였던 나옹(懶翁) 혜근(惠勤)이 창건하였다. 혜근이 경주 분황사(芬皇寺)에서 수도할 때 나라에 큰 가뭄이 들어 인심이 흉흉하였는데, 하루는 꿈에 용왕이 나타나 봉래산 끝자락에 절을 짓고 기도하면 가뭄이나 바람으로 근심하는 일이 없고 나라가 태평할 것이라고 하였다. 이에 이곳에 절을 짓고 산 이름을 봉래산, 절 이름을 보문사(普門寺)라 하였다. ',35.188308,129.223295);

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,301,'태종대','부산광역시 영도구 전망로 316',1,'1972년 6월 26일 부산기념물 제28호로 지정되었다가 2005년 11월 1일 국가 지정 문화재 명승 제17호로 지정되었다. 영도의 남동쪽 끝에 위치하는 해발고도 200m 이하의 구릉지역으로, 부산 일대에서 보기 드문 울창한 숲과 기암 괴석으로 된 해식절벽 및 푸른 바다 등이 조화를 이룬다. ',35.055494,129.090054);

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,301,'해운대해수욕장','부산광역시 해운대구 달맞이길62번길 47 ',1,'주변의 빼어난 자연경관과 어우러진 전국 제일의 해수욕장',35.158604,129.160443);

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,301,'광안리해수욕장','부산광역시 수영구 광안해변로 219',1,'사계절 내내 즐기는 도심 속 특급 휴양지',35.153056,129.118830);

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,301,'부산아쿠아리윰','부산광역시 해운대구 해운대해변로 266',1,'SEA LIFE 부산아쿠아리움은 누적 1,500만 이상의 방문객이 방문한 부산, 경남 지역의 관광명소입니다.',35.159444,129.160936);

insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,301,'범어사','부산광역시 금정구 범어사로 250',1,'현재 보물 제434호로 지정된 대웅전을 비롯하여 3층석탑(보물 250호), 당간지주(幢竿支柱), 일주문(一柱門), 석등(石燈), 동 ·서 3층석탑 등의 지방문화재가 있으며 이 밖에 많은 전각(殿閣) ·요사 ·암자(庵子) ·누(樓) ·문 등이 있다. 옛',35.283919,129.068371);


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,301,'용두산공원','부산광역시 중구 용두산길 37-55',1,'용두산(49m)은 부산시내에 있는 구릉으로서 부산 3명산의 하나이다. 옛날에는 울창한 소나무 사이로 바다가 보였다 하여 송현산(松峴山)이라 하였다가 그후 산세가 흡사 용 모양이어서 일본에서 건너오는 왜구들을 삼켜버릴 기상이라 하여 용두산이라고 부르게 되었다.',35.100592,129.032666);


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,301,'송정해수욕장','부산광역시 해운대구 송정동 712-2',1,'달맞이 길과 벚꽃단지의 아름다움을 간직한 해수욕장',35.179231,129.199159);


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,301,'허심청','부산광역시 동래구 금강공원로20번길 23',1,'허심청은 종래의 위락 시설과는 달리 편안하고 즐거운 온천욕과 휴식 및 체력단련을 통한 건강증진을 추구하는 새로운 유형의 도시형 온천건강랜드로 91년 10월 부산시 도심 재개발 사업으로 탄생하였으며 허심청의 온천탕은 전체 1,300여평으로 남,여 3,000명을 동시에 수용할 수 있는 동양 최대규모의 온천시설입니다.',35.219855,129.082006);


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,301,'오륙도','부산광역시 남구 용호동 936-941',1,'1972년 6월 26일 부산기념물 제22호로 지정되었다가 2007년 10월 1일에 국가지정문화재 명승(名勝) 제24호로 지정되었다. 면적 0.02㎢, 최고점 68m(굴섬)이다. 예로부터 부산의 상징물이었다. 영도구(影島區)의 조도(朝島)와 마주보며, 부산만 북쪽의 승두말로부터 남동쪽으로 6개의 바위섬이 나란히 뻗어 있다.',35.098106,129.123982);


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,301,'충렬사','부산광역시 동래구 충렬대로 347',1,'부산에서 갈만한 사철',35.199640,129.097065);


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,301,'비프광장','부산광역시 중구 비프광장로 36',1,'피프광장 주변에는 국제영화제의 주무대가 되는 개봉극장(대영시네마, 씨네시티, CGV남포)들이 밀집되어 있는데 이러한 모습은 아시아는 물론 유럽 어느 나라에서도 찾아볼 수 없는 시네마 천국으로 무한한 잠재력을 보이고 있는 곳입니다.',35.098579,129.028811);


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,301,'부평깡통시장','부산광역시 중구 중구로33번길 32',1,'부평깡통시장은 오랜 전통을 지니고 있는 시장으로 사거리시장이란 이름으로 시작하여 6.25이후에는 외국 구호물품과 외국물자들을 사고파는 특이한 장소이기도 하였으며, 외국물품을 판다하여 깡통시장으로 이름 붙여졌음.',35.101115,129.026142);


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,301,'국립해양박물관','부산광역시 영도구 해양로301번길 45',1,'국립해양박물관은 해양문화와 해양산업의 유산을 발굴․보존․연구 및 전시함으로써
해양문화의 진흥과 해양산업의 발전에 이바지하기 위한 해양공간입니다. 
국립해양박물관은 바다와 관련된 귀중한 국내외 유물과 자료를 전시하고 있으며, 
다양한 해양체험과 교육 프로그램을 마련하고 있습니다. 
여러분들이 국립해양박물관에서 바다의 힘과 가치를 이해하고
해양의 미래 비전을 그려볼 수 있기를 기대합니다. ',35.078897,129.079992);

commit;
insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,301,'','',1,'',,);


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,301,'','',1,'',,);


insert into tbl_tourinfo(t_idx,de_area_code,t_name,t_addr,t_type,t_detail,tx,ty) values
(SEQ_TIDX.nextval,301,'','',1,'',,);

select * from tbl_tourinfo order by t_idx

select * from tbl_member;
select * from tab
select * from TBL_SCHEDULE order by sc_idx
commit;
update TBL_SCHEDULE set sc_name= '일 그만두고 떠난다' where sc_idx = 16
update TBL_SCHEDULE set sc_name='강원도 힐링 여행' where sc_idx = 14
update TBL_SCHEDULE set sc_tag ='#백수' where sc_idx = 16
update TBL_SCHEDULE set sc_viewcount = 11 where sc_idx = 16
update TBL_SCHEDULE set sc_likecount = 3 where sc_idx = 16


Select * from tbl_board;
select count(*) from tbl_board;



select seq, userid, subject, readCount, regDate
     	     , commentCount, groupno, fk_seq, depthno
     	     , fileName, orgFileName, fileSize
		from
		(
		  select rownum as RNO, seq, userid, subject, readCount 
		       , to_char(regDate, 'yyyy-mm-dd hh24:mi:ss') as regDate
		       , commentCount, groupno, fk_seq, depthno
		       , fileName, orgFileName, fileSize
		  from tbl_board
    
		  order  by groupno desc, seq asc
		) V
		
    
select s.sc_idx, sc_name, to_char(sc_start_date,'yyyy-mm-dd') as sc_start_date,
to_char(sc_end_date,'yyyy-mm-dd') as sc_end_date, sc_days, sc_tag, sc_likecount, sc_viewcount
		from tbl_schedule s
		join tbl_join j
		on s.sc_idx = j.sc_idx
		where userid = 'cde0701'
    and 
    sc_name like '%여%'
		order by sc_idx desc    
    
    select * from tbl_join
    
    
  ----------------
  
  
select * from tbl_tourinfo
where t_name like '%63스퀘어%' or t_name like '청계산장수촌';

update tbl_tourinfo set t_detail = '롯데시티호텔마포는 기존의 비즈니스호텔과 차별화 된 고급스런 인테리어와 30년 전통의 롯데호텔의 노하우가 결합된 국내 최고의 비즈니스호텔을 표방합니다.'
where t_idx = 120;

commit;

--------------5일 에러잡음
select * from tbl_siteInchk order by indate

insert into tbl_siteInchk values(default, sysdate)

delete from tbl_siteInchk where to_char(indate,'yyyy-mm-dd') = to_char(sysdate,'yyyy-mm-dd')

commit

select cnt 
       from tbl_siteInchk
       where to_char(indate,'yyyy-mm-dd') = to_char(sysdate,'yyyy-mm-dd')

select * from tbl_schedule
      where sc_name like '%여행%' or sc_tag like '%#여행%'

--------------5일 에러잡음

desc tbl_tourinfo

select * from tbl_area_detail

select area_code, de_area_code, de_area_name, x, y
        from tbl_area_detail
      where de_area_name like '%' || '서울' || '%'

select V.t_idx, V.t_name, V.t_addr, V.t_type, V.t_rating, V.t_start_date
            , V.t_end_date, V.t_image1, V.t_image2, V.t_detail
            , V.tx, V.ty
      from
      (
      select A.de_area_name as de_area_name , T.t_idx as t_idx
           , T.t_name as t_name, T.t_addr as t_addr, T.t_type as t_type
           , T.t_rating as t_rating, T.t_start_date as t_start_date
           , T.t_end_date as t_end_date, T.t_image1 as t_image1
           , T.t_image2 as t_image2, T.t_detail as t_detail
           , T.tx as tx, T.ty as ty
      from tbl_area_detail A join tbl_tourinfo T
      on T.de_area_code = A.de_area_code
      )V
where V.de_area_name like '%'||'남원'||'%';

update tbl_area_detail set x='35.4137949', y='127.3569946'
where de_area_name ='전라도 남원시';
commit

select *  from tbl_tourinfo

update tbl_tourinfo set tx=37.565876, ty=126.964786
where t_name='한정식연'


update tbl_tourinfo set tx=37.442914, ty=127.057465
where t_name='청계산장수촌'

commit

insert into tbl_tourinfo values(SEQ_TIDX.nextval, 811, '스위트호텔남원', '전라북도 남원시 주천면 원천로217', 3, 0, sysdate, sysdate, null, null, null, 35.408071, 127.414582)

insert into tbl_tourinfo values(SEQ_TIDX.nextval, 811, '마음호텔', '전라북도 남원시 소리길 124(신촌동)', 3, 0, sysdate, sysdate, null, null, null, 35.406595, 127.389978)

insert into tbl_tourinfo values(SEQ_TIDX.nextval, 811, '지리산칸호텔', '전라북도 남원시 산내면 지리산로 815', 3, 0, sysdate, sysdate, null, null, null, 35.374996, 127.580138)

-------------------------------
insert into tbl_tourinfo values(SEQ_TIDX.nextval, 811, '춘향가호텔', '전라북도 남원시 양림길 28-14(어현동)', 3, 0, sysdate, sysdate, null, null, null, 35.403109, 127.387878)

insert into tbl_tourinfo values(SEQ_TIDX.nextval, 811, '해태장여관', '전라북도 남원시 옥정1길 134', 3, 0, sysdate, sysdate, null, null, null, 35.417930, 127.388504)


select * from tbl_tourinfo
where t_idx=96


select * from seq

desc tbl_tourinfo

select * from tbl_area_detail

update tbl_area_detail set x=33.382213, y=126.542869
where de_area_name='제주특별자치도'

update tbl_area_detail set x=37.456837, y=126.699747
where de_area_name='인천광역시'

commit
--------제주동ㅇㅅㅇ--------
insert into tbl_tourinfo values(SEQ_TIDX.nextval, 401, '용머리해안', '제주특별자치도 서귀포시 안덕면 산방로', 1, 0, sysdate, sysdate, null, null, null, 33.231847, 126.314641)

insert into tbl_tourinfo values(SEQ_TIDX.nextval, 401, '만장굴', '제주특별자치도 제주시 구좌읍 김녕길', 1, 0, sysdate, sysdate, null, null, '세계적인 규모의 화산 용암의 침하운동으로 생성된 천연동굴. 유네스코 지정 세계문화유산으로 등록되어 있습니다.', 33.528477, 126.771470)

insert into tbl_tourinfo values(SEQ_TIDX.nextval, 401, '한라산', '제주특별자치도 제주시 1100로 2070-61', 1, 0, sysdate, sysdate, null, null, null, 33.362168, 126.529081)

insert into tbl_tourinfo values(SEQ_TIDX.nextval, 401, '천지연폭포', '제주특별자치도 서귀포시 서홍동 남성중로', 1, 0, sysdate, sysdate, null, null, null, 33.246954, 126.554409)

--
insert into tbl_tourinfo values(SEQ_TIDX.nextval, 401, '삼성혈', '제주특별자치도 제주시 삼성로 22', 1, 0, sysdate, sysdate, null, null, '탐라국의 시조인 삼신인 三乙那(삼을나)왕이 湧出(용출)하여 제주를 개황한 한반도에서 가장 오랜 현존 유적입니다.', 33.504272, 126.529188);

insert into tbl_tourinfo values(SEQ_TIDX.nextval, 401, '제주김녕미로공원', '제주특별자치도 제주시 구좌읍 김녕리 만장굴길 122', 1, 0, sysdate, sysdate, null, null, null, 33.535921, 126.772152);

insert into tbl_tourinfo values(SEQ_TIDX.nextval, 401, '성산일출봉', '제주특별자치도 서귀포시 성산읍 일출로 284-12', 1, 0, sysdate, sysdate, null, null, 'UNESCO 세계지질공원으로 등록되어 있습니다.', 33.458342, 126.942457);

insert into tbl_tourinfo values(SEQ_TIDX.nextval, 401, '주상절리', '제주특별자치도 서귀포시 중문동 2767', 1, 0, sysdate, sysdate, null, null, '깎아지르는 듯한 절벽의 아름다움과 제주의 바다를 동시에 볼 수 있는 곳 입니다.', 33.237719, 126.425056);

insert into tbl_tourinfo values(SEQ_TIDX.nextval, 401, '신양 섭지코지 해변', '제주특별자치도 서귀포시 성산읍 섭지코지로', 1, 0, sysdate, sysdate, null, null, null, 33.423540, 126.929313);

insert into tbl_tourinfo values(SEQ_TIDX.nextval, 401, '외돌개', '제주특별자치도 서귀포시 남성중로 (서귀동)', 1, 0, sysdate, sysdate, null, null, null, 33.239054, 126.544592);

insert into tbl_tourinfo values(SEQ_TIDX.nextval, 401, '정방폭포', '제주특별자치도 서귀포시 칠십리로214번길 36', 1, 0, sysdate, sysdate, null, null, '제주도의 3대 폭포 중의 하나로서 국내에서 유일하게 물이 바다로 직접 떨어지는 폭포입니다.', 33.244870, 126.571803);

insert into tbl_tourinfo values(SEQ_TIDX.nextval, 401, '여미지식물원', '제주특별자치도 서귀포시 중문관광로 93', 1, 0, sysdate, sysdate, null, null, '09:00 ~ 18:00 (옥외정원은 일몰시까지 관람 가능) 단, 입장권은 폐장 30분전까지만 판매', 33.252670, 126.414636);


commit

--
insert into tbl_tourinfo values(SEQ_TIDX.nextval, 401, '게스트하우스 도치', '제주특별자치도 서귀포시 남원읍 태위로151번길 17', 3, 0, sysdate, sysdate, null, null, '체크인 PM 5:00~10:00 / 체크아웃 AM 10:00', 33.276751, 126.664190);

insert into tbl_tourinfo values(SEQ_TIDX.nextval, 401, '나날 게스트하우스', '제주특별자치도 서귀포시 남성중로 121번길 14 (서홍동)', 3, 0, sysdate, sysdate, null, null, '입실 : 오후 5시 ~ 오후 10시 / 퇴실 : 오전 10시', 33.242638, 126.555424);

insert into tbl_tourinfo values(SEQ_TIDX.nextval, 401, '이랜드파크 켄싱턴리조트 제주', '제주특별자치도 제주시 한림읍 한림해안로 530', 3, 0, sysdate, sysdate, null, null, '입실: 당일 오후 2시~(성수기 3시~) / 퇴실: 당일 정오 ~12시(성수기 ~11시)', 33.252789, 126.408836);

insert into tbl_tourinfo values(SEQ_TIDX.nextval, 401, '서귀포KAL호텔', '제주특별자치도 서귀포시 칠십리로 242번지', 3, 0, sysdate, sysdate, null, null, '입실 : 14시 / 퇴실 : 12시', 33.246497, 126.581801);

insert into tbl_tourinfo values(SEQ_TIDX.nextval, 401, '산방산해오름휴양펜션', '제주특별자치도 서귀포시 안덕면 사계로114번길', 3, 0, sysdate, sysdate, null, null, '입실 : 오후 2시 / 퇴실 : 오전11시', 33.236757, 126.308140);

insert into tbl_tourinfo values(SEQ_TIDX.nextval, 401, '에코힐글램핑', '광령리 926', 3, 0, sysdate, sysdate, null, null, '입실 15:00 이후 퇴실 11:00', 33.449685, 126.440737);

insert into tbl_tourinfo values(SEQ_TIDX.nextval, 401, '김녕한옥 용암정원', '김녕로 19길 42-6', 3, 0, sysdate, sysdate, null, null, '입실 16:00 / 퇴실 11:00', 33.557077, 126.751422);

insert into tbl_tourinfo values(SEQ_TIDX.nextval, 401, '서귀포오소록민박', '제주특별자치도 서귀포시 동홍북로 51번길24', 3, 0, sysdate, sysdate, null, null, '입실 : 16시 / 퇴실 :10시', 33.260460, 126.575445);


commit

select * from tbl_member

select * from tbl_area_detail

select * from tbl_tourinfo where t_idx=114

select * from tab

select * from tbl_tourinfo where t_idx=222

select * from tbl_tourinfo_type

desc tbl_tourinfo

-- 인천
insert into tbl_tourinfo values(SEQ_TIDX.nextval, 201, '월미 놀이공원', '인천광역시 중구 북성동1가', 4, 0, sysdate, sysdate, null, null, '전국에서 가장 짜릿하고, 아찔한 놀이기구로 유명한 월미 놀이공원은 그 이름만으로도 수많은 놀이공원 매니아들을 매료 시키는 곳이다. 특히, 엄청난 높이를 자랑하는 바이킹과 재치있는 멘트로 유명한 DJ가 운행하는 아폴로 디스코는 놓치지 말아야 할 즐거움이다. 월미도 놀이공원은 문화의 거리 뒤쪽에 위치하고 있다.', 37.471496, 126.596252, 0);

insert into tbl_tourinfo values(SEQ_TIDX.nextval, 201, '인천시립박물관', '인천광역시 연수구 옥련동 525', 4, 0, sysdate, sysdate, null, null, '드라마 [별에서 온 그대] 촬영지이다.', 37.420566, 126.653394, 0);

insert into tbl_tourinfo values(SEQ_TIDX.nextval, 201, '송도센트럴파크', '인천광역시 연수구 송도동 24-5번지', 1, 0, sysdate, sysdate, null, null, '연중무휴', 37.392642, 126.638747, 0);

insert into tbl_tourinfo values(SEQ_TIDX.nextval, 201, '본토,만다복', '인천광역시 중구 차이나타운로59번길 25 (선린동)', 2, 0, sysdate, sysdate, null, null, '안녕하세요! 본토,만다복입니다. 추천메뉴 백년짜장, 탕수육, 칠리새우', 37.476095, 126.619296, 0);

insert into tbl_tourinfo values(SEQ_TIDX.nextval, 201, '강화역사박물관', '인천광역시 강화군 하점면 부근리 350-4', 4, 0, sysdate, sysdate, null, null, '세계문화유산으로 지정된 사적 137호 강화 고인돌 공원 내에 위치한 강화역사박물관은 오천년 역사와 문화를 자랑하는 강화 문화유산을 보존 · 활용하기 위한 조사연구 및 전시교육 활동을 통해 함께하고 있습니다.', 37.774292, 126.435300, 0);


select * from tbl_area_detail where de_area_name like '%전주%'

-- 용인
insert into tbl_tourinfo values(SEQ_TIDX.nextval, 524, '에버랜드', '경기도 용인시 처인구 포곡읍 에버랜드로 199 삼성에버랜드', 1, 0, sysdate, sysdate, null, null, '국내 최초, 최대의 테마파크 에버랜드는 1년 내내 축제가 끊이지 않는 환상의 나라입니다.', 37.293919, 127.202556, 0);

insert into tbl_tourinfo values(SEQ_TIDX.nextval, 524, '한국민속촌', '경기도 용인시 기흥구 민속촌로 90', 1, 0, sysdate, sysdate, null, null, '한국민속촌은 사라져가는 우리 조상의 슬기와 지혜가 스며있는 전통생활모습을 총체적으로 재현한 야외민속박물관으로 국제적인 관광지입니다.기성세대들은 아늑한 고향의 정감과 향수를 느낄 수 있고, 자라나는 어린이와 청소년들은 우리 조상의 지혜와 슬기를 체험할 수 있으며, 외국 관광객들은 한국의 전통문화를 보고 느낄 수 있습니다.', 37.259882, 127.120794, 0);

insert into tbl_tourinfo values(SEQ_TIDX.nextval, 524, '죽전일식 민수사', '경기도 용인시 기흥구 포은대로 512번길41 (보정동 SJ빌딩 가동 1층)', 2, 0, sysdate, sysdate, null, null, '죽전일식 민수사는 입소문이 자자하여 유명인들과 미식가들의 발길이 끊이지 않는 곳이다.', 37.321423, 127.105684, 0);

commit

select * from tbl_schedule

update tbl_tourinfo set de_area_code = 831 where t_name = '경기전'

-- 전주
insert into tbl_tourinfo
values(SEQ_TIDX.nextval, 831, '전동성당', '전라북도 전주시 완산구 전동 200-1', 1, 0, sysdate, sysdate, null, null, '사적 제 288호', 35.813289, 127.149240, 0);

insert into tbl_tourinfo values(SEQ_TIDX.nextval, 831, '경기전', '전라북도 전주시 완산구 풍남동3가 102', 1, 0, sysdate, sysdate, null, null, '조선태조의 어진이 봉안되어 있는 경기전 정전 (朝鮮太祖御眞).', 35.815231, 127.149830, 0);

insert into tbl_tourinfo values(SEQ_TIDX.nextval, 831, '현대옥 한옥마을점', '전라북도 전주시 완산구 오목대길 66', 2, 0, sysdate, sysdate, null, null, '전주콩나물국밥, 얼큰돼지국밥, 전주비빔밥, 황태콩나물국밥, 현대옥스테이크, 목우촌바베큐삼겹, 오징어튀김', 35.813055, 127.152610, 0);

select * from tbl_area_detail where de_area_name like '%경주%'

-- 경주(904)

select * from tab

desc VIEW_TOTAL_AGE





----------------------------------------------------------------------------------------------



-- tbl_area
insert into tbl_area
values(1, '서울특별시')

insert into tbl_area
values(2, '인천광역시')

insert into tbl_area
values(3, '부산광역시')

insert into tbl_area
values(4, '제주특별자치도')

select * from tbl_area

alter table tbl_area
modify( area_name varchar2(30));

insert into tbl_area
values(5, '경기도')

insert into tbl_area
values(6, '강원도')

insert into tbl_area
values(7, '충청도')

insert into tbl_area
values(8, '전라도')

insert into tbl_area
values(9, '경상도')

commit

rollback

delete from tbl_area 

-- tbl_member

create sequence seq_memberidx;

select * from tbl_member

commit

insert into tbl_member
values('ghkim1121', seq_memberidx.nextval, 'qwer1234!', '가현', to_date('1993-11-21', 'yyyy-mm-dd'), '여', 'ghkim1121@naver.com', '010-2250-1771', '1');


insert into tbl_member
values('cde0701', seq_memberidx.nextval, 'qwer1234!', '대은', to_date('1991-07-01', 'yyyy-mm-dd'), '여', 'cde0701@gmail.com', '010-6668-1343', '1');


insert into tbl_member
values('sjhan', seq_memberidx.nextval, 'qwer1234!', '주한', to_date('1990-12-31', 'yyyy-mm-dd'), '남', 'wngks2@naver.com', '010-3034-7939', '1');


insert into tbl_member
values('kdkyu', seq_memberidx.nextval, 'qwer1234!', '동규', to_date('1991-08-22', 'yyyy-mm-dd'), '남', 'kdkyu@naver.com', '010-1111-4837', '1');


insert into tbl_member
values('kyjoo', seq_memberidx.nextval, 'qwer1234!', '영주', to_date('1993-12-31', 'yyyy-mm-dd'), '남', 'kyjoo@naver.com', '010-3535-0000', '1');



