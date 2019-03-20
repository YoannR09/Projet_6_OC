package fr.oc.projet.business.manager.impl.manager;

import fr.oc.projet.business.manager.contract.manager.RegionManager;
import fr.oc.projet.model.bean.escalade.Region;

import javax.inject.Named;
import java.util.List;


@Named
public class RegionManagerImpl extends AbstractManagerImpl implements RegionManager {
    @Override
    public Region getRegion(Integer pId) {
        return getDaoFactory().getRegionDao().getRegion(pId);
    }

    @Override
    public List<Region> getListRegion() {
        return getDaoFactory().getRegionDao().getListRegion();
    }
}
