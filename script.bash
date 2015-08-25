#!/bin/bash

picker=$1
carrier=$2
worker=$3
visitor=$4
dog=$5
cat=$6
possum=$7
tractor=$8
kiwitree=$9

mkdir -p world/config

rm ugbots_ros/launch/world.launch
rm world/config/robotinstances.inc
rm world/config/peopleinstances.inc
rm world/config/animalinstances.inc
rm world/config/tractorinstances.inc
rm world/config/treeinstances.inc
rm world/config/beaconinstances.inc

echo  \<launch\> > ugbots_ros/launch/world.launch
echo include \"models\/robots.inc\" >> world/config/robotinstances.inc
echo include \"models\/workers.inc\" >> world/config/peopleinstances.inc
echo include \"models\/dogs.inc\" >> world/config/animalinstances.inc
echo include \"models\/cats.inc\" >> world/config/animalinstances.inc
echo include \"models\/possums.inc\" >> world/config/animalinstances.inc
echo include \"models\/visitors.inc\" >> world/config/peopleinstances.inc
echo include \"models\/tractors.inc\" >> world/config/tractorinstances.inc
echo include \"models\/kiwirow.inc\" >> world/config/treeinstances.inc
echo include \"models\/beaconcore.inc\" >> world/config/beaconinstances.inc

number=0
beacon=15
i=0
j=0
w=0
a=0
v=0
d=0
c=0
po=0
t=0
rand=0
rand2=0
tree=0
treenum=0
z=0

#Creating Core Unit
echo \<group ns=\"robot_$number\"\> >> ugbots_ros\/launch\/world.launch
echo \<node pkg=\"ugbots_ros\" name=\"core\" type=\"CORE\"\/\> >> ugbots_ros\/launch\/world.launch 
echo \<\/group\> >> ugbots_ros\/launch\/world.launch

number=$(($number+1))

#creating Beacons
while [ $number -lt $beacon ];
do

echo
echo \<group ns=\"robot_$number\"\> >> ugbots_ros\/launch\/world.launch
echo \<node pkg=\"ugbots_ros\" name=\"beacons\" type=\"BEACON\"\/\> >> ugbots_ros\/launch\/world.launch 
echo \<\/group\> >> ugbots_ros\/launch\/world.launch

number=$(($number+1))
done

#creating picker robots
while [ $i -lt $picker ];
do

echo \<group ns=\"robot_$number\"\> >> ugbots_ros\/launch\/world.launch
echo \<node pkg=\"ugbots_ros\" name=\"robotnode\" type=\"PICKER\"\/\> >> ugbots_ros\/launch\/world.launch 
echo \<\/group\> >> ugbots_ros\/launch\/world.launch

echo pickerRobot\(pose [ -48 $((48-$(($i * 5)))) 0 90 ]\ name \"P$i\" color \"red\"\) >> world/config/robotinstances.inc

i=$(($i+1))
number=$(($number+1))

done

#creating carrier robots
while [ $j -lt $carrier ];
do

echo \<group ns=\"robot_$number\"\> >> ugbots_ros\/launch\/world.launch
echo \<node pkg=\"ugbots_ros\" name=\"robotnode\" type=\"CARRIER\"\/\> >> ugbots_ros\/launch\/world.launch
echo \<\/group\> >> ugbots_ros\/launch\/world.launch

echo carrierRobot\(pose [ -46 $((48-$(($j*5)))) 0 90 ] name \"C$j\" color \"blue\"\) >> world/config/robotinstances.inc

j=$(($j+1))
number=$(($number+1))

done

#creating worker nodes
while [ $w -lt $worker ];
do

rand=$(( (RANDOM % 97) - 46 )) 

if (($rand>=-12 && $rand<=12));
then
    rand3=$(( (RANDOM % 15) - 49 )) 
    rand4=$(( (RANDOM % 15) + 35 ))
    if [ $(( (RANDOM % 2) + 1 )) -lt "2" ];
    then
        rand2=$rand3
    else
        rand2=$rand4
    fi
else
    rand2=$(( (RANDOM % 99) - 48 )) 
fi

echo \<group ns=\"robot_$number\"\> >> ugbots_ros/launch/world.launch
echo \<node pkg=\"ugbots_ros\" name=\"workernode\" type=\"WORKER\"\/\> >> ugbots_ros/launch/world.launch 
echo \<\/group\> >> ugbots_ros/launch/world.launch

#echo worker\(pose [ 0 $((1+$(($w * 2)))) 0 0 ] name \"W$w\" color \"black\" \) >> world/config/peopleinstances.inc
echo worker\(pose [ $rand $rand2 0 0 ] name \"W$w\" color \"black\" \) >> world/config/peopleinstances.inc
w=$(($w+1))
number=$(($number+1))

done

visitorx=50
visitory=-47.5

#creating visitor nodes
while [ $v -lt $visitor ];
do

rand=$visitorx
rand2=$visitory

echo \<group ns=\"robot_$number\"\> >> ugbots_ros/launch/world.launch #### WORKER-> VISITOR
echo \<node pkg=\"ugbots_ros\" name=\"visitornode\" type=\"VISITOR\"\/\> >> ugbots_ros/launch/world.launch 
echo \<\/group\> >> ugbots_ros/launch/world.launch

#echo visitor\(pose [ 3.5 $((1+$(($v * 2)))) 0 0 ] name \"V$v\" color \"pink\" \) >> world/config/peopleinstances.inc
echo visitor\(pose [ $rand $rand2 0 180 ] origin [ 0 0 0 270 ] name \"V$v\" color \"pink\" \) >> world/config/peopleinstances.inc
v=$(($v+1))
number=$(($number+1))
visitorx=$(($rand+5))

done

#creating dogs
while [ $d -lt $dog ];
do

rand=$(( (RANDOM % 97) - 46 )) 

if (($rand>=-12 && $rand<=12));
then
    rand3=$(( (RANDOM % 15) - 49 )) 
    rand4=$(( (RANDOM % 15) + 35 ))
    if [ $(( (RANDOM % 2) + 1 )) -lt "2" ];
    then
        rand2=$rand3
    else
        rand2=$rand4
    fi
else
    rand2=$(( (RANDOM % 99) - 48 )) 
fi 

echo \<group ns=\"robot_$number\"\> >> ugbots_ros/launch/world.launch
echo \<node pkg=\"ugbots_ros\" name=\"dognode\" type=\"DOG\"\/\> >> ugbots_ros/launch/world.launch 
echo \<\/group\> >> ugbots_ros/launch/world.launch

#echo dog\( pose [ 0 $((-1-$(($d * 2)))) 0 0 ] name \"D$d\" color \"brown\" \) >> world/config/animalinstances.inc
echo dog\( pose [ $rand $rand2 0 0 ] name \"D$d\" color \"brown\" \) >> world/config/animalinstances.inc
d=$(($d+1))
number=$(($number+1))

done

#creating possums
while [ $po -lt $possum ];
do

rand=$(( (RANDOM % 97) - 46 )) 

if (($rand>=-12 && $rand<=12));
then
    rand3=$(( (RANDOM % 15) - 49 )) 
    rand4=$(( (RANDOM % 15) + 35 ))
    if [ $(( (RANDOM % 2) + 1 )) -lt "2" ];
    then
        rand2=$rand3
    else
        rand2=$rand4
    fi
else
    rand2=$(( (RANDOM % 99) - 48 )) 
fi

echo \<group ns=\"robot_$number\"\> >> ugbots_ros/launch/world.launch #### DOG -> POSSUM
echo \<node pkg=\"ugbots_ros\" name=\"possumnode\" type=\"POSSUM\"\/\> >> ugbots_ros/launch/world.launch 
echo \<\/group\> >> ugbots_ros/launch/world.launch

#echo possum\( pose [ 3.5 $((-1-$(($c * 2)))) 0 0 ] name \"P$po\" color \"purple\" \) >> world/config/animalinstances.inc
echo possum\( pose [ $rand $rand2 0 0 ] name \"PO$po\" color \"purple\" \) >> world/config/animalinstances.inc

po=$(($po+1))
number=$(($number+1))

done

#creating tractors
while [ $t -lt $tractor ];
do

rand=$(( (RANDOM % 97) - 46 )) 

if (($rand>=-12 && $rand<=12));
then
    rand3=$(( (RANDOM % 15) - 49 )) 
    rand4=$(( (RANDOM % 15) + 35 ))
    if [ $(( (RANDOM % 2) + 1 )) -lt "2" ];
    then
        rand2=$rand3
    else
        rand2=$rand4
    fi
else
    rand2=$(( (RANDOM % 99) - 48 )) 
fi

echo \<group ns=\"robot_$number\"\> >> ugbots_ros/launch/world.launch
echo \<node pkg=\"ugbots_ros\" name=\"tractornode\" type=\"TRACTOR\"\/\> >> ugbots_ros/launch/world.launch 
echo \<\/group\> >> ugbots_ros/launch/world.launch

echo tractor\( pose [ $rand $rand2 0 0 ] name \"T$t\" color \"brown\" \) >> world/config/tractorinstances.inc
t=$(($t+1))
number=$(($number+1))

done

#generating kiwifruit rows

echo point\( pose [ 0 49 0 0 ] name \"V0\" color \"purple\" \) >> world/config/beaconinstances.inc

if (( $kiwitree % 2 )); then
    echo rows \(pose [ 0 -35 -1.002 0 ]\) >> world/config/treeinstances.inc
    treenum=$(($treenum+1))
    tree=$(($tree+1))
    while [ $tree -lt $kiwitree ];
    do
        left=$(echo "scale=2; 0-$treenum*3.5" | bc)
        right=$(echo "scale=2; 0+$treenum*3.5" | bc)
        echo rows \(pose [ $left -35 -1.002 0 ]\) >> world/config/treeinstances.inc
        echo rows \(pose [ $right -35 -1.002 0 ]\) >> world/config/treeinstances.inc

        bleft=$(echo "scale=2; -1.75-$z*3.5" | bc)
        bright=$(echo "scale=2; 1.75+$z*3.5" | bc)
        echo point\( pose [ $bleft 38 0 0 ] name \"V0\" color \"yellow\" \) >> world/config/beaconinstances.inc
        echo point\( pose [ $bright 38 0 0 ] name \"V0\" color \"yellow\" \) >> world/config/beaconinstances.inc
        echo point\( pose [ $bleft -38 0 0 ] name \"V0\" color \"yellow\" \) >> world/config/beaconinstances.inc
        echo point\( pose [ $bright -38 0 0 ] name \"V0\" color \"yellow\" \) >> world/config/beaconinstances.inc
        tree=$(($tree+2))
        treenum=$(($treenum+1))
        z=$(($z+1))
    done
elif ! (( $kiwitree % 2 )); then
    while [ $tree -lt $kiwitree ];
    do
        left=$(echo "scale=2; -1.75-$treenum*3.5" | bc)
        right=$(echo "scale=2; 1.75+$treenum*3.5" | bc)
        echo rows \(pose [ $left -35 -1.002 0 ]\) >> world/config/treeinstances.inc
        echo rows \(pose [ $right -35 -1.002 0 ]\) >> world/config/treeinstances.inc

        bleft=$(echo "scale=2; 0-$z*3.5" | bc)
        bright=$(echo "scale=2; 0+$z*3.5" | bc)
        echo point\( pose [ $bleft 38 0 0 ] name \"V0\" color \"yellow\" \) >> world/config/beaconinstances.inc
        echo point\( pose [ $bright 38 0 0 ] name \"V0\" color \"yellow\" \) >> world/config/beaconinstances.inc
        echo point\( pose [ $bleft -38 0 0 ] name \"V0\" color \"yellow\" \) >> world/config/beaconinstances.inc
        echo point\( pose [ $bright -38 0 0 ] name \"V0\" color \"yellow\" \) >> world/config/beaconinstances.inc
        tree=$(($tree+2))
        treenum=$(($treenum+1))
        z=$(($z+1))
    done
fi

echo  \<\/launch\> >> ugbots_ros/launch/world.launch
