package fr.oc.projet.business.manager.impl.manager;

import fr.oc.projet.business.manager.contract.manager.ImageManager;
import fr.oc.projet.model.bean.Image;

import java.util.List;

public class ImageManagerImpl extends AbstractManagerImpl implements ImageManager {
    @Override
    public Image getImage(Integer pId) {
        return getDaoFactory().getImageDao().getImage(pId);
    }

    @Override
    public List<Image> getListImage() {
        return getDaoFactory().getImageDao().getListImage();
    }

    @Override
    public List<Image> getListImageSite(Integer siteId) {
        return getDaoFactory().getImageDao().getListImageSite(siteId);
    }

    @Override
    public List<Image> getListImageTopo(Integer topoId) {
        return getDaoFactory().getImageDao().getListImageTopo(topoId);
    }

    @Override
    public void addImage(Image image) {
        getDaoFactory().getImageDao().addImage(image);
    }
}
