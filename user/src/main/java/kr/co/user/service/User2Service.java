package kr.co.user.service;

import kr.co.user.dto.User2DTO;
import kr.co.user.mapper.User2Mapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class User2Service {
    private final User2Mapper mapper;

    public User2Service(User2Mapper mapper) {
        this.mapper = mapper;
    }

    public void insertUser2(User2DTO user2DTO) {
        mapper.insertUser2(user2DTO);
    }

    public User2DTO selectUser2(String id) {
        return mapper.selectUser2(id);
    }

    public List<User2DTO> selectUser2s() {
        return mapper.selectUser2s();
    }

    public void updateUser2(User2DTO user2DTO) {
        mapper.updateUser2(user2DTO);
    }

    public void deleteUser2(String id) {
        mapper.deleteUser2(id);
    }
}
