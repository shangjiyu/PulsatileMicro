% ����ѹ���� %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function PO2=Hill(SO2)

P50=38; %38mmHg
N=3;
PO2=P50*(SO2/(1-SO2)).^(1/N);

end