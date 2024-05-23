FROM ubuntu:20.04

# Stel de tijdzone in om prompts te voorkomen
ENV TZ=Europe/Amsterdam
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Werk package lists bij en installeer Apache en PHP
RUN apt update && apt install -y apache2 php

# Stel non-interactieve frontend in voor de installatie van pakketten
ENV DEBIAN_FRONTEND=noninteractive

# Kopieer je webbestanden naar de container
COPY html /var/www/html/

# Maak een buildtime.txt bestand aan met de huidige datum en tijd
RUN date > /var/www/html/buildtime.txt

# Stel de werkdirectory in
WORKDIR /var/www/html/

# Stel de container in om poort 80 te gebruiken
EXPOSE 80

# Start Apache bij het opstarten van de container
CMD ["sh", "-c", "service apache2 start && bash"]
