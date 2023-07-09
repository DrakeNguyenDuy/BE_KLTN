package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

import org.grouplens.lenskit.data.sql.BasicSQLStatementFactory;
import org.grouplens.lenskit.data.sql.JDBCRatingDAO;
import org.lenskit.LenskitConfiguration;
import org.lenskit.LenskitRecommender;
import org.lenskit.api.ItemRecommender;
import org.lenskit.api.ItemScorer;
import org.lenskit.api.Recommender;

import main.TFIDFItemScorer;

public class DB {

	String url = "jdbc:mysql://localhost:3306/viecsinhvien3?#autoReconnect=true&useUnicode=true&characterEncoding=UTF-8";
	String username = "root";
	String password = "1234";

	private JDBCRatingDAO jdbcRatingDAO;

	private Connection connection = null;

	public Connection openConnection() {
		try {
			if (connection == null) {
				connection = DriverManager.getConnection(url, username, password);
			}
			return connection;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	@SuppressWarnings("deprecation")
	public void daoRecommendation() {
		jdbcRatingDAO = new JDBCRatingDAO(connection, new BasicSQLStatementFactory());
		
		LenskitConfiguration configuration = configureRecommender();
		configuration.addComponent(jdbcRatingDAO);
		
		
		
		Recommender rec = LenskitRecommender.build(configuration);
		
		ItemRecommender itemRecommender = rec.getItemRecommender();
		
		List<Long> recs = itemRecommender.recommend(1, 5);
		
		if (recs.isEmpty()) {
			System.out.println("no recommendations for user "+ 1);
		}
		System.out.format("recommendations for user %d:\n", 1);
		for (Long i : recs) {
//			System.out.format("  %d: %.4f\n", i.getId(), i.getScore());
			System.out.println(i);
		}
	}
	
	@SuppressWarnings("unchecked")
	private static LenskitConfiguration configureRecommender() {
		LenskitConfiguration config = new LenskitConfiguration();
		// use the TF-IDF scorer you will implement to score items
		config.bind(ItemScorer.class).to(TFIDFItemScorer.class);
		// configure the rating data source
//		config.bind(EventDAO.class).to(RatingDAO.class);
//		config.set(RatingFile.class).to(new File("data/1.csv"));
//		// use custom item and user DAOs
//		// specify item DAO implementation with features includes: skills, address,..
//		config.bind(ItemDAO.class).to(ItemDao.class);
//		// specify tag file
//		config.set(ItemFile.class).to(new File("data/job.csv"));
//		// our user DAO can look up by user name
//		config.bind(UserDAO.class).to(UserDao.class);
//		config.set(UserFile.class).to(new File("data/user.csv"));
		return config;
	}
	
	public static void main(String[] args) {
		DB db = new DB();
		db.openConnection();
		db.daoRecommendation();
	}
}
