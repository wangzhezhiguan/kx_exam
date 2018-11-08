package com.kx.exam.service;

import java.util.List;

import com.kx.exam.model.Strategy;

public interface StrategyService {
	public List<Strategy> queryType(Strategy strategy);

	public List<Strategy> queryStrategy(Strategy strategy);
}
