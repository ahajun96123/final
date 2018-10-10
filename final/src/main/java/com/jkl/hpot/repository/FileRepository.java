package com.jkl.hpot.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jkl.hpot.entity.UploadFile;

public interface FileRepository extends JpaRepository<UploadFile, Integer> {
    public UploadFile findOneByFileName(String fileName);
}