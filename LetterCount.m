function LetterCount = count(filename,A)
fid = fopen(filename,'rt');
if fid < 0
    LetterCount = -1;
    return
end
if fid >0 && ischar(A)
    r=0;
    readline = fgets(fid);
    while ischar(readline)
        r = r + count(readline,A)+count(readline,upper(A));
        readline = fgets(fid);
    end
    LetterCount = r;
else 
    LetterCount = -1;
end
fclose(fid);