FROM quay.io/luet/base:develop
ADD conf/luet.yaml.docker /etc/luet/luet.yaml
ADD https://raw.githubusercontent.com/geaaru/luet-specs/master/contrib/geaaru.yml /etc/luet/repos.conf.d/

ENV USER=root

SHELL ["/usr/bin/luet", "install", "-y"]
RUN repository/mocaccino-os-commons
RUN repository/mocaccino-extra
RUN repository/mocaccino-funtoo
RUN layer/funtoo-base

SHELL ["/bin/bash", "-c"]

RUN rm -rf /var/cache/luet/packages/ /var/cache/luet/repos/

ENV TMPDIR=/tmp
ENTRYPOINT ["/bin/bash"]
