// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package eu.zomtec.em2012.domain;

import eu.zomtec.em2012.domain.GameGroup;
import eu.zomtec.em2012.domain.GameGroupDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect GameGroupDataOnDemand_Roo_DataOnDemand {
    
    declare @type: GameGroupDataOnDemand: @Component;
    
    private Random GameGroupDataOnDemand.rnd = new SecureRandom();
    
    private List<GameGroup> GameGroupDataOnDemand.data;
    
    public GameGroup GameGroupDataOnDemand.getNewTransientGameGroup(int index) {
        GameGroup obj = new GameGroup();
        setFactor(obj, index);
        setName(obj, index);
        setSortOrder(obj, index);
        return obj;
    }
    
    public void GameGroupDataOnDemand.setFactor(GameGroup obj, int index) {
        Integer factor = new Integer(index);
        obj.setFactor(factor);
    }
    
    public void GameGroupDataOnDemand.setName(GameGroup obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }
    
    public void GameGroupDataOnDemand.setSortOrder(GameGroup obj, int index) {
        Integer sortOrder = new Integer(index);
        obj.setSortOrder(sortOrder);
    }
    
    public GameGroup GameGroupDataOnDemand.getSpecificGameGroup(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        GameGroup obj = data.get(index);
        Long id = obj.getId();
        return GameGroup.findGameGroup(id);
    }
    
    public GameGroup GameGroupDataOnDemand.getRandomGameGroup() {
        init();
        GameGroup obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return GameGroup.findGameGroup(id);
    }
    
    public boolean GameGroupDataOnDemand.modifyGameGroup(GameGroup obj) {
        return false;
    }
    
    public void GameGroupDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = GameGroup.findGameGroupEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'GameGroup' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<GameGroup>();
        for (int i = 0; i < 10; i++) {
            GameGroup obj = getNewTransientGameGroup(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
