// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package eu.zomtec.em2012.domain;

import eu.zomtec.em2012.domain.Game;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect Game_Roo_Jpa_Entity {
    
    declare @type: Game: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Game.id;
    
    @Version
    @Column(name = "version")
    private Integer Game.version;
    
    public Long Game.getId() {
        return this.id;
    }
    
    public void Game.setId(Long id) {
        this.id = id;
    }
    
    public Integer Game.getVersion() {
        return this.version;
    }
    
    public void Game.setVersion(Integer version) {
        this.version = version;
    }
    
}
