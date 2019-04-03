package fr.oc.projet.consumer.contract.dao;

import fr.oc.projet.model.bean.Image;

import java.util.List;

public interface ImageDao {

    Image getImage(Integer pId);

    List<Image> getListImage();

    List<Image> getListImageSite(Integer siteId);

    List<Image> getListImageTopo(Integer topoId);

    void addImage(Image image);
}
