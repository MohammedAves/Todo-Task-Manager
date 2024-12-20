package com.example.todoManager.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.todoManager.model.ToDo;

@Repository
public interface ToDoRepo extends JpaRepository<ToDo, Long>{

}
