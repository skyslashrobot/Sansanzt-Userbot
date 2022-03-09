FROM kyyex/kyy-userbot:busterv2
RUN apt-get update
RUN apt-get install -y --no-install-recommends \
    curl \
    git \
    ffmpeg
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs && \
    npm i -g npm
RUN git clone -b Sansanzt-Userbot https://github.com/Melromarch/Sansanzt-Userbot /home/Sansanzt-Userbot/ \
    && chmod 777 /home/Sansanzt-Userbot \
    && mkdir /home/Kyy-Userbot/bin/
WORKDIR /home/Sansanzt-Userbot/
COPY ./sample_config.env ./config.env* /home/Sansanzt-Userbot/
RUN pip install -r requirements.txt
CMD ["python3", "-m", "userbot"]
