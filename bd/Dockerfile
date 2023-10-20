FROM mysql:8.0.34-debian
COPY bancouam.sql /docker-entrypoint-initdb.d/bancouam.sql
ENV MYSQL_ROOT_PASSWORD=Cdam2001
ENV MYSQL_DATABASE=bancouam
ENV MYSQL_USER=bancouam
ENV MYSQL_PASSWORD=Cdam3001
EXPOSE 3306
VOLUME /data/bancouam
RUN chmod +x /docker-entrypoint-initdb.d/bancouam.sql

