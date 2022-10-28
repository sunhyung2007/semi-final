package com.example.spring.myapp.repository;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.spring.myapp.model.Member;

@Repository
public interface MemberRepository extends CrudRepository<Member, Long> {
	 // Jpa Naming 전략 
    // SELECT * FROM member WHERE id = ?
    // Insert into member ( password, username, createdate, email, role) values ( '$2a$10$C4BZPH4raAlKGrvy9dtyyufBp56af2W6fge0hD1wLctWvNEjrK.AG', '홍길동', now(), 'hermeswing@test.com', 'ROLE_ADMIN')
    // id:1, pw:1234
    Member findMember(long id);
}
