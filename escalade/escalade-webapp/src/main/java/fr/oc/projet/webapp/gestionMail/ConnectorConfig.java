package fr.oc.projet.webapp.gestionMail;

import org.springframework.context.annotation.Configuration;

import java.util.Collection;

@Configuration
public class ConnectorConfig {

    /*
    @Haricot
    public  EmbeddedServletContainerFactory  servletContainer () {
        TomcatEmbeddedServletContainerFactory tomcat =  new  TomcatEmbeddedServletContainerFactory () {
            @Passer outre
            protégé  vide  postProcessContext ( Contexte  contexte ) {
                SecurityConstraint securityConstraint =  new  SecurityConstraint ();
                securityConstraint . setUserConstraint ( " CONFIDENTIAL " );
                Collection SecurityCollection =  new  SecurityCollection ();
                collection . addPattern ( " / * " );
                securityConstraint . addCollection (collection);
                contexte . addConstraint (securityConstraint);
            }
        };
        tomcat . addAdditionalTomcatConnectors (getHttpConnector ());
        retourner tomcat;
    }

    connecteur  privé getHttpConnector () {
        Connecteur connecteur =  nouveau  connecteur ( " org.apache.coyote.http11.Http11NioProtocol " );
        connecteur . setScheme ( " http " );
        connecteur . setPort ( 8080 );
        connecteur . setSecure ( false );
        connecteur . setRedirectPort ( 8443 );
        connecteur de retour ;
    }
    */
}
