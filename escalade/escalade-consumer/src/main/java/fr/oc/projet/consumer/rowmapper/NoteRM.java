package fr.oc.projet.consumer.rowmapper;
import fr.oc.projet.model.bean.utilisateur.Note;
import org.springframework.jdbc.core.RowMapper;

import javax.inject.Named;
import java.sql.ResultSet;
import java.sql.SQLException;

@Named
public class NoteRM implements RowMapper<Note> {

    @Override
    public Note mapRow(ResultSet resultSet, int i) throws SQLException {
        Note note = new Note();
        note.setId(resultSet.getInt("id"));
        note.setNote(resultSet.getDouble("note"));
        return note;
    }
}
