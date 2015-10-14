FROM andrewrothstein/docker-ansible:ubuntu_trusty

ADD requirements.yml requirements.yml
RUN ansible-galaxy install -r requirements.yml

ADD playbook.yml playbook.yml
RUN ansible-playbook playbook.yml

RUN julia -e 'Pkg.update(); Pkg.add("IJulia");'

CMD julia -e 'using IJulia; notebook();'

EXPOSE 8888