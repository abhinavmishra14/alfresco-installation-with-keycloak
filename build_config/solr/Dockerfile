ARG SOLR_TAG
FROM alfresco/alfresco-search-services:${SOLR_TAG}

ARG ALFRESCO_HOSTNAME
ARG SOLR_HOSTNAME
ARG CROSS_LOCALE
ARG ALFRESCO_COMMS

ENV ALFRESCO_HOSTNAME $ALFRESCO_HOSTNAME
ENV SOLR_HOSTNAME $SOLR_HOSTNAME
ENV CROSS_LOCALE $CROSS_LOCALE
ENV ALFRESCO_COMMS $ALFRESCO_COMMS

# Configure Alfresco Service Name
RUN sed -i '/^bash.*/i sed -i "'"s/alfresco.host=localhost/alfresco.host=${ALFRESCO_HOSTNAME}/g"'" ${DIST_DIR}/solrhome/templates/rerank/conf/solrcore.properties\n' \
    ${DIST_DIR}/solr/bin/search_config_setup.sh && \
    sed -i '/^bash.*/i sed -i "'"s/solr.host=localhost/solr.host=${SOLR_HOSTNAME}/g"'" ${DIST_DIR}/solrhome/conf/shared.properties\n' \
    ${DIST_DIR}/solr/bin/search_config_setup.sh

# Enable Cross Locale SOLR Configuration
RUN if [ "$CROSS_LOCALE" == "true" ] ; then \
    sed -i '/^bash.*/i sed -i "'"/alfresco.cross.locale.datatype/s/^#//g"'" $DIST_DIR/solrhome/conf/shared.properties\n' \
    ${DIST_DIR}/solr/bin/search_config_setup.sh; \
fi

# Configure SOLR cores to run in HTTPs mode from template
RUN if [ "$ALFRESCO_COMMS" == "https" ] ; then \
    sed -i '/^bash.*/i sed -i "'"s/alfresco.secureComms=none/alfresco.secureComms=https/g"'" ${DIST_DIR}/solrhome/templates/rerank/conf/solrcore.properties\n' \
    ${DIST_DIR}/solr/bin/search_config_setup.sh; \
elif [ "$ALFRESCO_COMMS" == "secret" ] ; then \
    sed -i '/^bash.*/i sed -i "'"s/alfresco.secureComms=https/alfresco.secureComms=secret/g"'" ${DIST_DIR}/solrhome/templates/rerank/conf/solrcore.properties\n' \
    ${DIST_DIR}/solr/bin/search_config_setup.sh; \
else \
    sed -i '/^bash.*/i sed -i "'"s/alfresco.secureComms=https/alfresco.secureComms=none/g"'" ${DIST_DIR}/solrhome/templates/rerank/conf/solrcore.properties\n' \
    ${DIST_DIR}/solr/bin/search_config_setup.sh; \
fi

#Copy modified log4j.properties to logs directory in solr container
COPY log4j.properties ./logs/log4j.properties