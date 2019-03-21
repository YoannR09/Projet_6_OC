package fr.oc.projet.consumer.rowmapper;

import fr.oc.projet.consumer.contract.dao.CompteDao;
import fr.oc.projet.consumer.contract.dao.SiteDao;
import fr.oc.projet.consumer.contract.dao.TopoDao;
import fr.oc.projet.model.bean.utilisateur.Note;
import org.springframework.jdbc.core.RowMapper;

import javax.inject.Inject;
import javax.inject.Named;
import java.sql.ResultSet;
import java.sql.SQLException;

@Named
public class NoteRM implements RowMapper<Note> {

    @Inject
    SiteDao siteDao;
    @Inject
    TopoDao topoDao;
    @Inject
    CompteDao compteDao;

    @Override
    public Note mapRow(ResultSet resultSet, int i) throws SQLException {
        Note note = new Note();
        note.setId(resultSet.getInt("id"));
        note.setNote(resultSet.getFloat("note"));
        note.setEditeur(compteDao.getCompte(resultSet.getInt("compte_id")));
        note.setSite(siteDao.getSite(resultSet.getInt("site_id")));
        note.setTopo(topoDao.getTopo(resultSet.getInt("topo_id")));
        return note;
    }
}
