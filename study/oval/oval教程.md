#### 一、什么是oval
>&#160; &#160; &#160; oval 是一个参数校验工具。
#### 二、为什么要使用oval
>&#160; &#160; &#160; 当用户在前端提交表单信息或直接调用后端接口，为了防止恶意操作，保持程序的健壮性，后端需要对数据进行校验。那么最简单的做法是在业务代码中进行判断，如果成功在向下执行。但这样会带来代码的耦合、冗余等问题。
>
#### 三、如何使用oval
##### maven 引入 oval 依赖
```xml
<!-- 字段校验框架 依赖包-->
<dependency>
    <groupId>net.sf.oval</groupId>
    <artifactId>oval</artifactId>
    <version>1.90</version>
</dependency>
```
##### oval的简单使用
1、准备被校验对象
```java
public class UserEntity {
    private String uuid;
    @NotNull(errorCode = "1001",message = "用户名不能为空")
    @MaxLength(value = 32,errorCode = "1002",message = "最大长度为32")
    private String userName;    // 用户名
    private String realName;    // 真实姓名
    private String password;    // 密码
    @MemberOf(value = {"男","女"},errorCode = "1003",message = "性别不正确")
    private String sex;         // 性别

    set()
    get()
    ......
}
```
2、执行校验
```java
UserEntity userEntity = new UserEntity;
userEntity.set()....        //这里省略
Validator validator = new Validator();
List<ConstraintViolation> constraintViolations = validator.validate(userEntity);
//constraintViolations 存放的是校验不通过字段的信息
```