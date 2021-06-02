#! /bin/sh
# Gen TEC TMA

cat <<EOF >TEC.tma
#===============================================================
# TEC.tma
#===============================================================
EOF

sed -e 's/@PARTNO@/1/; s/@CHANNEL@/LTE/g; s/@DESC@/Laser TEC/; s/@IDLE@/\nState TEC_LTE_Idle {}\n/' TEC0.tma >>TEC.tma
sed -e 's/@PARTNO@/2/; s/@CHANNEL@/LPV/g; s/@DESC@/LPV TEC/; s/@IDLE@//' TEC0.tma >>TEC.tma
sed -e 's/@PARTNO@/3/; s/@CHANNEL@/Plate/g; s/@DESC@/Plate TEC/; s/@IDLE@//' TEC0.tma >>TEC.tma
sed -e 's/@PARTNO@/4/; s/@CHANNEL@/Cover/g; s/@DESC@/Cover TEC/; s/@IDLE@//' TEC0.tma >>TEC.tma
sed -e 's/@PARTNO@/5/; s/@CHANNEL@/Cell/g; s/@DESC@/Cell Temp/; s/@IDLE@//' TEC0.tma >>TEC.tma
sed -e 's/@PARTNO@/6/; s/@CHANNEL@/DPV/g; s/@DESC@/DPV TEC/; s/@IDLE@//' TEC0.tma >>TEC.tma
sed -e 's/@PARTNO@/7/; s/@CHANNEL@/BubC/g; s/@DESC@/Bubbler TEC/; s/@IDLE@//' TEC0.tma >>TEC.tma
