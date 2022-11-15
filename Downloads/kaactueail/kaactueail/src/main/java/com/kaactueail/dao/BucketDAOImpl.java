package com.kaactueail.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kaactueail.dto.BucketDTO;
import com.kaactueail.mappers.bucketlistMapper;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class BucketDAOImpl implements BucketDAO {
	
	@Autowired
	private bucketlistMapper mapper;

	@Override
	public List<BucketDTO> getBucketList(int bucketlistMemberNum) {
		return mapper.getBucketList(bucketlistMemberNum);
	}

	@Override
	public int modifyCount(BucketDTO bucket) {
		return mapper.modifyAmount(bucket);
	}

	@Override
	public int deleteBucket(int bucketlistNum) {
		return mapper.deleteBucket(bucketlistNum);
	}

}