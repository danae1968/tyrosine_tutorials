% trials=cell(1,4);
% for i=1:4
%     trials{i}=randi(3,[36,4])-1
%     
% end

Ignore=zeros(9,4);
No_Inter=ones(9,4);
Update=No_Inter+1;
runs=[Ignore;No_Inter;Update];

trials=cell(1,4);
for i=1:4
    trials{i}=Shuffle(runs)
end


