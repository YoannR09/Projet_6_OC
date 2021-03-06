package fr.oc.projet.business.manager.impl.manager;

import fr.oc.projet.business.manager.contract.manager.TypeDeRocheManager;
import fr.oc.projet.model.bean.escalade.TypeDeRoche;

import javax.inject.Named;
import java.util.List;


@Named
public class TypeDeRocheManagerImpl extends AbstractManagerImpl implements TypeDeRocheManager {
    @Override
    public TypeDeRoche getTypeDeRoche(Integer pId) {
        return getDaoFactory().getTypeDeRocheDao().getTypeDeRoche(pId);
    }

    @Override
    public List<TypeDeRoche> getListTypeDeRoche() {
        return getDaoFactory().getTypeDeRocheDao().getListTypeDeRoche();
    }
}
