% function to create a vocabulary from multiple text files under folders

function voc = buildVoc(folder, voc)

stopword = {'ourselves', 'hers', 'between', 'yourself', 'but', 'again', 'there', ...
    'about', 'once', 'during', 'out', 'very', 'having', 'with', 'they', 'own', ...
    'an', 'be', 'some', 'for', 'do', 'its', 'yours', 'such', 'into', ...
    'of', 'most', 'itself', 'other', 'off', 'is', 's', 'am', 'or', ...
    'who', 'as', 'from', 'him', 'each', 'the', 'themselves', 'until', ...
    'below', 'are', 'we', 'these', 'your', 'his', 'through', 'don', 'nor', ...
    'me', 'were', 'her', 'more', 'himself', 'this', 'down', 'should', 'our', ...
    'their', 'while', 'above', 'both', 'up', 'to', 'ours', 'had', 'she', 'all', ...
    'no', 'when', 'at', 'any', 'before', 'them', 'same', 'and', 'been', 'have', ...
    'in', 'will', 'on', 'does', 'yourselves', 'then', 'that', 'because', ...
    'what', 'over', 'why', 'so', 'can', 'did', 'not', 'now', 'under', 'he', ...
    'you', 'herself', 'has', 'just', 'where', 'too', 'only', 'myself', ...
    'which', 'those', 'i', 'after', 'few', 'whom', 't', 'being', 'if', ...
    'theirs', 'my', 'against', 'a', 'by', 'doing', 'it', 'how', ...
    'further', 'was', 'here', 'than'}; % define English stop words, from NLTK


files = dir(fullfile(folder,'*.txt'))
globalCounter = length(voc)+1
for file = files'
    [fid, msg] = fopen(fullfile(folder,file.name), 'rt')
    error(msg)
    line = fgets(fid) % Get the first line from
     % the file.
     ns = ''
    while line ~= -1
        %ns = strcat(ns,fgetl(fid))
        ns = strcat(ns,line);

        line = fgets(fid);
        %PUT YOUR IMPLEMENTATION HERE
    end
        ns = lower(ns)
        ns = replace(ns,{',','.',':',';','â', '/', '(','('},' ')
    
    disp('here is cellllllllllllllllllllllll')
    [token, remain] = strtok(ns);

    co = any(ismember(stopword, token));
        if co == 0
            voc{globalCounter} = token;
            globalCounter = globalCounter +1;
        end 
    for i =1:100;
        [token, remain] = strtok(remain);        
        co = any(ismember(stopword, token));
        if co == 0
            if (token ~="")
                voc{globalCounter} = token;                
                globalCounter = globalCounter +1;
            end
        end 
    end
   % disp(c)

    fclose(fid);
end
disp(voc)
