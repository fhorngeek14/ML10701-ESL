function [dictionary] = insertWord( dictionary, word )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
%     check = true;
%     for i = 1:size(dictionary)
%         if(strcmp)
%             if(i==1)
%                 dictionary = [word, dictionary(i:end)];
%             else
%                 dictionary = [dictionary(1:i-1), word, dictionary(i:end)];
%             end            
%             break;
%         end
%     end
%     if(~check)
%         dictionary = [dictionary(i:end), word];
%     end
    dictionary = [dictionary(1:end), word];
    sort(dictionary);
end

