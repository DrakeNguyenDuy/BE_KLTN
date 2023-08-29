package com.salesmanager.recommender.main;

import java.util.List;

import org.lenskit.LenskitConfiguration;
import org.lenskit.LenskitRecommender;
import org.lenskit.api.ItemRecommender;
import org.lenskit.api.ItemScorer;
import org.lenskit.api.Recommender;
import org.lenskit.data.dao.EventDAO;
import org.lenskit.data.dao.ItemDAO;
import org.lenskit.data.dao.UserDAO;

import com.salesmanager.recommender.dao.ItemDao;
import com.salesmanager.recommender.dao.ItemDaoForAlumnus;
import com.salesmanager.recommender.dao.RatingDAO;
import com.salesmanager.recommender.dao.UserDao;
import com.salesmanager.recommender.dao.UserDaoForAlmnus;

public class MainForAlumnus {

	public static List<Long> rs(Long id) {
		LenskitConfiguration config = configureRecommender();
		System.out.println("Starting build recommnder");
		Recommender rec = LenskitRecommender.build(config);
		ItemRecommender irec = rec.getItemRecommender();
		System.out.println("searching for recommendations for job " + id);
		List<Long> recs = irec.recommend(id, 5);
		return recs;
	}

	private static LenskitConfiguration configureRecommender() {
		LenskitConfiguration config = new LenskitConfiguration();
		// use the TF-IDF scorer you will implement to score items
		config.bind(ItemScorer.class).to(TFIDFItemScorerForAlmnus.class);
		// configure the rating data source
		config.bind(EventDAO.class).to(RatingDAO.class);
		// use custom item and user DAOs
		// specify item DAO implementation with features includes: skills, address,..

		config.bind(ItemDAO.class).to(ItemDaoForAlumnus.class);
		// our user DAO can look up by user name
		config.bind(UserDAO.class).to(UserDaoForAlmnus.class);
		return config;
	}
}
