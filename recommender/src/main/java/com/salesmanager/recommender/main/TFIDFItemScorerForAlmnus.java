package com.salesmanager.recommender.main;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.grouplens.lenskit.vectors.MutableSparseVector;
import org.grouplens.lenskit.vectors.SparseVector;
import org.grouplens.lenskit.vectors.VectorEntry;
import org.grouplens.lenskit.vectors.similarity.CosineVectorSimilarity;
import org.lenskit.api.ResultMap;
import org.lenskit.basic.AbstractItemScorer;
import org.lenskit.data.dao.PrefetchingUserEventDAO;
import org.lenskit.data.dao.UserEventDAO;
import org.lenskit.data.ratings.Rating;
import org.lenskit.results.BasicResult;
import org.lenskit.results.BasicResultMap;

import com.salesmanager.recommender.dao.UserDao;
import com.salesmanager.recommender.dao.UserDaoForAlmnus;
import com.salesmanager.utils.ScoreUtils;

public class TFIDFItemScorerForAlmnus extends AbstractItemScorer {
	private UserEventDAO dao;
	private TFIDFModelForAlmunus model;
	private UserDaoForAlmnus userDao;

	@Inject
	public TFIDFItemScorerForAlmnus(PrefetchingUserEventDAO dao, TFIDFModelForAlmunus model, UserDaoForAlmnus userDao) {
		super();
		this.dao = dao;
		this.model = model;
		this.userDao = userDao;
	}

//	@Override
	public ResultMap scoreWithDetails(long user, Collection<Long> items) {
		List<BasicResult> list = new ArrayList<BasicResult>();
		SparseVector userVector = makeUserVector(user);
		System.out.println("vetoruser");
		System.out.println(userVector);
		System.out.println();
		CosineVectorSimilarity cvs = new CosineVectorSimilarity();
		for (Long idItem : items) {
			SparseVector vectorItem = model.getVectorItem(idItem);
			double similar = cvs.similarity(userVector, vectorItem);
			list.add(new BasicResult(idItem, similar));
		}

		return new BasicResultMap(list);
	}

	private SparseVector makeUserVector(long user) {
		return createVectorUserFromFeatures(user);
	}

	private SparseVector createVectorUserFromFeatures(long idUser) {
		List<String> featureUser = userDao.getFeatureUser(idUser);
		MutableSparseVector userVector = model.createVectorFeatures();
		userVector.fill(0.0);
		Map<String, Long> idToFeatureMap = model.createMapIDFeaure();
		for (int i = 0; i < featureUser.size(); i++) {
			String nameFeature = featureUser.get(i);
			Long idFeature = idToFeatureMap.get(nameFeature);
			if (idFeature != null) {// feature item and user can not match beacause async
				userVector.set(idFeature, 1);
			}
		}
		int numOfFeatureUserSpec=featureUser.size();
		long index = 1;
		for (VectorEntry ve : userVector) {
			double tf = ve.getValue() / numOfFeatureUserSpec;
			double df = model.weightDF(ve.getKey());
			double tf_idf = tf * Math.log(df);
			userVector.set(index, tf_idf);
			index++;
		}

		return userVector;
	}

}
