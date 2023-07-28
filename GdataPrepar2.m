

NGd=[];
NGd(1)=0;
for k=1:n-1
bb=Gd(k+1)-Gd(k);
% if Gd2(k)~=0
% end
if bb>0
    NGd(k+1)=1;
else
    NGd(k+1)=-1;   
end
end

NGd=NGd';
% NGd(k+1)=[];

%%%%%%%%%%%%%%%%%%%%%%%%%%%

% EGd2=[];
% EGd2(1)=0;
% for k=1:2380
% bb=Gd2(k+1)-Gd2(k);
% % if Gd2(k)~=0
% % end
% if bb>0
%     EGd2(k+1)=bb;
% else
%     EGd2(k+1)=bb;   
% end
% end
% 
% EGd2=EGd2';

%%%%%%%%%%%%%%%%%%%%%%%%%%%

% EEGd2=[];
% EEGd2(1)=0;
% for k=1:2380
% bb=Gd2(k+1)-Gd2(k);
% 
%     EEGd2(k+1)=EEGd2(k)+bb;
%     
% end
% 
% EEGd2=EEGd2';

%%%%%%%%%%%%%%%%%%%%%%%%%%%

MGd=[];
MGd(1)=0;
for k=1:n-1
bb=Gd(k+1)-Gd(k);

if Gd(k)==0
end

if bb>0
    MGd(k+1) = 0.5;
    if k>1
        if Gd(k)>Gd(k-1);
        MGd(k+1)=MGd(k)+0.5;
        end
    end
end
if bb<0
    MGd(k+1) = -0.5;
    if k>1
        if Gd(k)<Gd(k-1);
        MGd(k+1)=MGd(k)-0.5;
        end
    end
end
end


MGd=MGd';
% MGd(k+1)=[];

%%%%%%%%%%%%%%%%%%%%%%%%%%%

% MMGd2=[];
% MMGd2(1)=0;
% for k=1:2380
% bb=Gd2(k+1)-Gd2(k);
% 
% if Gd2(k)==0
% end
% 
% if bb>0
%     MMGd2(k+1) = MMGd2(k)+0.5;
% end
% 
% if bb==0
%     MMGd2(k+1) = MMGd2(k);
% end
% 
% if bb<0
%     MMGd2(k+1) = MMGd2(k)-0.5;
% end
% end
% 
% MMGd2=MMGd2';

