package com.salesmanager.recommender.main;

import java.io.Serializable;
import java.util.Map;
//class này sẽ được dùng để xây dựng model

import org.grouplens.grapht.annotation.DefaultProvider;
import org.grouplens.lenskit.vectors.MutableSparseVector;
import org.grouplens.lenskit.vectors.SparseVector;
import org.lenskit.inject.Shareable;

//LensKit models are annotated with @Shareable so they can be serialized and reused
@Shareable
//This model class will be built by the model builder
@DefaultProvider(TFIDFBuilderModel.class)
public class TFIDFModel implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Map<String, Long> features = null;
	private Map<Long, MutableSparseVector> itemVectorsMap = null;
	private Map<Long, Double> idToDFMap = null;

	public TFIDFModel(Map<String, Long> features, Map<Long, MutableSparseVector> itemVectorsMap,
			Map<Long, Double> idToDFMap) {
		// TODO Auto-generated constructor stub
		this.features = features;
		this.itemVectorsMap = itemVectorsMap;
		this.idToDFMap = idToDFMap;
	}

	// create a vector contain all features of item
	public MutableSparseVector createVectorFeatures() {
		return MutableSparseVector.create(features.values());
	}

	// get vector item by id
	@SuppressWarnings("static-access")
	public SparseVector getVectorItem(long idItem) {
		SparseVector sv = itemVectorsMap.get(idItem);
		// if sv is null -> not found id item
		return sv == null ? sv.empty() : sv;
	}

	// get map id feature -> name feature
	public Map<String, Long> createMapIDFeaure() {
		return features;
	}

	// compute IDF of feature specific
	public double weightDF(long idFeature) {
		return idToDFMap.get(idFeature);
	}

	public Map<String, Long> getFeatures() {
		return features;
	}

	public void setFeatures(Map<String, Long> features) {
		this.features = features;
	}

	public Map<Long, MutableSparseVector> getItemVectorsMap() {
		return itemVectorsMap;
	}

	public void setItemVectorsMap(Map<Long, MutableSparseVector> itemVectorsMap) {
		this.itemVectorsMap = itemVectorsMap;
	}

	public Map<Long, Double> getIdToDFMap() {
		return idToDFMap;
	}

	public void setIdToDFMap(Map<Long, Double> idToDFMap) {
		this.idToDFMap = idToDFMap;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
