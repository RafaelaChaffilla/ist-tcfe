close all
clear all
clc

pkg load symbolic
R1=vpa(1.00482572563e3)
R2=vpa(2.03286190649e3)
R3=vpa(3.11785434967e3) 
R4=vpa(4.11016834747e3)
R5=vpa(3.13628987141e3) 
R6=vpa(2.09741692172e3)
R7=vpa(1.03142587047e3)
Va =vpa(5.1479314917)
Id =vpa(1.04178245279e-3)
Kb =vpa(7.1972032444e-3)
Kc =vpa(8.17807176177e3)
Z=vpa(0)
o=vpa(1)

A=[R4+R3+R1, -R3, -R4, Z;-R4, Z, R4+R6+R7-Kc, Z; -R3*Kb, Kb*R3-o, Z, Z; Z,Z,Z,o] 
B=[-Va; Z; Z; Id]

C=A\B

Ic=C(3)
Vc=Kc*C(3)

Ib=C(2)

Vb=(-C(1)+Ib)*R3
Vb=Ib/Kb

fileID=fopen('Mesh_tab.tex','w')
fprintf(fileID, "$I_A$ & %.10f \\\\ \\hline\n", double(C(1))) 
fprintf(fileID, "$I_B$ & %.10f \\\\ \\hline\n", double(C(2))) 
fprintf(fileID, "$I_C$ & %.10f \\\\ \\hline\n", double(C(3))) 
fprintf(fileID, "$I_D$ & %.10f \\\\ \\hline\n", double(C(4))) 
fprintf(fileID, "$V_B$ & %.10f \\\\ \\hline\n", double(Vb)) 
fprintf(fileID, "$V_C$ & %.10f \\\\ \\hline\n", double(Vc)) 
fclose(fileID)





