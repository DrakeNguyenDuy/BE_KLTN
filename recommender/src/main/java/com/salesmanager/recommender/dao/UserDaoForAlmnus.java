package com.salesmanager.recommender.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.lenskit.data.dao.UserDAO;

import com.google.common.collect.ImmutableSet;
import com.salesmanager.recommender.beans.Item;
import com.salesmanager.recommender.beans.UserBean;
import com.salesmanager.recommender.connection.Connect;

import contants.SystemConstants;
import it.unimi.dsi.fastutil.longs.Long2ObjectMap;
import it.unimi.dsi.fastutil.longs.Long2ObjectOpenHashMap;
import it.unimi.dsi.fastutil.longs.LongSet;

public class UserDaoForAlmnus extends AbstractDao implements UserDAO {
	private transient volatile Long2ObjectMap<List<String>> userFeatures;
//	private transient volatile LongSet userIds;
	private Connection connection;


	private void loadUser() {
		if (userFeatures == null) {
			synchronized (this) {
				if (userFeatures == null) {
					userFeatures = new Long2ObjectOpenHashMap<List<String>>();
					ImmutableSet.Builder<String> featuresSetBuilder = ImmutableSet.builder();
					connection = Connect.getInstance().getConnection();
					String sql = "select p.product_id, group_concat(distinct s.name) as skill, group_concat(distinct w.name) as ward,\r\n"
							+ "group_concat(distinct d.name) as district, group_concat(distinct pd.name) as province\r\n"
							+ "from product p join skill_product_entry spr on p.PRODUCT_ID=spr.PRODUCT_ID\r\n"
							+ "join skill_description s on s.id_skill = spr.ID_SKILL join location_product_entry lpe on lpe.PRODUCT_ID=p.PRODUCT_ID\r\n"
							+ "join location_description l on l.ID_LOCATION=lpe.ID_LOCATION join ward_description w on l.ID_WARD=w.ID_WARD\r\n"
							+ "join district_description d on d.ID_DISTRICT=l.ID_DISTRICT join province_description pd on pd.id_province= l.id_province\r\n"
							+ "group by p.PRODUCT_ID";
					PreparedStatement ps;
					List<Item> items = new ArrayList<Item>();
					try {
						ps = connection.prepareStatement(sql);
						ResultSet rs = ps.executeQuery();
						while (rs.next()) {
							Item item = new Item();
							item.setId(rs.getLong("product_id"));
							item.setSkill(rs.getString("skill"));
							item.setWard(rs.getString("ward"));
							item.setDistinct (rs.getString("district"));
							item.setProvince(rs.getString("province"));
							items.add(item);
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					for (Item i : items) {
						long jobID = i.getId();
						List<String> features = userFeatures.get(jobID);
						
						if (features == null) {// nếu tại vị trí đó chưa có dữ liệu thì khởi tạo array list, dành cho
												// lần lặp đầu tiên
							features = new ArrayList<String>();
							userFeatures.put(jobID, features);
						}
						if(i.getSkill()!=null) {
							String[] featureSkills = i.getSkill().split(SystemConstants.COMMA);
							features.addAll(Arrays.asList(featureSkills));
							featuresSetBuilder.addAll(Arrays.asList(featureSkills));
						}
						if(i.getDistinct()!=null) {
							String [] featureDistrict = i.getDistinct().split(SystemConstants.COMMA);
							features.addAll(Arrays.asList(featureDistrict));
							featuresSetBuilder.addAll(Arrays.asList(featureDistrict));	
						}
					}
				}
			}
		}
	}

//	@Override
	public LongSet getUserIds() {
		return userFeatures.keySet();
	}
	public List<String> getFeatureUser(long idUser){
		loadUser();
		return userFeatures.get(idUser);
	}
}
