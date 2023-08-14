package com.salesmanager.dao;

import java.sql.Connection;

import org.grouplens.lenskit.data.sql.JDBCRatingDAO;
import org.grouplens.lenskit.data.text.EventFormat;
import org.lenskit.data.dao.EventCollectionDAO;
import org.lenskit.data.dao.EventDAO;
import org.lenskit.data.dao.SortOrder;
import org.lenskit.data.events.Event;
import org.lenskit.util.io.ObjectStream;
import org.lenskit.util.io.ObjectStreams;

import com.salesmanager.connection.Connect;

public class RatingDAO extends AbstractDao implements EventDAO {
	private transient volatile EventCollectionDAO eventCache;
	private Connection conn;

	private void loadEvent() {
		if (eventCache == null) {
			synchronized (this) {
				if (eventCache == null) {
					conn = Connect.getInstance().getConnection();
					// type event is
					// rating, like and
					// like-batch
					JDBCRatingDAO jdbcDao = JDBCRatingDAO.newBuilder()
							.setTableName("job_rate")
							.setTimestampColumn("date_rating")
							.setRatingColumn("jobRateStatus")
							.setUserColumn("ALUMNUS_ID").setItemColumn("JOB_ID").build(conn);
					EventDAO eventDao = jdbcDao;
					eventCache = (EventCollectionDAO) EventCollectionDAO
							.create(ObjectStreams.makeList(eventDao.streamEvents()));
				}
			}
		}
	}

	@Override
	public ObjectStream<Event> streamEvents() {
		loadEvent();
		return eventCache.streamEvents();
	}

	@Override
	public <E extends Event> ObjectStream<E> streamEvents(Class<E> type) {
		loadEvent();
		return eventCache.streamEvents(type);
	}

	@Override
	public <E extends Event> ObjectStream<E> streamEvents(Class<E> type, SortOrder order) {
		loadEvent();
		return eventCache.streamEvents(type, order);
	}

}
