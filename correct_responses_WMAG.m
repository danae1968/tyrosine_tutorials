%variables for behavioral analysis of s02d02: correct, rt, trialmem (0=ignore; 1=no interference; 2 = update)
%--> write script that 1)computes total correct & rts and 2) correct & rts per condition,
%3) plot correct & rts in bar graph + label & axes labels
function correct_responses_WMAG
% subs=[333];
% n=length(subs);
% 
% session=2;
% fmriMode=1;
% subs=2;
% 
% for i=1:n
%     if fmriMode==0
%         filename=sprintf('WMAG_data_s%d_session_%d.mat',subs(i),session);
%     else fmriMode==1
%         filename=sprintf('WMAG_FMRI_data_s%d_session_%d.mat',subs(i),session);
%     end
%     
%     load filename
% use numconditions*trial instead?

load 'WMAG_FMRI_data_s2_session_2.mat'

mean_correct_total=sum(correct(:))/(size(correct,1)*size(correct,2));
mean_correct_percentage=(mean_correct_total)*100;

mean_rt_total=sum(rt(:))/(size(rt,1)*size(rt,2));
mean_rt_percentage=(mean_rt_total)*100;

ignore=[];
no_inter=[];
update=[];

for i=1:size(trialmem,1)*size(trialmem,2);
    %alternatively switch a(i) case
    if trialmem(i)==0;
        ignore=[ignore,i];
    elseif trialmem(i)==1
        no_inter=[no_inter,i];
    elseif trialmem(i)==2;
        update=[update,i];
    end
end
mean_correct_ignore=sum(correct(ignore))/length(ignore);
mean_correct_no_inter=sum(correct(no_inter))/length(no_inter);
mean_correct_update=sum(correct(update))/length(update);

mean_rt_ignore=sum(rt(ignore))/length(ignore);
mean_rt_no_inter=sum(rt(no_inter))/length(no_inter);
mean_rt_update=sum(rt(update))/length(update);
%can I add subs instead of subNo?
fprintf('Subject %d answered correctly overall on %.2f %% of cases and their mean RT overall was %.4f.  Their mean score for ignore trials was %.2f and RT %.4f, no interference %.2f and RT %.4f and update %.2f and RT %.4f\n', subNo,  mean_correct_total, mean_rt_total, mean_correct_ignore, mean_rt_ignore, mean_correct_no_inter, mean_rt_no_inter, mean_correct_update, mean_rt_update)
%can this work with a cell array?
data_correct=[mean_correct_total mean_correct_ignore mean_correct_no_inter mean_correct_update];
 figure;
 bar(data_correct)
 set(gca, 'XTickLabel', {'Overall','Ignore','No Interference','Update'})
  ylabel('Percentage correct');
  title('Day 2, subject 2, Responses');
  
data_rt=[mean_rt_total mean_rt_ignore mean_rt_no_inter mean_rt_update];
 figure;
 bar(data_rt)
 set(gca, 'XTickLabel', {'Overall','Ignore','No Interference','Update'})
  ylabel('RT');
  title('Day 2, subject 2, Reaction Times');
end

  
       
             
