package fr.oc.projet.consumer.impl.dao;

import fr.oc.projet.consumer.contract.dao.NoteDao;
import fr.oc.projet.consumer.rowmapper.NoteRM;
import fr.oc.projet.consumer.rowmapper.TopoRM;
import fr.oc.projet.model.bean.utilisateur.Note;
import fr.oc.projet.model.bean.utilisateur.Reservation;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

import javax.inject.Inject;
import javax.inject.Named;
import java.sql.Types;
import java.util.ArrayList;
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
    public Double getNoteTopo(Integer topoId) {
        String vSQL = "SELECT * FROM note WHERE topo_id ="+topoId;
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        List<Note> vListNote = vJdbcTemplate.query(vSQL,noteRM);
        Double moyenne = calculNote(vListNote);
        return moyenne;
    }

    /**
     * Méthode pour calculer le note d'un site
     * @param siteId
     * @return
     */
    @Override
    public Double getNoteSite(Integer siteId) {
        String vSQL = "SELECT * FROM note WHERE site_id = "+siteId ;
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        List<Note> vListNote = vJdbcTemplate.query(vSQL,noteRM);
        Double moyenne = calculNote(vListNote);
        return moyenne;
    }

    /**
     * Méthode pour consulter si l'utilisateur a déjà noté ce site
     * @param compteId
     * @param siteId
     * @return
     */
    @Override
    public Integer getCheckNoteSite(Integer compteId, Integer siteId) {
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        int vNbre = vJdbcTemplate.queryForObject(
                "SELECT COUNT(*) FROM public.note WHERE site_id = "+siteId +
                " AND compte_id = "+compteId,
                Integer.class);
        return vNbre;
    }

    /**
     * Méthode pour consulter si l'utilisateur a déjà noté ce topo
     * @param compteId
     * @param topoId
     * @return
     */
    @Override
    public Integer getCheckNoteTopo(Integer compteId, Integer topoId) {
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        int vNbre = vJdbcTemplate.queryForObject(
                "SELECT COUNT(*) FROM public.note WHERE topo_id = "+topoId +
                        " AND compte_id = "+compteId,
                Integer.class);
        return vNbre;
    }

    /**
     * Méthode pour ajouter une note à un site ou topo.
     * @param note
     */
    @Override
    public void addNote(Note note) {
        String vSQL = "INSERT INTO note (note, site_id, topo_id, compte_id)" +
                " VALUES (:note, :siteId, :topoId, :compteId)";
        NamedParameterJdbcTemplate vJdbcTemplate = new NamedParameterJdbcTemplate(getDataSource());

        BeanPropertySqlParameterSource vParams = new BeanPropertySqlParameterSource(note);
        vParams.registerSqlType("note", Types.DOUBLE);
        vParams.registerSqlType("siteId", Types.INTEGER);
        vParams.registerSqlType("topoId", Types.INTEGER);
        vParams.registerSqlType("compteId", Types.INTEGER);

        try {
            vJdbcTemplate.update(vSQL, vParams);
        } catch (DuplicateKeyException vEx) {
        }
    }

    /**
     * Méthode qui fait le calcul de la moyenne des notes d'un site/topo.
     * @param vListNote
     * @return
     */
    Double calculNote(List<Note> vListNote){
        List<Double> list = new ArrayList<Double>();
        for(int i=0;i<vListNote.size();i++){
            list.add(vListNote.get(i).getNote());
        }
        double total = 0;
        for (double note : list) {
            total += note;
        }
        Double moyenne = total / list.size();
        return moyenne;
    }
}
