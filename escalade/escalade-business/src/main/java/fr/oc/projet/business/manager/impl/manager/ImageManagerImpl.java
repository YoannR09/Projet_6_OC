package fr.oc.projet.business.manager.impl.manager;

import fr.oc.projet.business.manager.contract.manager.ImageManager;
import fr.oc.projet.model.bean.Image;

import javax.inject.Named;
import java.util.List;

@Named
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

    @Override
    public Integer getCountImageSite(Integer siteId) {
        return getDaoFactory().getImageDao().getCountImageSite(siteId);
    }

    @Override
    public Integer getCountImageTopo(Integer topoId) {
        return getDaoFactory().getImageDao().getCountImageTopo(topoId);
    }

    @Override
    public void deleteImageSite(Integer siteId) {
        getDaoFactory().getImageDao().deleteImageSite(siteId);
    }

    @Override
    public void deleteImageTopo(Integer topoId) {
        getDaoFactory().getImageDao().deleteImageSite(topoId);
    }
}
