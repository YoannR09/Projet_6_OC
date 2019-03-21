package fr.oc.projet.consumer.impl.dao;

import fr.oc.projet.consumer.contract.dao.NoteDao;
import fr.oc.projet.consumer.rowmapper.NoteRM;
import fr.oc.projet.consumer.rowmapper.TopoRM;
import fr.oc.projet.model.bean.utilisateur.Note;
import fr.oc.projet.model.bean.utilisateur.Reservation;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.inject.Inject;
import javax.inject.Named;
import java.util.List;

@Named
public class NoteDaoImpl extends AbstractDaoImpl implements NoteDao {

    @Inject
    NoteRM noteRM;

    @Override
    public Note getNote(Integer pId) {
        String vSQL = "SELECT * FROM note WHERE id ="+pId;
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        Note note = vJdbcTemplate.queryForObject(vSQL,noteRM);
        return note;
    }

    /**
     * Méthode pour calculer la note d'un topo
     * @param topoId
     * @return
     */
    @Override
    public float getNoteTopo(Integer topoId) {
        String vSQL = "SELECT * FROM note WHERE topo_id ="+topoId;
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        List<Note> vListNoteTopo = vJdbcTemplate.query(vSQL,noteRM);
        float notes = 0;
        int i=0;
        for(i=0;i<vListNoteTopo.size();i++){
           notes = (notes + vListNoteTopo.get(i).getNote());
        }
        notes = (notes/i);
        return notes;
    }

    /**
     * Méthode pour calculer le note d'un site
     * @param siteId
     * @return
     */

    @Override
    public float getNoteSite(Integer siteId) {
        String vSQL = "SELECT * FROM note WHERE site_id ="+siteId;
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        List<Note> vListSite = vJdbcTemplate.query(vSQL,noteRM);
        float notes = 0;
        int i=0;
        for(i=0;i<vListSite.size();i++){
            notes = (notes + vListSite.get(i).getNote());
        }
        notes = (notes/i);
        return notes;
    }
}
