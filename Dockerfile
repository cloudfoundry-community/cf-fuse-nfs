FROM cloudfoundry/cflinuxfs2:1.19.0

RUN sudo apt-get install -y automake libtool xsltproc
ADD bin/build /home/vcap/build
RUN /home/vcap/build
