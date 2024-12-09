## Erklären Sie beide Begriffe VPC und Subnet mit eigenen Worten. Wie viele Subnets haben Sie bereits vordefiniert?
VPC ist eine virtual private Cloud. Also ein kleines Virtuelles Netzwerk
Subnets sind kleinere Teile in einem VPC
5
## Decken die IP Ranges des Subnets den gesamten IP Range des VPC ab?
Nein, nur einen Teil
## Erklären Sie den Unterschied zwischen einer öffentlichen und einer private IP. Was ist eine statische IP?
Öffentliche IPs sind über das Internet aufrufbar, private nur über das lokale Netzwerk
Statische IPs ändern sich nie und bleiben immer gleich, anders als dynamische IPs die sich regelmässig verändern

## Finden Sie heraus in welchem Subnet Ihre Instanz aus der vorherigen KN04 liegt. Dies finden Sie in den Details der Instanz. Geben Sie nun dem Subnet den Namen Sub-KN04.
![alt text](image.png)

![alt text](image-1.png)

## Definieren Sie die beiden private IPs
- Web: 172.31.64.10
- DB: 172.31.64.20

# Sicherheitsgruppen
![alt text](image-2.png)

## Webserver
![alt text](image-3.png)

## DB
![alt text](image-4.png)

# Statische IP
![alt text](image-5.png)

# Zeigen Sie, dass Sie immer noch alle drei Seiten aufrufen können

![index](../assets/index.png)

![info](../assets/info.png)

![alt text](image-6.png)

# Screenshot der Liste der Instanzen, wenn beide Instanzen gestoppt sind. Die Werte der öffentlichen und private IPs und der Status (gestoppt) müssen sichtbar sein.

Web: 
![web](../assets/web.png)

Subnet:
web: 
![sub web](../assets/sub-web.png)

db: 

![alt text](image-7.png)


