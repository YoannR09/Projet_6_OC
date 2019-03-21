package fr.oc.projet.business.manager.impl.manager;

import fr.oc.projet.business.manager.contract.manager.CotationManager;
import fr.oc.projet.model.bean.escalade.Cotation;

import javax.inject.Named;
import java.util.List;

@Named
public class CotationManagerImpl extends AbstractManagerImpl implements CotationManager {
    @Override
    public Cotation getCotation(Integer pId) {
        return getDaoFactory().getCotationDao().getCotation(pId);
    }

    @Override
    public List<Cotation> getListCotation() {
        return getDaoFactory().getCotationDao().getListCotation();
    }
}
