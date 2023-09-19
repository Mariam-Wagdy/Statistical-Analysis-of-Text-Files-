function [Y, maxfreq]=max5 (freq)
[maxfreq,index]=maxk(freq,5);
disp(transpose(maxfreq));
aspacez={'a   ','b   ','c   ','d   ','e   ','f   ','g   ','h   ','i   ','j   ','k   ','l   ','m   ','n   ','o   ','p   ','q   ','r   ','s   ','t   ','u   ','v   ','w   ','x   ','y   ','z   '};
aspacez=transpose(aspacez);
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
end