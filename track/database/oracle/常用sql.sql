一、常用sql
    查询：
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

二、问题
    1、解决字段不能更改类型的问题
        -- 解决字段不能更改类型的问题
        alter table EPOLICY_ITEMS rename column ID to ID_TEMP;
        alter  table   EPOLICY_ITEMS   add( ID  varchar2(50)); 
        
        update EPOLICY_ITEMS set ID=ID_TEMP;  

        ALTER TABLE EPOLICY_ITEMS DROP COLUMN ID_TEMP  CASCADE  CONSTRAINTS

        ALTER TABLE EPOLICY_ITEMS ADD CHECK (ID IS NOT NULL);
        ALTER TABLE EPOLICY_ITEMS ADD PRIMARY KEY (ID);
