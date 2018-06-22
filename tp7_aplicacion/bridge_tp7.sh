#!bin/bash
if [ $1 ]; then # Se verifica que se ingrese el parametro nombre del bridge
 	bridge=$1
else

	echo "Se espera parametro nombre de bridge "
	echo "Ejemplo: ./bridge_tp7.sh <nombre_bridge>"
 	exit 1
fi

#se configura la interfaz fisica para que no tenga direccion de IPv6
#se borra las ip de los bridges 
sudo ip addr del 2001:b1b2::1/64 dev $bridge  #br-c929df299b74
#se agrega una nueva ip al bridge para que no sea la misma que tiene el vecino
sudo ip addr add 2001:b1b2::11/64 dev $bridge #br-c929df299b74
#se monta el bridge en la interfaz fisica
sudo brctl addif $bridge enp0s3
