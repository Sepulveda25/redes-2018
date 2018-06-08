#!/bin/bash

#Direcciones IPv6 para interfaces ns1.1
IPV6_TAP112=2001:1111:1111:2222::10
IPV6_TAP113=2001:1111:1111:3333::10
IPV6_TAP114=2001:1111:1111:4444::10
IPV6_TAP11br=2001:aaaa:bbbb:cccc::10
#Direcciones IPv6 para interfaces ns1.2
IPV6_TAP121=2001:1111:1111:2222::20
IPV6_TAP12a=2001:1111:2222:aabb::aaaa
IPV6_TAP12b=2001:1111:2222:aabb::bbbb
#Direcciones IPv6 para interfaces ns1.3
IPV6_TAP131=2001:1111:1111:3333::30
IPV6_TAP134=2001:1111:3333:4444::30
IPV6_TAP135=2001:1111:3333:5555::30 
#Direcciones IPv6 para interfaces ns1.4
IPV6_TAP141=2001:1111:1111:4444::40 
IPV6_TAP143=2001:1111:3333:4444::40
IPV6_TAP146=2001:1111:4444:6666::40 
#Direcciones IPv6 para interfaces ns1.5
IPV6_TAP153=2001:1111:3333:5555::50  
#Direcciones IPv6 para interfaces ns1.6
IPV6_TAP164=2001:1111:4444:6666::60
#Direcciones IPv6 para interfaces ns2.1
IPV6_TAP21br=2001:aaaa:bbbb:cccc::20
#Direccion IPv6 para bridge
IPV6_BRIDGE_EXTERNO=2001:aaaa:bbbb:cccc::11
#Direcciones de redes IPv6 para pc1
RED112=2001:1111:1111:2222::0
RED113=2001:1111:1111:3333::0
RED114=2001:1111:1111:4444::0
RED12AB=2001:1111:2222:aabb::0
RED134=2001:1111:3333:4444::0
RED135=2001:1111:3333:5555::0 
RED146=2001:1111:4444:6666::0
#Direcciones de redes IPv6 para pc2
RED212=2001:2222:1111:2222::0
RED213=2001:2222:1111:3333::0
RED214=2001:2222:1111:4444::0
RED22AB=2001:2222:2222:aabb::0
RED234=2001:2222:3333:4444::0
RED235=2001:2222:3333:5555::0 
RED246=2001:2222:4444:6666::0
#Direccion de red para ns1.1, bridge y ns2.1
REDABC=2001:aaaa:bbbb:cccc::0
#Nombre interfaz fisica
INTERFAZ_FISICA=enp3s0f1


#Crear y configurar un namespace
echo Crear y configurar un namespace
ip netns add ns1.1 #se crea el namespace llamado ns1.1
ip netns add ns1.2 #se crea el namespace llamado ns1.2
ip netns add ns1.3 #se crea el namespace llamado ns1.3
ip netns add ns1.4 #se crea el namespace llamado ns1.4
ip netns add ns1.5 #se crea el namespace llamado ns1.5
ip netns add ns1.6 #se crea el namespace llamado ns1.6
 
#Crear cables para conexiones de ns1.1
echo Crear cables para conexiones de ns1.1
ip link add tap1.1.2 type veth peer name tap1.2.1 # conexion de ns1.1 a ns1.2
ip link add tap1.1.3 type veth peer name tap1.3.1 # conexion de ns1.1 a ns1.3
ip link add tap1.1.4 type veth peer name tap1.4.1 # conexion de ns1.1 a ns1.4 
ip link add tap1.1.br type veth peer name br-tap1.1.br # conexion de ns1.1 a bridge
#Crear cables para conexiones de ns1.2
echo Crear cables para conexiones de ns1.2
ip link add tap1.2.a type veth peer name tap1.2.b # conexion de ns1.2 a ns1.2
#Crear cables para conexiones de ns1.3
echo Crear cables para conexiones de ns1.3
ip link add tap1.3.4 type veth peer name tap1.4.3 # conexion de ns1.3 a ns1.4 
ip link add tap1.3.5 type veth peer name tap1.5.3 # conexion de ns1.3 a ns1.5
#Crear cables para conexiones de ns1.4
echo Crear cables para conexiones de ns1.4
ip link add tap1.4.6 type veth peer name tap1.6.4 # conexion de ns1.4 a ns1.6
#Crear cables para conexiones de bridge con interfaz fisica
#echo Crear cables para conexiones de bridge con interfaz fisica
#ip link add br-enp0s3 type veth peer name enp0s3 # conexion de bridge a interfaz fisica

echo Conexion de los cables a ns1.1
ip link set tap1.1.2 netns ns1.1 # se conecta el cable al tap1.1.2 del ns1.1
ip link set tap1.1.3 netns ns1.1 # se conecta el cable al tap1.1.3 del ns1.1
ip link set tap1.1.4 netns ns1.1 # se conecta el cable al tap1.1.4 del ns1.1
ip link set tap1.1.br netns ns1.1 # se conecta el cable al tap1.1.br del ns1.1
echo Conexion de los cables a ns1.2
ip link set tap1.2.1 netns ns1.2 # se conecta el cable al tap1.2.1 del ns1.2
ip link set tap1.2.a netns ns1.2 # se conecta el cable al tap1.2.a del ns1.2
ip link set tap1.2.b netns ns1.2 # se conecta el cable al tap1.2.b del ns1.2
echo Conexion de los cables a ns1.3
ip link set tap1.3.1 netns ns1.3 # se conecta el cable al tap1.3.1 del ns1.3
ip link set tap1.3.4 netns ns1.3 # se conecta el cable al tap1.3.4 del ns1.3
ip link set tap1.3.5 netns ns1.3 # se conecta el cable al tap1.3.5 del ns1.3
echo Conexion de los cables a ns1.4
ip link set tap1.4.1 netns ns1.4 # se conecta el cable al tap1.4.1 del ns1.4
ip link set tap1.4.3 netns ns1.4 # se conecta el cable al tap1.4.3 del ns1.4
ip link set tap1.4.6 netns ns1.4 # se conecta el cable al tap1.4.6 del ns1.4
echo Conexion de los cables a ns1.5
ip link set tap1.5.3 netns ns1.5 # se conecta el cable al tap1.5.3 del ns1.5
echo Conexion de los cables a ns1.6
ip link set tap1.6.4 netns ns1.6 # se conecta el cable al tap1.6.4 del ns1.6


echo Asignacion de direcciones IPv6 para cada interfaz de n1.1
ip netns exec ns1.1 ip -6 addr add ${IPV6_TAP112}/64 dev tap1.1.2
ip netns exec ns1.1 ip -6 addr add ${IPV6_TAP113}/64 dev tap1.1.3
ip netns exec ns1.1 ip -6 addr add ${IPV6_TAP114}/64 dev tap1.1.4
ip netns exec ns1.1 ip -6 addr add ${IPV6_TAP11br}/64 dev tap1.1.br
echo Asignacion de direcciones IPv6 para cada interfaz de n1.2
ip netns exec ns1.2 ip -6 addr add ${IPV6_TAP121}/64 dev tap1.2.1
ip netns exec ns1.2 ip -6 addr add ${IPV6_TAP12a}/64 dev tap1.2.a
ip netns exec ns1.2 ip -6 addr add ${IPV6_TAP12b}/64 dev tap1.2.b
echo Asignacion de direcciones IPv6 para cada interfaz de n1.3
ip netns exec ns1.3 ip -6 addr add ${IPV6_TAP131}/64 dev tap1.3.1
ip netns exec ns1.3 ip -6 addr add ${IPV6_TAP134}/64 dev tap1.3.4
ip netns exec ns1.3 ip -6 addr add ${IPV6_TAP135}/64 dev tap1.3.5
echo Asignacion de direcciones IPv6 para cada interfaz de n1.4
ip netns exec ns1.4 ip -6 addr add ${IPV6_TAP141}/64 dev tap1.4.1
ip netns exec ns1.4 ip -6 addr add ${IPV6_TAP143}/64 dev tap1.4.3
ip netns exec ns1.4 ip -6 addr add ${IPV6_TAP146}/64 dev tap1.4.6
echo Asignacion de direcciones IPv6 para cada interfaz de n1.5
ip netns exec ns1.5 ip -6 addr add ${IPV6_TAP153}/64 dev tap1.5.3
echo Asignacion de direcciones IPv6 para cada interfaz de n1.6
ip netns exec ns1.6 ip -6 addr add ${IPV6_TAP164}/64 dev tap1.6.4

echo Cofiguracion del defaut gateway para las intefaces de ns1.5
ip netns exec ns1.5 ip -6 route add default dev tap1.5.3 via ${IPV6_TAP135}
echo Cofiguracion del defaut gateway para las intefaces de ns1.6
ip netns exec ns1.6 ip -6 route add default dev tap1.6.4 via ${IPV6_TAP146}


echo Se levantan las interfaces de ns1.1
ip netns exec ns1.1 ip link set up dev lo
ip netns exec ns1.1 ip link set up dev tap1.1.2 # se levanta la interfaz tap1.1.2 
ip netns exec ns1.1 ip link set up dev tap1.1.3 # se levanta la interfaz tap1.1.3
ip netns exec ns1.1 ip link set up dev tap1.1.4 # se levanta la interfaz tap1.1.4
ip netns exec ns1.1 ip link set up dev tap1.1.br # se levanta la interfaz tap1.1.br
echo Se levantan las interfaces de ns1.2
ip netns exec ns1.2 ip link set up dev lo
ip netns exec ns1.2 ip link set up dev tap1.2.1 # se levanta la interfaz tap1.2.1 
ip netns exec ns1.2 ip link set up dev tap1.2.a # se levanta la interfaz tap1.2.a
ip netns exec ns1.2 ip link set up dev tap1.2.b # se levanta la interfaz tap1.2.b
echo Se levantan las interfaces de ns1.3
ip netns exec ns1.3 ip link set up dev lo
ip netns exec ns1.3 ip link set up dev tap1.3.1 # se levanta la interfaz tap1.3.1
ip netns exec ns1.3 ip link set up dev tap1.3.4 # se levanta la interfaz tap1.3.4
ip netns exec ns1.3 ip link set up dev tap1.3.5 # se levanta la interfaz tap1.3.5
echo Se levantan las interfaces de ns1.4
ip netns exec ns1.4 ip link set up dev lo
ip netns exec ns1.4 ip link set up dev tap1.4.1 # se levanta la interfaz tap1.4.1
ip netns exec ns1.4 ip link set up dev tap1.4.3 # se levanta la interfaz tap1.4.3
ip netns exec ns1.4 ip link set up dev tap1.4.6 # se levanta la interfaz tap1.4.6
echo Se levantan las interfaces de ns1.5
ip netns exec ns1.5 ip link set up dev lo
ip netns exec ns1.5 ip link set up dev tap1.5.3 # se levanta la interfaz tap1.5.3
echo Se levantan las interfaces de ns1.6
ip netns exec ns1.6 ip link set up dev lo
ip netns exec ns1.6 ip link set up dev tap1.6.4 # se levanta la interfaz tap1.6.4

echo Se configuran los namespace para que hagan forwarding en IPv6
ip netns exec ns1.1 sysctl -w net.ipv6.conf.all.forwarding=1
ip netns exec ns1.2 sysctl -w net.ipv6.conf.all.forwarding=1
ip netns exec ns1.3 sysctl -w net.ipv6.conf.all.forwarding=1
ip netns exec ns1.4 sysctl -w net.ipv6.conf.all.forwarding=1

#Ruteo estático ns1.1
echo Ruteo estático interno ns1.1
ip netns exec ns1.1 ip -6 route add ${RED135}/64 via ${IPV6_TAP131} dev tap1.1.3 # para llegar a la red 1.3.5
ip netns exec ns1.1 ip -6 route add ${RED146}/64 via ${IPV6_TAP141} dev tap1.1.4 # para llegar a la red 1.4.6
ip netns exec ns1.1 ip -6 route add ${RED134}/64 via ${IPV6_TAP131} dev tap1.1.3 # para llegar a la red 1.3.4
ip netns exec ns1.1 ip -6 route add ${RED12AB}/64 via ${IPV6_TAP121} dev tap1.1.2 # para llegar a la red 1.2.ab
echo Ruteo estático externo ns1.1
####################REEMPLAZAR ${IPV6_BRIDGE_EXTERNO} POR ${IPV6_TAP21br} CUANDO ESTE TODO LISTO!!!##########################################################
ip netns exec ns1.1 ip -6 route add ${RED212}/64 via ${IPV6_TAP21br} dev tap1.1.br # para llegar a la red 2.1.2 
ip netns exec ns1.1 ip -6 route add ${RED213}/64 via ${IPV6_TAP21br} dev tap1.1.br # para llegar a la red 2.1.3
ip netns exec ns1.1 ip -6 route add ${RED214}/64 via ${IPV6_TAP21br} dev tap1.1.br # para llegar a la red 2.1.4
ip netns exec ns1.1 ip -6 route add ${RED22AB}/64 via ${IPV6_TAP21br} dev tap1.1.br # para llegar a la red 2.2.ab
ip netns exec ns1.1 ip -6 route add ${RED234}/64 via ${IPV6_TAP21br} dev tap1.1.br # para llegar a la red 2.3.4
ip netns exec ns1.1 ip -6 route add ${RED235}/64 via ${IPV6_TAP21br} dev tap1.1.br # para llegar a la red 2.3.5
ip netns exec ns1.1 ip -6 route add ${RED246}/64 via ${IPV6_TAP21br} dev tap1.1.br # para llegar a la red 2.4.6
#Ruteo estático ns1.2
echo Ruteo estático interno ns1.2
ip netns exec ns1.2 ip -6 route add ${RED113}/64 via ${IPV6_TAP112} dev tap1.2.1 # para llegar a la red 1.1.3
ip netns exec ns1.2 ip -6 route add ${RED114}/64 via ${IPV6_TAP112} dev tap1.2.1 # para llegar a la red 1.1.4
ip netns exec ns1.2 ip -6 route add ${RED135}/64 via ${IPV6_TAP112} dev tap1.2.1 # para llegar a la red 1.3.5
ip netns exec ns1.2 ip -6 route add ${RED146}/64 via ${IPV6_TAP112} dev tap1.2.1 # para llegar a la red 1.4.6
ip netns exec ns1.2 ip -6 route add ${RED134}/64 via ${IPV6_TAP112} dev tap1.2.1 # para llegar a la red 1.3.4
echo Ruteo estático externo ns1.2
ip netns exec ns1.2 ip -6 route add ${REDABC}/64 via ${IPV6_TAP112} dev tap1.2.1 # para llegar a la red a.b.c 
ip netns exec ns1.2 ip -6 route add ${RED212}/64 via ${IPV6_TAP112} dev tap1.2.1 # para llegar a la red 2.1.2 
ip netns exec ns1.2 ip -6 route add ${RED213}/64 via ${IPV6_TAP112} dev tap1.2.1 # para llegar a la red 2.1.3
ip netns exec ns1.2 ip -6 route add ${RED214}/64 via ${IPV6_TAP112} dev tap1.2.1 # para llegar a la red 2.1.4
ip netns exec ns1.2 ip -6 route add ${RED22AB}/64 via ${IPV6_TAP112} dev tap1.2.1 # para llegar a la red 2.2.ab
ip netns exec ns1.2 ip -6 route add ${RED234}/64 via ${IPV6_TAP112} dev tap1.2.1 # para llegar a la red 2.3.4
ip netns exec ns1.2 ip -6 route add ${RED235}/64 via ${IPV6_TAP112} dev tap1.2.1 # para llegar a la red 2.3.5
ip netns exec ns1.2 ip -6 route add ${RED246}/64 via ${IPV6_TAP112} dev tap1.2.1 # para llegar a la red 2.4.6
#Ruteo estático ns1.3
echo Ruteo estático interno ns1.3
ip netns exec ns1.3 ip -6 route add ${RED146}/64 via ${IPV6_TAP143} dev tap1.3.4 # para llegar a la red 1.4.6
ip netns exec ns1.3 ip -6 route add ${RED114}/64 via ${IPV6_TAP143} dev tap1.3.4 # para llegar a la red 1.1.4
ip netns exec ns1.3 ip -6 route add ${RED112}/64 via ${IPV6_TAP113} dev tap1.3.1 # para llegar a la red 1.1.2
ip netns exec ns1.3 ip -6 route add ${RED12AB}/64 via ${IPV6_TAP113} dev tap1.3.1 # para llegar a la red 1.2.ab
echo Ruteo estático externo ns1.3
ip netns exec ns1.3 ip -6 route add ${REDABC}/64 via ${IPV6_TAP113} dev tap1.3.1 # para llegar a la red a.b.c
ip netns exec ns1.3 ip -6 route add ${RED212}/64 via ${IPV6_TAP113} dev tap1.3.1 # para llegar a la red 2.1.2 
ip netns exec ns1.3 ip -6 route add ${RED213}/64 via ${IPV6_TAP113} dev tap1.3.1 # para llegar a la red 2.1.3
ip netns exec ns1.3 ip -6 route add ${RED214}/64 via ${IPV6_TAP113} dev tap1.3.1 # para llegar a la red 2.1.4
ip netns exec ns1.3 ip -6 route add ${RED22AB}/64 via ${IPV6_TAP113} dev tap1.3.1 # para llegar a la red 2.2.ab
ip netns exec ns1.3 ip -6 route add ${RED234}/64 via ${IPV6_TAP113} dev tap1.3.1 # para llegar a la red 2.3.4
ip netns exec ns1.3 ip -6 route add ${RED235}/64 via ${IPV6_TAP113} dev tap1.3.1 # para llegar a la red 2.3.5
ip netns exec ns1.3 ip -6 route add ${RED246}/64 via ${IPV6_TAP113} dev tap1.3.1 # para llegar a la red 2.4.6
#Ruteo estático ns1.4
echo Ruteo estático interno ns1.4
ip netns exec ns1.4 ip -6 route add ${RED135}/64 via ${IPV6_TAP134} dev tap1.4.3 # para llegar a la red 1.3.5
ip netns exec ns1.4 ip -6 route add ${RED113}/64 via ${IPV6_TAP134} dev tap1.4.3 # para llegar a la red 1.1.3
ip netns exec ns1.4 ip -6 route add ${RED112}/64 via ${IPV6_TAP114} dev tap1.4.1 # para llegar a la red 1.1.2
ip netns exec ns1.4 ip -6 route add ${RED12AB}/64 via ${IPV6_TAP114} dev tap1.4.1 # para llegar a la red 1.2.ab
echo Ruteo estático externo ns1.4
ip netns exec ns1.4 ip -6 route add ${REDABC}/64 via ${IPV6_TAP114} dev tap1.4.1 # para llegar a la red a.b.c
ip netns exec ns1.4 ip -6 route add ${RED212}/64 via ${IPV6_TAP114} dev tap1.4.1 # para llegar a la red 2.1.2 
ip netns exec ns1.4 ip -6 route add ${RED213}/64 via ${IPV6_TAP114} dev tap1.4.1 # para llegar a la red 2.1.3
ip netns exec ns1.4 ip -6 route add ${RED214}/64 via ${IPV6_TAP114} dev tap1.4.1 # para llegar a la red 2.1.4
ip netns exec ns1.4 ip -6 route add ${RED22AB}/64 via ${IPV6_TAP114} dev tap1.4.1 # para llegar a la red 2.2.ab
ip netns exec ns1.4 ip -6 route add ${RED234}/64 via ${IPV6_TAP114} dev tap1.4.1 # para llegar a la red 2.3.4
ip netns exec ns1.4 ip -6 route add ${RED235}/64 via ${IPV6_TAP114} dev tap1.4.1 # para llegar a la red 2.3.5
ip netns exec ns1.4 ip -6 route add ${RED246}/64 via ${IPV6_TAP114} dev tap1.4.1 # para llegar a la red 2.4.6

echo Se modifica MTU de la interfaz tap1.1.br del ns1.1 a 500
ip netns exec ns1.1 ifconfig tap1.1.br mtu 1280

echo Se crea el bridge 
brctl addbr br-externo
echo Al bridge se le agraga una interfaz llamada br-tap1.1.br y ${INTERFAZ_FISICA}
brctl addif br-externo br-tap1.1.br
brctl addif br-externo ${INTERFAZ_FISICA}
#echo Se baja la interfaz fisica
#ifconfig ${INTERFAZ_FISICA} down
ip link set dev br-externo up #se levanta el bridge 
echo Se levanta la interfaz del bridge
ip link set dev br-tap1.1.br up # se levanta la interfaz br-tap1.1.br
#echo Se sube la interfaz fisica
#ifconfig ${INTERFAZ_FISICA} up
echo Se asigna una ip al bridge
ip address add ${IPV6_BRIDGE_EXTERNO}/64 dev br-externo
 
