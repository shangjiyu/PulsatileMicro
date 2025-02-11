% Plot velocity of capillary with A-V generation
clear;clc;close all;
[num1 txt1 raw1]=xlsread('A-V Vel.xlsx','A7:D16');
figure;hold on;
plot(num1(1:end-1,1),num1(1:end-1,4),'ko-','LineWidth',2,'MarkerSize',8);
[num2 txt2 raw2]=xlsread('546_Results.xlsx','B165:S331');
Gen=num2(:,4);
Hd=num2(:,3);
D=num2(:,1);
GenPlotInd=find(Gen~=0);
GenPlot=Gen(GenPlotInd);
Vel1DAdapVisc0=num2(GenPlotInd,15);
Vel1DAdapVisc1=num2(GenPlotInd,16);
Vel1DAdapVisc2=num2(GenPlotInd,17);
VelExp=num2(GenPlotInd,18);
% VelExp=VelExp./(Hd(GenPlotInd)+(1-Hd(GenPlotInd)).*(1+1.7.*exp(-0.415.*D(GenPlotInd))-0.6.*exp(-0.011.*D(GenPlotInd))));
Vel0DAdapSelfVisc=num2(GenPlotInd,9);
Vel0DAdapSelfHd=num2(GenPlotInd,7);
x=min(GenPlot):max(GenPlot);
% x=min(GenPlot)+1:2:max(GenPlot)+1;
for i=1:length(x)
%     ind=find((GenPlot==x(i)) + (GenPlot==x(i)-1));
    ind=(GenPlot==x(i));
    disp(length(find(ind)));
    y1(i)=mean(Vel1DAdapVisc0(ind));
%     y2(i)=mean(Vel1DAdapVisc1(ind));
    y3(i)=mean(Vel1DAdapVisc2(ind));
%     y4(i)=mean(Vel0DAdapVisc2(ind));
%     y5(i)=mean(Vel0DAdapVisc0(ind));
    y6(i)=mean(Vel0DAdapSelfVisc(ind));
    y7(i)=mean(Vel0DAdapSelfHd(ind));
    y8(i)=mean(VelExp(ind));
end
plot(x,y1,'s--','LineWidth',2,'MarkerSize',8);
% plot(x,y2,'kd-.','LineWidth',2,'MarkerSize',8);
plot(x,y3,'^:','LineWidth',2,'MarkerSize',8);
% plot(x,y4,'r.-','LineWidth',2,'MarkerSize',8);
% plot(x,y5,'go-','LineWidth',2,'MarkerSize',8);
plot(x,y6,'rx-','LineWidth',2,'MarkerSize',8);
plot(x,y7,'ro-','LineWidth',2,'MarkerSize',8);
plot(x,y8,'x-','LineWidth',2,'MarkerSize',8);
xlabel('Generation');
ylabel('Velocity(mm/s)');
% legend('Exp','Visc_{fix}','Visc_{\it{invitro}}','Visc_{\it{invivo}}');
xlim([2 22]);
