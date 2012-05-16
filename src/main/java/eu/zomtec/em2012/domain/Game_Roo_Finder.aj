// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package eu.zomtec.em2012.domain;

import eu.zomtec.em2012.domain.Game;
import eu.zomtec.em2012.domain.GameGroup;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect Game_Roo_Finder {
    
    public static TypedQuery<Game> Game.findGamesByGameGroup(GameGroup gameGroup) {
        if (gameGroup == null) throw new IllegalArgumentException("The gameGroup argument is required");
        EntityManager em = Game.entityManager();
        TypedQuery<Game> q = em.createQuery("SELECT o FROM Game AS o WHERE o.gameGroup = :gameGroup", Game.class);
        q.setParameter("gameGroup", gameGroup);
        return q;
    }
    
}