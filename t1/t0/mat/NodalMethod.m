close all
clear all
clc

pkg load symbolic
G1=vpa(1/1004.8257256262905)
G2=vpa(1/2032.8619064870104)
G3=vpa(1/3117.854349667399) 
G4=vpa(1/4110.168347468018)
G5=vpa(1/3136.2898714052836) 
G6=vpa(1/2097.4169217171297)
G7=vpa(1/1031.4258704679073)
Va =vpa(5.147931491661591)
Id =vpa(0.0010417824527867048)
Kb =vpa(0.007197203244397765)
Kc =vpa(8178.07176177153 )
Z=vpa(0)
o=vpa(1)

A=[-G1, G1+G2+G3, -G2, Z, -G3, Z, Z;
    Z, -Kb-G2, G2, Z, Kb, Z, Z;
    Z, Kb, Z, G5, -Kb-G5, Z, Z;
    Z, Z, Z, Z, Z, -G7, G6+G7;
    o, Z, Z, Z, Z, Z, Z;
    Z, Z, Z, Z, o, -o, Kc*G6;
    -G1, G2+G1, -G2, -G5, G4+G5, G7, -G7]

B=[Z; Z; Id;Z; Va; Z;-Id]

C=A\B


Vc =C(5)-C(6)

Ic=Vc/Kc
Ic=-C(7)*G6

Vb=C(2)-C(5)

Ib=Vb*Kb
Ib=(C(3)-C(2))*G2

fileID=fopen('Node_tab.tex','w')
fprintf(fileID, "$V_1$ & %.10f \\\\ \\hline\n", double(C(1))) 
fprintf(fileID, "$V_2$ & %.10f \\\\ \\hline\n", double(C(2))) 
fprintf(fileID, "$V_3$ & %.10f \\\\ \\hline\n", double(C(3))) 
fprintf(fileID, "$V_4$ & %.10f \\\\ \\hline\n", double(C(4)))
fprintf(fileID, "$V_5$ & %.10f \\\\ \\hline\n", double(C(5)))  
fprintf(fileID, "$V_6$ & %.10f \\\\ \\hline\n", double(C(6))) 
fprintf(fileID, "$V_7$ & %.10f \\\\ \\hline\n", double(C(7))) 
fprintf(fileID, "$V_B$ & %.10f \\\\ \\hline\n", double(Vb)) 
fprintf(fileID, "$V_C$ & %.10f \\\\ \\hline\n", double(Vc)) 
fprintf(fileID, "$I_B$ & %.10f \\\\ \\hline\n", double(Ib)) 
fprintf(fileID, "$I_C$ & %.10f \\\\ \\hline\n", double(Ic)) 
fclose(fileID)




