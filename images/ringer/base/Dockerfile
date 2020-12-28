FROM jodafons/cern-root

LABEL maintainer "Joao Victor da Fonseca Pinto <jodafons@lps.ufrj.br>"

USER root
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV TERM screen


RUN apt-get update
RUN apt-get install -y git vim 


# Install pip packages
RUN pip install future \
                numpy \
                onnxruntime \
                onnx \
                keras2onnx \
		pandas \
		gaugi \
                sklearn \
		seaborn \
		jupyterlab \
                Flask_Security \
                passlib \
                PTable \
                Flask_Mail \
                requests \
                Werkzeug \
                SQLAlchemy \
                Jinja2 \
                Flask \
                Flask_Login \
                Flask_SQLAlchemy \
                BeneDict \
                flask_admin \
                flask_bootstrap \
                flask_cors \
                flask_restful \
                prettytable \
                sqlalchemy_utils \
                psycopg2-binary \
                ansi2html


# Install Latex
RUN ln -snf /usr/share/zoneinfo/Etc/UTC /etc/localtime \
    && echo "Etc/UTC" > /etc/timezone \
    && apt-get update \
    && apt-get upgrade -y \
    && apt-get install texlive-latex-base texlive-latex-extra texlive-science texlive-fonts-recommended xzdec -y \
    && rm -rf /var/lib/apt/lists/*

COPY setup_root.sh /
COPY setup_all_here.sh /
RUN chmod 777 /setup_root.sh
RUN chmod 777 /setup_all_here.sh
