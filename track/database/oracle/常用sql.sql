一、常用sql
    查询：
        系统查询：
        查询表中 第一条数据
            SELECT * from GOODS where rownum=1  ORDER BY GOODS_ID DESC

    插入：

    删除：
    更新：
        -- 更新字段名  
        alter table TABLE_NAME rename column column_old to column_new;
        -- 添加字段    
        alter table TABLE_NAME add COLUMN_NAME varchar(10);
        -- 删除字段    
        alter table TABLE_NAME drop column COLUMN_NAME;
        -- 添加字段并附值  
        alter table TABLE_NAME ADD COLUMN_NAME NUMBER(1) DEFAULT 1;
        -- 修改字段值  
        update TABLE_NAME set filedname=value where filedname=value;
        -- 修改字段数据类型    
        alter table tablename modify filedname varchar2(20);
        -- 添加非空约束
        ALTER TABLE EPOLICY_ITEMS ADD CHECK ("ID" IS NOT NULL);
        -- 添加主键
        ALTER TABLE EPOLICY_ITEMS ADD PRIMARY KEY (ID);
        -- 删除i段 并删除主键
        ALTER TABLE EPOLICY_ITEMS DROP COLUMN ID_TEMP  CASCADE  CONSTRAINTS
    创建表
        CREATE TABLE user_test (
			user_id NUMBER NULL ,
            pass VARCHAR2(255) NULL ,
            user_name VARCHAR2(255) NULL 
        )

二、问题
    1、解决字段不能更改类型的问题
    -- 解决字段不能更改类型的问题
        -- 更改的字段名
        alter table EPOLICY_ITEMS rename column ID to ID_TEMP;
        -- 添加新的字段名
        alter  table   EPOLICY_ITEMS   add( ID  varchar2(50)) ; 
        -- 添加注释
        comment  on  column  表名.字段名   is  '注释内容';
        -- 更新数据
        update EPOLICY_ITEMS set ID=ID_TEMP;  
        -- 删除字段
        ALTER TABLE EPOLICY_ITEMS DROP COLUMN ID_TEMP  CASCADE  CONSTRAINTS
        -- 添加非空
        --ALTER TABLE EPOLICY_ITEMS ADD CHECK (ID IS NOT NULL);
        alter table EPOLICY_ITEMS modify ID not null;
        -- 添加主键
        ALTER TABLE EPOLICY_ITEMS ADD PRIMARY KEY (ID);

        -- 添加联合主键
        ALTER TABLE "表名" ADD CONSTRAINTS '填写约束名' PRIMARY KEY ("列名","列名",...);
        ALTER TABLE 表名 ADD PRIMARY KEY ("列名", "列名")
        ALTER TABLE EPOLICY_ITEMS ADD CONSTRAINTS '约束名' PRIMARY KEY (ID,ID_TEMP);
        
        -- 删除主键
        ALTER TABLE "DS_BASE"."USER_TEST" DROP PRIMARY KEY
        -- 删除指定名称联合主键
        ALTER TABLE USER_TEST DROP CONSTRAINT "SYS_C0090698" 
        -- 设置指定名称联合主键
        ALTER TABLE "DS_BASE"."USER_TEST" ADD CONSTRAINT "SYS_C0090698" PRIMARY KEY ("USER_ID")
