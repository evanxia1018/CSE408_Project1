% function to create a vocabulary from multiple text files under folders

function feat_vec = cse408_bow(filepath, voc)
[fid, msg] = fopen(filepath, 'rt');
error(msg);
line = fgets(fid); % Get the first line from
 % the file.
feat_vec = zeros(size(voc)); %Initialize the feature vector'

while line ~= -1

    %PUT YOUR IMPLEMENTATION HERE
    %compare list of words in "voc" to "feat_vec"
    
    
        %parse the text file for string values
        tline=textscan(fid,'%s')
        %store the string values in cell array
        lexicons=tline{1}
        %identify the unique words and store in matrix
        [x,y,z]=unique(lexicons);
        %store only the unique names from filepath
        compthis=[x];
        %convert to all lowercase for proper comparison
        newcompthis = lower(compthis);
        newvoc = lower(voc);
        
        bagofwords = any(ismember(newvoc, newcompthis));
      
    
end
fclose(fid);
disp(bagofwords)
end
