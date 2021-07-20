FROM opensearchproject/opensearch:1.0.0

ENV PATH=/usr/share/opensearch/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN echo "cluster.routing.allocation.disk.threshold_enabled: false" >> /usr/share/opensearch/config/opensearch.yml \
    && elasticsearch-plugin install --batch ingest-attachment \
    && sed -i 's/%marker/\[%node_name\]%marker /' /usr/share/opensearch/config/log4j2.properties \
    && mkdir /snapshots
