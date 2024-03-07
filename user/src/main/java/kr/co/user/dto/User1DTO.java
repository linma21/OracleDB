package kr.co.user.dto;

public class User1DTO {

    private String id;
    private String name;
    private String hp;
    private int age;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getHp() {
        return hp;
    }

    public void setHp(String hp) {
        this.hp = hp;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    @Override
    public String toString() {
        return "User1DTO{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", hp='" + hp + '\'' +
                ", age=" + age +
                '}';
    }
}
