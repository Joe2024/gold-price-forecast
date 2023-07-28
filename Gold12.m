
GoldData=input('pls input a matrix=');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%>>>>>>>> Prepare Data

[n,m]=size(GoldData);
Gd=GoldData(n-122:n,:);
[n,m]=size(Gd);
run('GdataPrepar2.m')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%>>>>>>>> 3 input
real=[];
% FC1=[];FC2=[];FC3=[];
% pk1=[];sk1=[];
pkk1=[];skk1=[];


for i=0:11
u=[Gd(n-102:n-3),Gd(n-101:n-2),Gd(n-100:n-1)];
y=MGd(n-99:n);
data= iddata(y,u,1);  %constructs iddata object
try
   MN1 =nlarx(data,[1 [2 2 2] [0 0 1]],sigmoidnet('Num',10));
   MN2 =nlarx(data,[2 [2 2 2] [0 0 1]],sigmoidnet('Num',10));
   MN3 =nlarx(data,[3 [3 3 3] [0 0 1]],sigmoidnet('Num',10));
   MN4 =nlarx(data,[1 [2 2 2] [0 0 1]],wavenet);
   MN5 =nlarx(data,[2 [2 2 2] [0 0 1]],wavenet);
   MN6 =nlarx(data,[2 [2 2 2] [0 0 1]],wavenet);
   MN7 =nlhw(data,[[2 2 2] [3 3 3] [1 1 1]],sigmoidnet('num',10),sigmoidnet('num',10));
   MN8 =nlhw(data,[[3 3 3] [3 3 3] [1 1 1]],sigmoidnet('num',10),sigmoidnet('num',10));
   MN9 =nlhw(data,[[2 2 2] [3 3 3] [0 0 0]],sigmoidnet('num',10),sigmoidnet('num',10));
   MN10=nlhw(data,[[3 3 3] [3 3 3] [0 0 0]],sigmoidnet('num',10),sigmoidnet('num',10));
catch err
if (strcmp(err.identifier,'MATLAB:svd:svdNoConvergence'))
    msg = sprintf('%s','Use bigger data range.');
end
end

MN=struct('M',{MN1;MN2;MN3;MN4;MN5;MN6;MN7;MN8;MN9;MN10});
% FC1(i)=MN1.EstimationInfo.LossFcn;FC2(i)=MN2.EstimationInfo.LossFcn;FC3(i)=MN3.EstimationInfo.LossFcn;

in=[Gd(n-101:n-2),Gd(n-100:n-1),Gd(n-99:n)];
out=[MGd(n-109:n-11)+i;0];
% out2=out;
[n,m]=size(out);
out(n,:)=0;                       %>>> NOTE <<< for data number 2076+i:2115+i
XX = iddata(out, in, 1);

mout1=[];
for p=1:10
    MO=(MN(p,1).M);
    mout11=predict(MO,XX,1);
    mout1(:,p)=mout11.OutputData;
end

% run('KOUTp.m')  %ModelOutput-RealOutput
run('KKOUTp.m') %Make ModelOutput=+0.5-0.5
run('pkk_new.m')%SimResult

mout2=[];
for p=1:10
    MO=(MN(p,1).M);
    [X1,U1,REPORT1] = findop(MO,'steady',[in(1,1),in(1,2),in(1,3)],NaN);
    if p<=6
       Simout=sim('GoldNARX3','StopTime', 'n');
    else
       Simout=sim('GoldHM4','StopTime', 'n');
    end
    mout2(:,p)=Simout.get('mout2');
end
mout2(1,:)=[];

% run('KOUTs.m')
run('KKOUTs.m')
run('skk_new.m')%PredictResult

end


real=NGd(2115+(l+1):2115+(l+i));
% real(1:l)=[];real=real';
% pk1(1:l,:)=[];sk1(1:l,:)=[];
pkk1(1:l,:)=[];skk1(1:l,:)=[];

for j=1:10
    for e=1:(i-l)
erp1(e,j)=real(e,1)-pkk1(e,j);
    end
end
for j=1:10
    for e=1:(i-l)
ers1(e,j)=real(e,1)-skk1(e,j);
    end
end

erT1=[erp1,ers1];

run('perp.m')
run('pers.m')
Percent1=[perp1,pers1];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%>>>>>>>> 4 input
real=[];
% FC1=[];FC2=[];FC3=[];
% pk1=[];sk1=[];
pkk1=[];skk1=[];

l=22;
for i=23:44
u=[Gd(2011+i:2110+i),Gd(2012+i:2111+i),Gd(2013+i:2112+i),Gd(2014+i:2113+i)];
y=MGd(2015+i:2114+i);
data= iddata(y,u,1);  %constructs iddata object
try
   MN1 =nlarx(data,[1 [2 2 2 2] [0 0 0 1]],sigmoidnet('Num',10));
   MN2 =nlarx(data,[2 [2 2 2 2] [0 0 0 1]],sigmoidnet('Num',10));
   MN3 =nlarx(data,[3 [3 3 3 3] [0 0 0 1]],sigmoidnet('Num',10));
   MN4 =nlarx(data,[1 [2 2 2 2] [0 0 0 1]],wavenet);
   MN5 =nlarx(data,[2 [2 2 2 2] [0 0 0 1]],wavenet);
   MN6 =nlarx(data,[2 [2 2 2 2] [0 0 0 1]],wavenet);
   MN7 =nlhw(data,[[2 2 2 2] [3 3 3 3] [1 1 1 1]],sigmoidnet('num',10),sigmoidnet('num',10));
   MN8 =nlhw(data,[[3 3 3 3] [3 3 3 3] [1 1 1 1]],sigmoidnet('num',10),sigmoidnet('num',10));
   MN9 =nlhw(data,[[2 2 2 2] [3 3 3 3] [0 0 0 0]],sigmoidnet('num',10),sigmoidnet('num',10));
   MN10=nlhw(data,[[3 3 3 3] [3 3 3 3] [0 0 0 0]],sigmoidnet('num',10),sigmoidnet('num',10));
catch err
if (strcmp(err.identifier,'MATLAB:svd:svdNoConvergence'))
    msg = sprintf('%s','Use bigger data range.');
end
end

MN=struct('M',{MN1;MN2;MN3;MN4;MN5;MN6;MN7;MN8;MN9;MN10});
% FC4(i)=MN1.EstimationInfo.LossFcn;FC5(i)=MN2.EstimationInfo.LossFcn;FC6(i)=MN3.EstimationInfo.LossFcn;

in=[Gd(2012+i:2111+i),Gd(2013+i:2112+i),Gd(2014+i:2113+i),Gd(2015+i:2114+i)];
out=MGd(2016+i:2115+i);
% out2=out;
[n,m]=size(out);
out(n,:)=0;                        %>>> NOTE <<< for data number 2076+i:2115+i
XX = iddata(out, in, 1);

mout1=[];
for p=1:10
    MO=(MN(p,1).M);
    mout11=predict(MO,XX,1);
    mout1(:,p)=mout11.OutputData;
end

run('KOUTp.m')  %ModelOutput-RealOutput
run('KKOUTp.m') %Make ModelOutput=+0.5-0.5
run('pkk_new.m')%SimResult

mout2=[];
for p=1:10
    MO=(MN(p,1).M);
    [X1,U1,REPORT1] = findop(MO,'steady',[in(1,1),in(1,2),in(1,3),in(1,4)],NaN);
    if p<=6
       Simout=sim('GoldNARX3','StopTime', 'n');
    else
       Simout=sim('GoldHM4','StopTime', 'n');
    end
    mout2(:,p)=Simout.get('mout2');
end
% mout2(n+1,:)=[]; %<<<<<<<<<<<<<< deleting last  row !!!
mout2(1,:)=[];   %<<<<<<<<<<<<<< deleting first row !!!

run('KOUTs.m')
run('KKOUTs.m')
run('skk_new.m')%PredictResult

end


real=NGd(2115+(l+1):2115+(l+i));
% real(1:l)=[];real=real';
% pk1(1:l,:)=[];sk1(1:l,:)=[];
pkk1(1:l,:)=[];skk1(1:l,:)=[];

for j=1:10
    for e=1:(i-l)
erp2(e,j)=real(e,1)-pkk1(e,j);
    end
end
for j=1:10
    for e=1:(i-l)
ers2(e,j)=real(e,1)-skk1(e,j);
    end
end

erT2=[erp2,ers2];

run('perp.m')
run('pers.m')
Percent2=[perp1,pers1];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%>>>>>>>> result


erT=[erT1,erT2];

Percent=[Percent1,Percent2];
% err=[er1,er2];

result=[Percent;erT];
[Bm,Nm]=min(erT);

