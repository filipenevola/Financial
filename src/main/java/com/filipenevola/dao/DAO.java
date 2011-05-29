package com.filipenevola.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

import com.filipenevola.model.BaseEntity;
@Component
public class DAO {
	private static final Long ERRO_COUNT = -1L;
	private static Logger LOG = Logger.getLogger(DAO.class);

	protected static EntityManager em;

	public DAO() {
	}

	public Long count(String className) {
		LOG.debug("count " + className + " - start - out");
		LOG.debug("count " + className + " - return - out");
		return count(className, null, new Object[0]);
	}

	public Long count(String className, String condicoes, Object... parameters) {
		LOG.debug("count " + className + " - start");
		Long toReturn = null;
		try {
			createManager();
			String query = "SELECT COUNT(o) FROM " + className + " o";
			if (condicoes != null) {
				query += " WHERE (" + condicoes + ")";
			}
			Query q = em.createQuery(query);
			if (parameters != null && parameters.length > 0) {
				for (int i = 0; i < parameters.length; i++) {
					q.setParameter(i + 1, parameters[i]);
				}
			}
			toReturn = (Long) q.getSingleResult();
			em.getTransaction().commit();
		} catch (Exception ex) {
			LOG.error("Erro ao executar count " + className, ex);
			toReturn = ERRO_COUNT;
		} finally {
			if (em != null && em.isOpen()) {
				em.close();
			}
		}
		LOG.debug("count " + className + " - return");
		return toReturn;
	}

	private void createManager() {
		em = JPAFactory.getEntityManager();
	}

	public boolean executeByNamedQuery(String namedQuery) {
		LOG.debug("executeByNamedQuery " + namedQuery + " - start - out");
		LOG.debug("executeByNamedQuery " + namedQuery + " - return - out");
		return executeByNamedQuery(namedQuery, new Object[0]);
	}

	public boolean executeByNamedQuery(String namedQuery, Object... parameters) {
		LOG.debug("executeByNamedQuery " + namedQuery + " - start");
		try {
			createManager();
			Query query = em.createNamedQuery(namedQuery);
			if (parameters != null && parameters.length > 0) {
				for (int i = 0; i < parameters.length; i++) {
					query.setParameter(i + 1, parameters[i]);
				}
			}
			query.executeUpdate();
			em.getTransaction().commit();
		} catch (Exception ex) {
			LOG.error("Erro ao executar a named query " + namedQuery, ex);
			return false;
		} finally {
			if (em != null && em.isOpen()) {
				em.close();
			}
		}
		LOG.debug("executeByNamedQuery " + namedQuery + " - return");
		return true;
	}

	public boolean executeByQuery(String query) {
		LOG.debug("executeByQuery " + query + " - start - out");
		LOG.debug("executeByQuery " + query + " - return - out");
		return executeByNamedQuery(query, new Object[0]);
	}

	public boolean executeByQuery(String query, Object... parameters) {
		LOG.debug("executeByQuery " + query + " - start");
		try {
			createManager();
			Query q = em.createQuery(query);
			if (parameters != null && parameters.length > 0) {
				for (int i = 0; i < parameters.length; i++) {
					q.setParameter(i + 1, parameters[i]);
				}
			}
			q.executeUpdate();
			em.getTransaction().commit();
		} catch (Exception ex) {
			LOG.error("Erro ao executar a named query " + query, ex);
			return false;
		} finally {
			if (em != null && em.isOpen()) {
				em.close();
			}
		}
		LOG.debug("executeByQuery " + query + " - return");
		return true;
	}
	
	public BaseEntity insert(BaseEntity entity) {
		LOG.debug("insert - start");
		try {
			createManager();
			em.persist(entity);
			em.getTransaction().commit();

		} catch (Exception e) {
			LOG.error("Erro ao inserir dados no banco.", e);
		} finally {
			if (em != null && em.isOpen()) {
				em.close();
			}
		}
		LOG.debug("insert - return");
		return entity;
	}

	public void remove(BaseEntity entity) {
		LOG.debug("remove - start");
		try {
			// entity = selectById(entity);
			createManager();
			em.remove(em.merge(entity));
			em.getTransaction().commit();
		} catch (Exception e) {
			LOG.error("Erro ao remover dados no banco.", e);
		} finally {
			if (em != null && em.isOpen()) {
				em.close();
			}
		}
		LOG.debug("remove - end");
	}

	public BaseEntity selectById(BaseEntity entity) {
		LOG.debug("selectById - start");
		try {
			createManager();
			entity = em.find(entity.getClass(), entity.getId());
		} catch (Exception e) {
			LOG.error("Erro ao selecionar por ID dados no banco.", e);
		} finally {
			if (em != null && em.isOpen()) {
				em.close();
			}
		}
		LOG.debug("selectById - return");
		return entity;
	}

	@SuppressWarnings("rawtypes")
	public List selectByNamedQueryList(String namedQuery) {
		LOG.debug("selectByNamedQueryList " + namedQuery + " - start - out");
		LOG.debug("selectByNamedQueryList " + namedQuery + " - return - out");
		return selectByNamedQueryList(namedQuery, new Object[0]);
	}

	@SuppressWarnings("rawtypes")
	public List selectByNamedQueryList(String namedQuery, Object... parameters) {
		LOG.debug("selectByNamedQueryList " + namedQuery + " - start");
		List list = null;
		try {
			createManager();
			em.clear();
			Query query = em.createNamedQuery(namedQuery);
			if (parameters != null && parameters.length > 0) {
				for (int i = 0; i < parameters.length; i++) {
					query.setParameter(i + 1, parameters[i]);
				}
			}
			list = query.getResultList();
		} catch (Exception ex) {
			LOG.error("Erro ao executar a named query " + namedQuery, ex);
		} finally {
			if (em != null && em.isOpen()) {
				em.close();
			}
		}
		LOG.debug("selectByNamedQueryList " + namedQuery + " - return");
		return list;
	}

	@SuppressWarnings("rawtypes")
	public List selectByNamedQueryMaxResult(String namedQuery, int max) {
		return selectByNamedQueryMaxResult(namedQuery, max, new Object[0]);
	}

	@SuppressWarnings("rawtypes")
	public List selectByNamedQueryMaxResult(String namedQuery, int max,
			Object... parameters) {
		LOG.debug("selectByNamedQueryMaxResult " + namedQuery + " - start");
		List list = null;
		try {
			createManager();
			em.clear();
			Query query = em.createNamedQuery(namedQuery);
			if (parameters != null && parameters.length > 0) {
				for (int i = 0; i < parameters.length; i++) {
					query.setParameter(i + 1, parameters[i]);
				}
			}
			query.setMaxResults(max);
			list = query.getResultList();
		} catch (Exception ex) {
			LOG.error("Erro ao executar a named query max result" + namedQuery,
					ex);
		} finally {
			if (em != null && em.isOpen()) {
				em.close();
			}
		}
		LOG.debug("selectByNamedQueryMaxResult " + namedQuery + " - return");
		return list;
	}

	public BaseEntity selectByNamedQuerySingleResult(String namedQuery) {
		LOG.debug("selectByNamedQuerySingleResult " + namedQuery
				+ "  - start - out");
		LOG.debug("selectByNamedQuerySingleResult " + namedQuery
				+ "  - return - out");
		return selectByNamedQuerySingleResult(namedQuery, new Object[0]);
	}
	
	@SuppressWarnings("rawtypes")
	public BaseEntity selectByNamedQuerySingleResult(String namedQuery,
			Object... parameters) {
		LOG.debug("selectByNamedQuerySingleResult " + namedQuery + " - start");
		BaseEntity baseEntity = null;
		try {
			createManager();
			em.clear();
			Query query = em.createNamedQuery(namedQuery);
			if (parameters != null && parameters.length > 0) {
				for (int i = 0; i < parameters.length; i++) {
					query.setParameter(i + 1, parameters[i]);
				}
			}
			List list = query.getResultList();
			if (list.size() > 0) {
				baseEntity = (BaseEntity) list.get(0);
			}
		} catch (Exception ex) {
			LOG.error("Erro ao executar a named query single result "
					+ namedQuery, ex);
		} finally {
			if (em != null && em.isOpen()) {
				em.close();
			}
		}
		LOG.debug("selectByNamedQuerySingleResult " + namedQuery + " - return");
		return baseEntity;
	}

	@SuppressWarnings("rawtypes")
	public List selectByQueryList(String query) {
		LOG.debug("selectByQueryList " + query + " - start - out");
		LOG.debug("selectByQueryList " + query + " - return - out");
		return selectByQueryList(query, new Object[0]);
	}

	@SuppressWarnings("rawtypes")
	public List selectByQueryList(String query, Object... parameters) {
		LOG.debug("selectByQueryList " + query + " - start");
		List list = null;
		try {
			createManager();
			em.clear();
			Query q = em.createQuery(query);
			if (parameters != null && parameters.length > 0) {
				for (int i = 0; i < parameters.length; i++) {
					q.setParameter(i + 1, parameters[i]);
				}
			}
			list = q.getResultList();
		} catch (Exception ex) {
			LOG.error("Erro ao executar a query " + query, ex);
		} finally {
			if (em != null && em.isOpen()) {
				em.close();
			}
		}
		LOG.debug("selectByQueryList " + query + " - return");
		return list;
	}

	@SuppressWarnings("rawtypes")
	public List selectByQueryListPaging(String query, Integer start, Integer end) {
		LOG.debug("selectByQueryListPaging " + query + " - start - out");
		LOG.debug("selectByQueryListPaging " + query + " - return - out");
		return selectByQueryListPaging(query, start, end, new Object[0]);
	}

	@SuppressWarnings("rawtypes")
	public List selectByQueryListPaging(String query, Integer start, Integer pageSize, Object... parameters) {
		LOG.debug("selectByQueryListPaging " + query + " - start");
		List list = null;
		try {
			createManager();
			em.clear();
			Query q = em.createQuery(query);
			q.setFirstResult(start);
			LOG.debug("start in " + start);
			q.setMaxResults(pageSize);
			LOG.debug("load " + pageSize + " row(s)");
			if (parameters != null && parameters.length > 0) {
				for (int i = 0; i < parameters.length; i++) {
					q.setParameter(i + 1, parameters[i]);
				}
			}
			list = q.getResultList();
		} catch (Exception ex) {
			LOG.error("Erro ao executar a query " + query, ex);
		} finally {
			if (em != null && em.isOpen()) {
				em.close();
			}
		}
		LOG.debug("selectByQueryList " + query + " - return");
		return list;
	}

	public BaseEntity selectByQuerySingleResult(String query) {
		LOG.debug("selectByQueryList " + query + " - start - out");
		LOG.debug("selectByQueryList " + query + " - return - out");
		return selectByQuerySingleResult(query, new Object[0]);
	}

	@SuppressWarnings("rawtypes")
	public BaseEntity selectByQuerySingleResult(String query,
			Object... parameters) {
		LOG.debug("selectByQuerySingleResult " + query + " - start");
		BaseEntity baseEntity = null;
		try {
			createManager();
			em.clear();
			Query q = em.createQuery(query);
			if (parameters != null && parameters.length > 0) {
				for (int i = 0; i < parameters.length; i++) {
					q.setParameter(i + 1, parameters[i]);
				}
			}
			List list = q.getResultList();
			if (list.size() > 0) {
				baseEntity = (BaseEntity) list.get(0);
			}
		} catch (Exception ex) {
			LOG.error("Erro ao executar a query " + query, ex);
		} finally {
			if (em != null && em.isOpen()) {
				em.close();
			}
		}
		LOG.debug("selectByQuerySingleResult " + query + " - return");
		return baseEntity;
	}

	public BaseEntity update(BaseEntity entity) {
		LOG.debug("update - start");
		try {
			createManager();
			em.merge(entity);
			em.getTransaction().commit();
		} catch (Exception e) {
			LOG.error("Erro ao atualizar dados no banco.", e);
		} finally {
			if (em != null && em.isOpen()) {
				em.close();
			}
		}
		LOG.debug("update - return");
		return entity;
	}
}
