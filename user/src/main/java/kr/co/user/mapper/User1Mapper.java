package kr.co.user.mapper;

import kr.co.user.dto.User1DTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
public interface User1Mapper {
    public void insertUser1(User1DTO user1DTO);
    public User1DTO selectUser1(String id);
    public List<User1DTO> selectUser1s();
    public void updateUser1(User1DTO user1DTO);
    public void deleteUser1(String id);
}
