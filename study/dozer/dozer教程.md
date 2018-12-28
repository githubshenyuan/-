#### 一、什么是dozer
>&#160; &#160; &#160; Dozer 是一个对象转换工具。Dozer可以在JavaBean到JavaBean之间进行递归数据复制,并且这些JavaBean可以是不同的复杂的类型
#### 二、为什么要使用Dozer
>&#160; &#160; &#160; 在实际的项目系统中，我们经常存在JavaBean直接的拷贝。比如我们在DAO层，通过Do取得业务层需要的数据，将这些数据传递给 Service层的VO。Do与VO就存在典型的值拷贝。
>
>&#160; &#160; &#160; 典型的解决方案就是手动拷贝，弊端很明显，代码中充斥大量Set 和Get方法，真正的业务被埋藏值与值的拷贝之中。另一种方案就是使用BeanUtil，但BeanUtil不够很好的灵活性，又时候还不得不手动拷贝。Dozer可以灵活的对对象进行转换，且使用简单。
####  三、如何使用dozer
##### 1、springboot 集成 dozer 的maven依赖
```xml
<!-- 对象映射框架 依赖包-->
<dependency>
    <groupId>com.github.dozermapper</groupId>
    <artifactId>dozer-spring-boot-starter</artifactId>
    <version>6.4.1</version>
</dependency>
```
##### 2、springboot 的注入依赖

```java
@Resource
private Mapper mapper;
```
##### 3、dozer 的简单使用
下面是原拷贝对象
```java
public class SrcUserEntity {
    private String uuid;
    private String userName;    // 用户名
    private String realName;    // 真实姓名
    private String password;    // 密码
    private String sex;         // 性别

    set()
    get()
    ......
}

```
目标拷贝对象
```java
public class TarUserEntity {
    private String userName;    // 用户名
    private String realName;    // 真实姓名
    private String sex;         // 性别
    private String email;       // 邮箱
    set()
    get()
    ......
}

```
直接拷贝
```java
    SrcUserEntity srcUserEntity = new SrcUserEntity(); 
    srcUserEntity.set()..... // 省略set值
    TarUserEntity tarUserEntity = new TarUserEntity();
    mapper.map(srcUserEntity,tarUserEntity); 
```
#### 四、深入使用dozer
&#160; &#160; &#160;当原对象和目标对象属性名和类型一致时，直接转换即可，但是如果出现名称不一致，或者名称一致但是只需要转换部分字段时。如何处理？
##### 1、xml配置基本属性映射
原拷贝对象
```java
public class SrcUserEntity {
    private String uuid;
    private String srcUserName;     // 用户名
    private String srcRealName;     // 真实姓名
    private String srcPassword;     // 密码
    private String srcSex;          // 性别

    set()
    get()
    ......
}
```
目标拷贝对象
```java
public class TarUserEntity {
    private String tarUserName;     // 用户名
    private String tarRealName;     // 真实姓名
    private Integer tarSex;          // 性别
    private String tarEmail;        // 邮箱
    set()
    get()
    ......
}

```
新建配置文件
```
resource    
└───mappers
│   │   test-mapper.xml  //这里新建配置文件
│   application.properties
```
spring boot 设置引入配置文件
```yml
# 在 application.yml 中填写
dozer:
    mapping-files: classpath:mappers/**/*-mapper.xml
```
编写 test-mapper.xml 配置原对象和目标对象 的属性对应关系
```xml
<?xml version="1.0" encoding="UTF-8"?>

<mappings xmlns="http://dozermapper.github.io/schema/bean-mapping"
          xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
          xsi:schemaLocation="http://dozermapper.github.io/schema/bean-mapping http://dozermapper.github.io/schema/bean-mapping.xsd">

    <!-- 原对象SrcUserEntity 和 目标对象 TarUserEntity 属性对应关系  -->
    <mapping map-id="src-tar">
        <class-a>com.sinosoft.entity.SrcUserEntity</class-a>
        <class-b>com.sinosoft.entity.TarUserEntity</class-b>
        <!-- 用户名映射 -->
        <field>
            <a>srcUserName</a>
            <b>tarUserName</b>
        </field>
        <field>
            <a>srcRealName</a>
            <b>tarRealName</b>
        </field>
        <field>
            <a>srcSex</a>
            <b>tarSex</b>
        </field>
    </mapping>
```
