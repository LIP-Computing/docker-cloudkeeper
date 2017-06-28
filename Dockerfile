FROM centos:7
MAINTAINER Luís Alves <lalves@lip.pt>

RUN yum -y update
RUN yum install -y https://repos.fedorapeople.org/repos/openstack/openstack-mitaka/rdo-release-mitaka-7.noarch.rpm
RUN yum install -y curl epel-release nginx python-glanceclient python-keystoneauth1 python-oslo-config python-oslo-log
RUN yum install -y http://repository.egi.eu/sw/untested/cmd-os/1/centos7/x86_64/cloudkeeper-1.4.1+20170524191710-2.el7.x86_64.rpm
RUN yum install -y http://grand-est.fr/resources/software/cloudkeeper-os/centos/7/x86_64/python-grpcio-1.3.5-1.el7.centos.x86_64.rpm \
           http://grand-est.fr/resources/software/cloudkeeper-os/centos/7/x86_64/protobuf-3.3.0-1.el7.centos.x86_64.rpm \
           http://grand-est.fr/resources/software/cloudkeeper-os/centos/7/x86_64/cloudkeeper-os-0.8.0-2.el7.centos.x86_64.rpm \
           http://grand-est.fr/resources/software/cloudkeeper-os/centos/7/noarch/python2-protobuf-3.3.0-1.el7.centos.noarch.rpm

RUN curl -L http://repository.egi.eu/sw/production/cas/1/current/repo-files/EGI-trustanchors.repo > \
            /etc/yum.repos.d/EGI-trustanchors.repo \
    && yum -y install ca-policy-egi-core fetch-crl \
    && cd /etc/pki/ca-trust/source/anchors \
    && ln -s /etc/grid-security/certificates/*.pem . \
    && update-ca-trust extract

RUN fetch-crl || exit 0

# Put your host certificates in certs folder
COPY certs/cert.pem /etc/grid-security/hostcert.pem
COPY certs/key.pem /etc/grid-security/hostkey.pem


EXPOSE 50505
