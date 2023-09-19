clc;
clear;
s=input('insert file name','s');
AZ='a':'z';
n=1:26;
for k=1:26
  num(k,1)=LetterCount(s,AZ(k));
end
total=sum(num);
%%disp(num);
%%disp("......");
disp(total);
freq=100*num./total;
%%disp("......");
%%disp(freq);
aspacez={'a   ','b   ','c   ','d   ','e   ','f   ','g   ','h   ','i   ','j   ','k   ','l   ','m   ','n   ','o   ','p   ','q   ','r   ','s   ','t   ','u   ','v   ','w   ','x   ','y   ','z   '};
aspacez=transpose(aspacez);
X = cellstr(aspacez);
X = categorical(X);
%%X = reordercats(X,aspacez);
bar(X,freq);
title('Probability in Percentage of Each Letter');

%%%%%%%%%%%%%max 5%%%%%%%%%%%%%%
[maxfreq,index]=maxk(freq,5);
disp(transpose(maxfreq));
for i=1:5
    maxletter(i)=aspacez(index(i));
end
disp(maxletter);
Y = cellstr(maxletter);
Y = categorical(Y);
Y = reordercats(Y);
b = bar(Y,maxfreq);
xtips1 = b(1).XEndPoints;
ytips1 = b(1).YEndPoints;
labels1 = string(b(1).YData);
text(xtips1,ytips1,labels1,'HorizontalAlignment','center',...
    'VerticalAlignment','bottom')
title('Probability in Percentage of the Most Repeated 5 Letters')

%%%%%%%%%%%%%%%%%%%PDF CDF%%%%%%%%%%%%%%%%%
bar(n,freq);
title('PDF of letters');
%%f=sum(freq);
  cumulative(1)=freq(1);
for i=2:length(freq)
    cumulative(i)=cumulative(i-1)+freq(i);
end
%%disp(cumulative);
bar(n,cumulative);
title('CDF of letters');

  mean=0;
  expx2=0;
  expx3=0;
for i=2:26
    mean=mean+freq(i)*n(i);
    expx2=expx2+ (n(i)^(2)*freq(i));
    expx3=expx3+ (n(i)^(3)* freq(i));
end
mean=mean/100;
disp("mean is");
disp(mean);
var=expx2-(mean*mean);
var=var/100;
disp("Variance is");
disp(var);
skew=(expx3-3*mean*var-mean^(3))/var^(3/2);
disp('Skewness is');
disp(skew);
kurt=0;
for i=1:26
    kurt=kurt+((n(i)-mean)/var^(1/2))^(4)*freq(i);
end
disp('Kurtosis is');
disp(kurt);


