% function to create a vocabulary from multiple text files under folders

function feat_vec = cse408_bow(filepath, voc)
[fid, msg] = fopen(filepath, 'rt');
error(msg);
line = fgets(fid); % Get the first line from
 % the file.
feat_vec = zeros(size(voc)); %Initialize the feature vector'

while line ~= -1

    %PUT YOUR IMPLEMENTATION HERE
    content = {};
    while 1
        [token, remain] = strtok(line); % use strtok() to get the first word in current line
        if strcmp(token,'') == 1 % if token is empty, it implies that there is no remaining token to read
            break;
        end
        content{end + 1} = char(token);
        line = remain;
    end


    % traverse content in the line and then count how many times they
    % occur.
    for a = 1:length(voc)
        count = feat_vec(a);
        for b = 1:length(content)
               if strcmp(voc(a),content(b)) == 1
                    count = count + 1;
               end
        end
        feat_vec(a) = count;
    end
    line = fgets(fid); %keep reading the rest lines.
end
fclose(fid);
%disp(bagofwords)
end
