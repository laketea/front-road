package com.szrz.common.hibernate;

import java.io.Serializable;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.LockMode;
import org.hibernate.criterion.DetachedCriteria;

/** * * @author lny */
public interface GenericDao<T extends Serializable, PK extends Serializable> {
	
	// -------------------- �������������ӡ��޸ġ�ɾ������ --------------------
	// ����������ȡʵ�塣���û����Ӧ��ʵ�壬���� null��
	public T get(PK id);

	// ����������ȡʵ�岢���������û����Ӧ��ʵ�壬���� null��
	public T getWithLock(PK id, LockMode lock);

	// ����������ȡʵ�塣���û����Ӧ��ʵ�壬�׳��쳣��
	public T load(PK id);

	// ����������ȡʵ�岢���������û����Ӧ��ʵ�壬�׳��쳣��
	public T loadWithLock(PK id, LockMode lock);

	// ��ȡȫ��ʵ�塣
	public List<T> loadAll();

	// loadAllWithLock() ?
	// ����ʵ��
	public void update(T entity);

	// ����ʵ�岢����
	public void updateWithLock(T entity, LockMode lock);

	// �洢ʵ�嵽���ݿ�
	public void save(T entity);

	// saveWithLock()
	// ���ӻ����ʵ��
	public void saveOrUpdate(T entity);

	// ���ӻ���¼����е�ȫ��ʵ��
	public void saveOrUpdateAll(Collection<T> entities);

	// ɾ��ָ����ʵ��
	public void delete(T entity);

	// ������ɾ��ָ����ʵ��
	public void deleteWithLock(T entity, LockMode lock);

	// ��������ɾ��ָ��ʵ��
	public void deleteByKey(PK id);

	// ��������������ɾ��ָ����ʵ��
	public void deleteByKeyWithLock(PK id, LockMode lock);

	// ɾ�������е�ȫ��ʵ��
	public void deleteAll(Collection<T> entities);

	// -------------------- HSQL ----------------------------------------------
	// ʹ��HSQL���ֱ�����ӡ����¡�ɾ��ʵ��
	public int bulkUpdate(String queryString);

	// ʹ�ô�������HSQL������ӡ����¡�ɾ��ʵ��
	public int bulkUpdate(String queryString, Object[] values);

	// ʹ��HSQL����������
	public List find(String queryString);

	// ʹ�ô�������HSQL����������
	public List find(String queryString, Object[] values);

	// ʹ�ô������Ĳ�����HSQL����������
	public List findByNamedParam(String queryString, String[] paramNames,
			Object[] values);

	// ʹ��������HSQL����������
	public List findByNamedQuery(String queryName);

	// ʹ�ô�����������HSQL����������
	public List findByNamedQuery(String queryName, Object[] values);

	// ʹ�ô���������������HSQL����������
	public List findByNamedQueryAndNamedParam(String queryName,
			String[] paramNames, Object[] values); // ʹ��HSQL���������ݣ����� Iterator
													// public Iterator
													// iterate(String
													// queryString);
	// ʹ�ô�����HSQL���������ݣ����� Iterator

	public Iterator iterate(String queryString, Object[] values);

	// �رռ������ص� Iterator
	public void closeIterator(Iterator it);

	// -------------------------------- Criteria ------------------------------
	// ������Ự�޹صļ�����׼����
	public DetachedCriteria createDetachedCriteria();

	// ������Ự�󶨵ļ�����׼����
	public Criteria createCriteria();

	// ʹ��ָ���ļ�����׼��������
	public List findByCriteria(DetachedCriteria criteria);

	// ʹ��ָ���ļ�����׼�������ݣ����ز��ּ�¼
	public List findByCriteria(DetachedCriteria criteria, int firstResult,
			int maxResults);

	// ʹ��ָ����ʵ�弰���Լ�������������������ԣ�ʵ��ֵ������
	public List<T> findEqualByEntity(T entity, String[] propertyNames);

	// ʹ��ָ����ʵ�弰����(������)�������������� like ��ʵ��ֵ������
	public List<T> findLikeByEntity(T entity, String[] propertyNames);

	// ʹ��ָ���ļ�����׼�������ݣ�����ָ����Χ�ļ�¼
	public Integer getRowCount(DetachedCriteria criteria);

	// ʹ��ָ���ļ�����׼�������ݣ�����ָ��ͳ��ֵ
	public Object getStatValue(DetachedCriteria criteria, String propertyName,
			String StatName);

	// -------------------------------- Others --------------------------------
	
	// ����ָ����ʵ��
	public void lock(T entity, LockMode lockMode);

	// ǿ�Ƴ�ʼ��ָ����ʵ��
	public void initialize(Object proxy);

	// ǿ���������»������ݵ����ݿ⣨������������ύʱ�Ÿ��£�
	public void flush();
	
	//------------------------------------page-----------------
	
	List findByPageHql(String hql,int pageNo,int pageSize );
	
	List findByHql(String hql);
}