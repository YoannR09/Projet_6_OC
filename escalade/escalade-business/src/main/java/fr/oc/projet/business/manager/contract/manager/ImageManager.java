package fr.oc.projet.business.manager.contract.manager;

import fr.oc.projet.model.bean.Image;

import java.util.List;

public interface ImageManager {

    Image getImage(Integer pId);

    List<Image> getListImage();

    List<Image> getListImageSite(Integer siteId);

    List<Image> getListImageTopo(Integer topoId);

    void addImage(Image image);

    Integer getCountImageSite(Integer siteId);

    Integer getCountImageTopo(Integer topoId);

    void deleteImageSite(Integer siteId);

    void deleteImageTopo(Integer topoId);
}
