package purchase.dao;

import java.util.List;
import java.util.Map;

public interface PurchaseDAO2 {
    void getProductInfo(Map<String, List<Map<String, Object>>> data);
}
