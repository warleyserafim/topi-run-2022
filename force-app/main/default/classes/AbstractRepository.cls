/**
 * @author warleyalmeida - brq
 */

public abstract class AbstractRepository {

    virtual
    public SObject create(Contact records) {
        insert records;
        return records;
    }

    virtual
    public SObject create(SObject record) {
        create(new List<SObject> {record});
        return record;
    }

    virtual
    public List<SObject> create(List<SObject> records) {
        insert records;
        return records;
    }

    virtual
    public List<SObject> store(List<SObject> records) {
        update records;
        return records;
    }

    virtual
    public List<SObject> insertOrUpdate(List<SObject> records) {
        upsert records;
        return records;
    }

    virtual
    public void remove(List<SObject> records) {
        delete records;
    }
}
