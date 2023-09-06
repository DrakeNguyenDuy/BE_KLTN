package com.salesmanager.recommender.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.lenskit.data.dao.UserDAO;

import com.salesmanager.recommender.beans.UserBean;
import com.salesmanager.recommender.connection.Connect;

import contants.SystemConstants;
import it.unimi.dsi.fastutil.longs.Long2ObjectMap;
import it.unimi.dsi.fastutil.longs.Long2ObjectOpenHashMap;
import it.unimi.dsi.fastutil.longs.LongSet;

public class UserDao extends AbstractDao implements UserDAO {
	private transient volatile Long2ObjectMap<List<String>> userFeatures;
//	private transient volatile LongSet userIds;
	private Connection connection;


	private void loadUser() {
		if (userFeatures == null) {
			synchronized (this) {
				if (userFeatures == null) {
					userFeatures = new Long2ObjectOpenHashMap<List<String>>();
					connection = Connect.getInstance().getConnection();
					String sql="select c.customer_id, group_concat(distinct s.name) as skill, group_concat(distinct dd.name) as district from customer c \r\n"
							+ "join profile p on c.customer_id=p.customer_id\r\n"
							+ "join profile_skill_entry pse on pse.profile_id=p.id \r\n"
							+ "join skill_description s on s.id_skill=pse.skill_id\r\n"
							+ "join profile_area_work_entry pawe on pawe.profiles_ID = p.id \r\n"
							+ "join district_description dd on pawe.districts_ID_DISTRICT=dd.ID_DISTRICT\r\n"
							+ "group by c.customer_id";
					sql=sql.toUpperCase();
					PreparedStatement ps;
					List<UserBean> users = new ArrayList<UserBean>();
					try {
						ps = connection.prepareStatement(sql);
						ResultSet rs = ps.executeQuery();
						while (rs.next()) {
							UserBean user = new UserBean();
							user.setId(rs.getLong("customer_id"));
							user.setSkill(rs.getString("skill"));
							user.setDistinct(rs.getString("district"));
							users.add(user);
						}
						rs.close();
                        ps.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					for (UserBean ub : users) {
						long userId = ub.getId(); 
						List<String> features = userFeatures.get(userId);
						
						if (features == null) {// nếu tại vị trí đó chưa có dữ liệu thì khởi tạo array list, dành cho
												// lần lặp đầu tiên
							features = new ArrayList<String>();
							userFeatures.put(userId, features);
						}
						
						String[] featureSkills = ub.getSkill().split(SystemConstants.COMMA);
						String [] featureDistrict = ub.getDistinct().split(SystemConstants.COMMA);
						features.addAll(Arrays.asList(featureSkills));
						features.addAll(Arrays.asList(featureDistrict));
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
