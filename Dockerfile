FROM fedora:25
MAINTAINER Frederico Muñoz <fsmunoz@sdf.org>

RUN dnf install -y dnf-plugins-core
RUN dnf config-manager --add-repo http://fedora.ada-language.com/fedora-adalanguage.repo
RUN dnf install -y avr-ada --nogpgcheck

# zile isn't _needed_ but I need some sane editor, and it's one of the
# smallest emacs-like; likewise for findutils
RUN dnf install -y make automake avrdude libmpc findutils zile

# This user will make it easier for RHEL-based distributions, others
# could change the UID with "docker run -u ..."
RUN useradd -ms /bin/bash -u 1000 ada
ENV PATH "$PATH:/opt/avr-ada-122/avr/bin:/opt/avr-ada-122/bin"

ENTRYPOINT /bin/bash
